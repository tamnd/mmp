# Changelog

Each release has a section. The newest release is first.

## Unreleased

### Added

- The spec of the project, files 00 to 16, in `docs/spec/`.
- The map: 60 nodes for the statements S01 to S60 of spec 06.2, in `blueprint/nodes/`. No node has a Lean statement yet.
- The routes R1 to R9 of spec 04 in `blueprint/routes.yaml`, and the milestones S0 to S9 of spec 15 in `blueprint/milestones.yaml`.
- 21 paper records in `papers/`, from the data of spec 07. The read tags [S] and [U] of the spec are kept. No person has read a source for the records yet.
- `records/lean.json`, the record of the first build of mmp-lean at commit a577b5a. The 14 statements of S0 are in Lean: 7 are `stated`, 6 are `open`, and S22 is `claimed`.
- 16 claim records for the fresh claims of spec 01.3, in `claims/`. One claim (arXiv:2611.30971) has the status withdrawn.
- The audit of AxiomMath/MMP at commit 1f9ade3670 in `audit/axiom-mmp/`: the inventory of step A1 (in progress, the build is not done) and the plan of step A2 (not started).
- `records/audit.json` with the state of the steps A1 to A8. The other records are reset to the S0 state.
- The lab spec of experiment E2 in dimension 3, and its first run to index 40, in `lab/`.
- The pages of the site: home, program, statements, map, audit, trust, routes, papers, learn, handbook, code and about.
- The deploy workflow for mmp.tamnd.com, and the files README, CITATION, CONTRIBUTING and SECURITY.

### Fixed

- The record of the first E2 run has the commit of mmp-agent that made it, and the host `darwin/arm64` in place of the name of the machine. The outputs and their hashes are the same.
- The page `/audit/` has no hand-written state of the steps. The tables of the page show the state from `records/audit.json`.
