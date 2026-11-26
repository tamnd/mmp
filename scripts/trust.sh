#!/bin/sh
# Write the trust report records/trust.json for the commit of mmp-lean in records/lean.json.
#
# Usage: scripts/trust.sh
#
# The clones mmp, mmp-agent and mmp-lean must be side by side. The script does these steps:
#   1. It finds the tag of mmp-lean at the commit of records/lean.json. The release script makes this tag.
#   2. It runs the workflow trust of mmp-lean at the tag, and waits for it. The run takes about one hour.
#   3. It copies the artifact replay-record of the run to records/replay.json.
#   4. It runs mmp trust with a checkout of mmp-lean at the tag, so the rows Q0 to Q4 are of one commit.
#   5. It opens a PR with records/replay.json and records/trust.json, with the labels area/trust and type/chore, and merges it.
set -eu

ROOT=$(cd "$(dirname "$0")/../.." && pwd)
OWNER=tamnd
TMP=$(mktemp -d)
trap 'git -C "$ROOT/mmp-lean" worktree remove --force "$TMP/lean" 2>/dev/null || true; rm -rf "$TMP"' EXIT

cd "$ROOT/mmp"
git switch -q main
git pull -q --ff-only
if [ -n "$(git status --porcelain)" ]; then echo "mmp has local changes" >&2; exit 1; fi
COMMIT=$(python3 -c 'import json; print(json.load(open("records/lean.json"))["commit"])')
git -C "$ROOT/mmp-lean" fetch -q --tags origin
TAG=$(git -C "$ROOT/mmp-lean" tag --points-at "$COMMIT" | grep '^v' | sort -V | tail -1)
if [ -z "$TAG" ]; then echo "mmp-lean has no release tag at $COMMIT, the commit of records/lean.json" >&2; exit 1; fi
echo "mmp-lean $TAG at $COMMIT"

# 2. The trust run at the tag.
gh workflow run trust.yml -R "$OWNER/mmp-lean" --ref "$TAG"
run=""
while [ -z "$run" ]; do
  sleep 15
  run=$(gh run list -R "$OWNER/mmp-lean" --workflow trust.yml --commit "$COMMIT" --event workflow_dispatch --limit 1 --json databaseId,status --jq '.[] | select(.status != "completed") | .databaseId')
done
echo "waiting for the trust run $run"
gh run watch "$run" -R "$OWNER/mmp-lean" --interval 120 >/dev/null || true

# 3. The replay record. A failed check is in the record, and mmp trust then gives the answer no.
gh run download "$run" -R "$OWNER/mmp-lean" -n replay-record -D "$TMP/replay"
cp "$TMP/replay/replay.json" records/replay.json

# 4. The trust report.
git -C "$ROOT/mmp-lean" worktree add -q --detach "$TMP/lean" "$TAG"
cd "$ROOT/mmp-agent"
go build -o "$TMP/mmp" ./cmd/mmp
cd "$ROOT/mmp"
status=0
"$TMP/mmp" trust -content . -lean "$TMP/lean" || status=$?

# 5. The PR.
if [ -z "$(git status --porcelain records)" ]; then echo "the trust report did not change"; exit "$status"; fi
B="trust-$TAG-$(date +%Y%m%d)"
git switch -q -c "$B"
python3 - "$TAG" "$(echo "$COMMIT" | cut -c1-7)" <<'PY'
import sys
v, c = sys.argv[1], sys.argv[2]
s = open("CHANGELOG.md").read()
line = f"- `records/replay.json` and `records/trust.json` are of the trust run of mmp-lean {v} at commit {c}.\n"
head = "## Unreleased\n"
i = s.index(head) + len(head)
rest = s[i:]
if rest.startswith("\n### Changed\n\n"):
    s = s[:i] + "\n### Changed\n\n" + line + rest[len("\n### Changed\n\n"):]
else:
    s = s[:i] + "\n### Changed\n\n" + line + rest
open("CHANGELOG.md", "w").write(s)
PY
git add records/replay.json records/trust.json CHANGELOG.md
git commit -q -m "Trust: the report of mmp-lean $TAG"
git push -q -u origin "$B"
printf '## Summary\n\nThe trust report of mmp-lean %s at commit %s, from the trust run %s.\n\n## Milestone\n\nRefers to the trust table of spec 14.\n\n## Checks\n\n- `mmp trust -content . -lean` with a checkout of the tag.\n' "$TAG" "$COMMIT" "$run" > "$TMP/body.md"
gh pr create -R "$OWNER/mmp" --title "Trust: the report of mmp-lean $TAG" --label area/trust --label type/chore --body-file "$TMP/body.md"
gh pr merge "$B" -R "$OWNER/mmp" --squash --delete-branch
git switch -q main
git pull -q --ff-only
exit "$status"
