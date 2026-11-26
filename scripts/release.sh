#!/bin/sh
# Release one version of the four repositories of the project, in sync.
#
# Usage: scripts/release.sh v0.0.2
#
# The four clones mmp, mmp-agent, mmp-lean and mmp-handbook must be side by side, on main, with no local change.
# The script does these steps:
#   1. mmp-lean: a release PR that moves the Unreleased section of CHANGELOG.md, then the tag and the release.
#   2. mmp-agent: the same. The workflow of the tag attaches the binaries.
#   3. mmp: the same, and the PR also copies records/lean.json from the build of the mmp-lean release.
#   4. mmp-handbook: the same, and the PR also pins EDITION to the release commits of mmp and mmp-lean.
#      The workflow of the tag builds the PDF and EPUB books and attaches them.
# Each PR has the labels release and type/chore, and the script merges it at once.
set -eu

V=${1:?usage: scripts/release.sh vX.Y.Z}
case $V in v[0-9]*.[0-9]*.[0-9]*) ;; *) echo "the version $V is not of the form vX.Y.Z" >&2; exit 2 ;; esac
DATE=$(date +%Y-%m-%d)
ROOT=$(cd "$(dirname "$0")/../.." && pwd)
OWNER=tamnd
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

for r in mmp mmp-agent mmp-lean mmp-handbook; do
  cd "$ROOT/$r"
  git switch -q main
  git pull -q --ff-only
  if [ -n "$(git status --porcelain)" ]; then echo "$r has local changes" >&2; exit 1; fi
  if git rev-parse -q --verify "refs/tags/$V" >/dev/null || git ls-remote --exit-code --tags origin "$V" >/dev/null 2>&1; then
    echo "$r has the tag $V already" >&2; exit 1
  fi
done

# Move the Unreleased section of CHANGELOG.md under the heading of the version.
bump_changelog() {
  python3 - "$V" "$DATE" <<'EOF'
import sys
v, d = sys.argv[1], sys.argv[2]
s = open("CHANGELOG.md").read()
if "## Unreleased" not in s:
    sys.exit("CHANGELOG.md has no Unreleased section")
s = s.replace("## Unreleased", f"## Unreleased\n\n## {v} - {d}", 1)
open("CHANGELOG.md", "w").write(s)
EOF
}

# Print the section of the version in CHANGELOG.md.
notes() {
  awk -v h="## $V - $DATE" '$0 == h {on = 1; next} on && /^## / {exit} on {print}' CHANGELOG.md
}

# Open the release PR of the current repository, merge it, then tag the merge commit and make the release.
release_repo() {
  repo=$1
  shift
  git switch -q -c "release-$V"
  bump_changelog
  git add -A
  git commit -q -m "Release $V"
  git push -q -u origin "release-$V"
  cat > "$TMP/body.md" <<EOF
## Summary

This PR releases $V of $repo. It moves the Unreleased section of CHANGELOG.md under the heading $V. The four repositories of the project have the release $V at the same time.

## Milestone

Refers to $OWNER/mmp#1 (S0). The four repositories have their releases in sync.

## Checks

- The release script \`scripts/release.sh\` of $OWNER/mmp made this PR.
EOF
  gh pr create -R "$OWNER/$repo" --title "Release $V" --label release --label type/chore --body-file "$TMP/body.md" "$@" >/dev/null
  gh pr merge "release-$V" -R "$OWNER/$repo" --squash --delete-branch
  git switch -q main
  git pull -q --ff-only
  git branch -q -D "release-$V" 2>/dev/null || true
  git tag -a "$V" -m "$repo $V"
  git push -q origin "$V"
  notes > "$TMP/notes.md"
  gh release create "$V" -R "$OWNER/$repo" --verify-tag --title "$repo $V" --notes-file "$TMP/notes.md" >/dev/null
  echo "$repo $V at $(git rev-parse --short HEAD)"
}

# 1. mmp-lean.
cd "$ROOT/mmp-lean"
release_repo mmp-lean
LEAN=$(git rev-parse HEAD)

# 2. mmp-agent.
cd "$ROOT/mmp-agent"
release_repo mmp-agent

# 3. mmp, with the record of the build of the mmp-lean release.
echo "waiting for the build of mmp-lean at $LEAN"
run=""
while [ -z "$run" ]; do
  run=$(gh run list -R "$OWNER/mmp-lean" --workflow build.yml --commit "$LEAN" --event push --limit 1 --json databaseId --jq '.[0].databaseId // empty')
  [ -n "$run" ] || sleep 15
done
gh run watch "$run" -R "$OWNER/mmp-lean" --exit-status --interval 30 >/dev/null
gh run download "$run" -R "$OWNER/mmp-lean" -n lean-record -D "$TMP/lean"
cd "$ROOT/mmp-agent"
go build -o "$TMP/mmp" ./cmd/mmp
cd "$ROOT/mmp"
"$TMP/mmp" index -content . -lean "$TMP/lean/lean.json"
"$TMP/mmp" check -content . >/dev/null
if [ -n "$(git status --porcelain records/lean.json)" ]; then
  python3 - "$V" "$(echo "$LEAN" | cut -c1-7)" <<'EOF'
import sys
v, c = sys.argv[1], sys.argv[2]
s = open("CHANGELOG.md").read()
line = f"- `records/lean.json` is the record of the build of mmp-lean {v} at commit {c}.\n"
head = "## Unreleased\n"
i = s.index(head) + len(head)
rest = s[i:]
if rest.startswith("\n### Changed\n\n"):
    s = s[:i] + "\n### Changed\n\n" + line + rest[len("\n### Changed\n\n"):]
else:
    s = s[:i] + "\n### Changed\n\n" + line + rest
open("CHANGELOG.md", "w").write(s)
EOF
fi
release_repo mmp --milestone "S0. Repositories, first statements, site and audit start"
MMP=$(git rev-parse HEAD)

# 4. mmp-handbook, pinned to the release commits.
cd "$ROOT/mmp-handbook"
python3 - "$V" "$MMP" "$LEAN" <<'EOF'
import re, sys
v, mmp, lean = sys.argv[1], sys.argv[2], sys.argv[3]
s = open("EDITION").read()
s = re.sub(r"(?m)^version .*$", "version " + v.lstrip("v"), s)
s = re.sub(r"(?m)^mmp .*$", "mmp " + mmp, s)
s = re.sub(r"(?m)^mmp-lean .*$", "mmp-lean " + lean, s)
open("EDITION", "w").write(s)
EOF
release_repo mmp-handbook

if command -v go >/dev/null; then go clean -cache; fi
echo "the release $V is done in the four repositories"
