## What this changes

Write one or two sentences.

## Milestone

Refers to #

## Checks

- [ ] `python3 scripts/style.py` prints nothing.
- [ ] `mmp check -content .` passes, when the change touches `blueprint/`, `papers/` or `claims/`.
- [ ] `mmp trust` was run again, when the change touches `records/`.
- [ ] A change to `audit/axiom-mmp/` does not make public a finding of severity 1 or 2 before its 30 days (spec 14.4).
- [ ] `CHANGELOG.md` has a line for each change that a reader can see.
- [ ] The pull request has one `area/*` label and one `type/*` label.
