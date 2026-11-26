# Changelog

Each release has a section. The newest release is first.

## Unreleased

### Added

- The map has the first three nodes of route R3: toric-fan (MMH8EFW2JT), toric-wall-relation (MMFAWNT87R) and toric-cone-theorem (MM6EHAYFKV), the combinatorial form of the toric cone theorem. S39, the toric MMP, uses the cone theorem.

## v0.0.2 - 2026-11-26

### Changed

- `records/lean.json` is the record of the build of mmp-lean v0.0.2 at commit 4d7b358.

### Fixed

- Spec 01.1 and 01.4 give the lc abundance of BWX for $p>42$ as a claim, as its claim record C9 does. Spec 01.1 gives the LSC of mlds in dimension at most 3 as proved (Ambro). Spec 13.3 uses the node MMXCD16PTN of S52 in its example, in place of a name that is not in the map.

### Added

- `records/fidelity.json` has its first four entries, written with `mmp fidelity set`. Each check marked true is a theorem of mmp-lean at commit 039551d. F1 comes from `records/lean.json`.
  - S04 `ConeTheoremKlt`: F2 by `pointModel_coneDecomposition`, the point is a projective klt pair and its cone of curves is decomposed. F3 by `affineLinePair_one_not_isKlt`, the pair (𝔸¹, [0]) is not klt.
  - S05 `ConeTheoremLc`: F2 by `pointPair_isLc` and `pointModel_coneDecomposition`. F3 by `affineLinePair_two_not_isLc`, the pair (𝔸¹, 2[0]) is not lc.
  - S20 `Termination`: F2 by `pointModel_terminates` and `pointVariety_dim`, the point is an lc pair of dimension 0 with no infinite sequence of flips. F3 by `exists_finite_program`, which shows that "some program is finite" is trivial, and by `affineLinePair_two_not_isLc`.
  - S22 `TerminationLc4Rational`: F3 by `exists_finite_program` and `affineLinePair_two_not_isLc`. F2 is not passed. The point has dimension 0, so it is not an instance of a statement about 4-folds.
- The klt, lc, terminal, canonical and dlt instances on the point (`pointPair_isKlt`, `pointPair_isLc`, `pointPair_isTerminal`, `pointPair_isCanonical`, `pointPair_isDlt`) check definitions. The record has entries for statements only, so they are named here and not in the record. F2 of the pair (𝔸¹, 0) is not proved and is not marked.
- `records/trust.json` is made again. Row Q5 says that 4 statements have an entry in `records/fidelity.json`. None passes, because F4 and F5 are not run.

### Fixed

- `records/trust.json` is made again from the current records. Its rows Q0 and Q1 read `records/lean.json` of mmp-lean v0.0.1, and the notes no longer say that the file is missing.

## v0.0.1 - 2026-11-26

### Changed

- `records/lean.json` is the record of the build of mmp-lean v0.0.1 at commit 6e779d0.

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
- `scripts/release.sh`, which releases one version of mmp, mmp-agent, mmp-lean and mmp-handbook in sync. The handbook release pins the release commits of mmp and mmp-lean, and its tag builds the PDF and EPUB books.
- The deploy workflow for mmp.tamnd.com, and the files README, CITATION, CONTRIBUTING and SECURITY.

### Fixed

- The record of the first E2 run has the commit of mmp-agent that made it, and the host `darwin/arm64` in place of the name of the machine. The outputs and their hashes are the same.
- The page `/audit/` has no hand-written state of the steps. The tables of the page show the state from `records/audit.json`.
