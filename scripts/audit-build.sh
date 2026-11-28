#!/usr/bin/env bash
# The steps of the workflow audit-build: steps A1, A2 and A4 of spec 04.3 on AxiomMath/MMP.
#
#   audit-build.sh room            free disk space on the runner and add swap
#   audit-build.sh build MINUTES   run lake build in src/ for at most MINUTES minutes
#   audit-build.sh record          after a full build: the hashes, the manifest, A2 and A4
#
# The build of AxiomMath/MMP is longer than one job of 6 hours on a standard runner. So each run builds for at most MINUTES minutes, the workflow saves the partial build in the cache, and the next run goes on from it. Lake rebuilds a module only when its trace changes, so a module that one run built is not built again.
#
# The step build writes done=true, done=false or failed=true to $GITHUB_OUTPUT, and the time and memory of the segment to out/segment.txt.
set -euo pipefail

OUT=${OUT:-out}
mkdir -p "$OUT"

case "${1:-}" in
room)
  df -h / | tail -1
  sudo rm -rf /usr/share/dotnet /usr/local/lib/android /opt/ghc /opt/hostedtoolcache/CodeQL /usr/local/share/boost /usr/share/swift
  sudo docker image prune --all --force >/dev/null 2>&1 || true
  sudo swapoff -a || true
  sudo fallocate -l 16G /swapfile2
  sudo chmod 600 /swapfile2
  sudo mkswap /swapfile2 >/dev/null
  sudo swapon /swapfile2
  df -h / | tail -1
  free -g
  ;;
build)
  minutes=${2:?minutes}
  command -v /usr/bin/time >/dev/null || sudo apt-get install -y time >/dev/null
  cd src
  start=$(date +%s)
  # A lean process that runs out of memory should be killed before the runner agent is, so that the partial build is still saved.
  # Run 45961027917 lost the runner after 53 minutes even with oom_score_adj, because the machine thrashed in swap before the kernel killed anything.
  # So the build runs in a systemd scope with a hard memory limit: the kernel kills a lean process inside the scope, and the runner agent outside it keeps its memory.
  # The default OOMPolicy=stop of a scope stops the whole scope after the first kill. Segments 2 and 3 ended that way after 341 and 424 seconds, with status 124 and no time.txt, so the scope keeps running after a kill.
  echo 1000 > /proc/self/oom_score_adj || true
  mem_kb=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
  limit_mb=$(( mem_kb / 1024 - 2048 ))
  scope=()
  if command -v systemd-run >/dev/null && sudo -n true 2>/dev/null; then
    scope=(sudo systemd-run --quiet --scope -p "MemoryMax=${limit_mb}M" -p MemorySwapMax=4G -p OOMPolicy=continue
      --uid="$(id -u)" --gid="$(id -g)" env PATH="$PATH" HOME="$HOME")
    echo "the build runs in a scope with MemoryMax=${limit_mb}M and MemorySwapMax=4G"
  fi
  set +e
  # Some modules need more memory than the runner has when lake builds them next to others: segments 6 and 9 lost the same ones to the OOM killer, and so their dependents never built.
  # Each module of audit/axiom-mmp/heavy.txt is built first, alone in the scope, so that it has all the memory. A module already built costs only the check of its trace.
  : > "../$OUT/build.log"
  if [ -f ../audit/axiom-mmp/heavy.txt ]; then
    grep -v '^#' ../audit/axiom-mmp/heavy.txt | while read -r m; do
      [ -n "$m" ] || continue
      left=$(( minutes * 60 - ($(date +%s) - start) - 600 ))
      [ "$left" -gt 0 ] || break
      echo "heavy module $m, alone, at most ${left}s" >> "../$OUT/build.log"
      "${scope[@]}" timeout -k 1m "${left}s" lake build "$m" >> "../$OUT/build.log" 2>&1
      echo "heavy module $m: status $?" >> "../$OUT/build.log"
    done
  fi
  left=$(( minutes * 60 - ($(date +%s) - start) ))
  [ "$left" -gt 60 ] || left=60
  "${scope[@]}" timeout -k 2m "${left}s" /usr/bin/time -v -o "../$OUT/time.txt" lake build >> "../$OUT/build.log" 2>&1
  status=$?
  set -e
  end=$(date +%s)
  cd ..
  sudo -n dmesg 2>/dev/null | grep -iE "out of memory|oom-kill|killed process" | tail -n 20 > "$OUT/oom.txt" || true
  built=$(grep -c "^✔ \[" "$OUT/build.log" || true)
  rss=$(grep "Maximum resident set size" "$OUT/time.txt" 2>/dev/null | awk '{print $NF}' || true)
  {
    echo "segment=${SEGMENT:-1}"
    echo "status=$status"
    echo "seconds=$((end - start))"
    echo "max_rss_kb=${rss:-unknown}"
    echo "lines_built=$built"
    echo "oom_kills=$(grep -ciE "killed process" "$OUT/oom.txt" || true)"
  } > "$OUT/segment.txt"
  cat "$OUT/segment.txt"
  tail -n 30 "$OUT/build.log"
  if [ "$status" -eq 0 ]; then
    echo "done=true" >> "$GITHUB_OUTPUT"
  elif [ "$status" -eq 124 ] || [ "$status" -eq 137 ]; then
    echo "done=false" >> "$GITHUB_OUTPUT"
  elif grep -qE "code 137|signal 9" "$OUT/build.log"; then
    echo "a lean process was killed, most likely for memory; the next segment goes on from the saved build"
    echo "oom=true" >> "$OUT/segment.txt"
    echo "done=false" >> "$GITHUB_OUTPUT"
  else
    grep -n "error" "$OUT/build.log" | head -n 40 || true
    echo "failed=true" >> "$GITHUB_OUTPUT"
  fi
  ;;
record)
  cd src
  git rev-parse HEAD > "../$OUT/commit.txt"
  cp lake-manifest.json "../$OUT/lake-manifest.json"
  cat lean-toolchain > "../$OUT/lean-toolchain"
  find .lake -name '*.olean' -type f | LC_ALL=C sort | xargs -d '\n' sha256sum > "../$OUT/olean.sha256"
  wc -l < "../$OUT/olean.sha256"
  du -sh .lake/build .lake/packages/*/.lake/build 2>/dev/null | tee "../$OUT/sizes.txt"
  cp ../audit/axiom-mmp/A2.lean ../audit/axiom-mmp/A4.lean .
  set +e
  lake env lean A2.lean > "../$OUT/A2-axioms.log" 2>&1
  echo "A2 exit $?" | tee -a "../$OUT/A2-axioms.log"
  lake env lean A4.lean > "../$OUT/A4.log" 2>&1
  echo "A4 exit $?" | tee -a "../$OUT/A4.log"
  set -e
  [ -f A4.json ] && cp A4.json "../$OUT/A4.json"
  cat "../$OUT/A2-axioms.log" "../$OUT/A4.log"
  ;;
*)
  sed -n '2,10p' "$0"
  exit 2
  ;;
esac
