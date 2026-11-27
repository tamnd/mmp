# Changelog

Each release has a section. The newest release is first.

## Unreleased

### Added

- The lab spec `e2-simplicial-mld-4` runs E2 in dimension 4 to index 6 over all simplicial toric germs, cyclic or not, isolated or not, with the family `simplicial` of mmp-agent in dimension 4 (mmp-agent #17). Its run is in `lab/runs`: 81 germs (3, 7, 16, 18 and 37 for the indices 2 to 6), with no mismatch. The isolated cyclic germs agree with the family `cyclic` of dimension 4, and the germs with a zero coordinate are the 3-fold germs of `e2-simplicial-mld-3` times a line. The run took 0.006 s. This is the measurement of Q-22, and spec 13.6.1 gives the plan for index 12: index 12 takes 0.03 s, so it runs on any machine. Spec 13.6 and the row of Q-22 have the measured times.
- `records/fidelity.json` has entries for eight more statements, from the theorems of `MinimalModel/Fidelity` in mmp-lean (#21, #22, #25). F2 holds for `KleimanCriterion` and `MinimalModelConj` (in dimension 0, the point is its own minimal model). F3 holds for `LengthOfExtremalRays`, `HanLiuEncACC`, `NotEffectiveNonVanishing4`, `Castelnuovo`, `SurfaceConeTheorem`, `SurfaceMMP` and `MinimalModelConj`: each variant without one hypothesis or one conclusion is proved trivially in Lean, so each clause of the statement does some work. F2 for S10, S11 and S12 needs a smooth projective surface with its intersection data in Lean, and it stays open. No statement passes yet, because F4 and F5 need the agents `refuter` and `explainer`.
- The workflow `audit-build` does steps A1, A2 and A4 of the audit of AxiomMath/MMP (spec 04.3) on the standard runners of GitHub. It builds the pinned commit in runs of at most 290 minutes, keeps the partial build in the cache between the runs, and starts each next run itself. The last run records the manifest, the hash of every `.olean`, the time and the memory, and runs `audit/axiom-mmp/A2.lean` (`#print axioms` on the seven theorems) and `audit/axiom-mmp/A4.lean`. A4 writes the definition index: each definition, structure, class and instance of AxiomMath/MMP and AxiomMath/Stacks in the closure of the seven statements, without the proofs, with its file, line and depth.
- The first run of the eval sets: `records/eval/2026-11-26-baseline-faithful.json`, from `mmp agent eval` of mmp-agent with the runner `constant:faithful`, which needs no model. It scores 50/100 on the statements and 30/60 on the audit at a cost of $0, the floor for a model run. `eval/README.md` lists the runs. The workflow `eval` of mmp-lean elaborated 357 of the 360 Lean texts of the sets. The tasks T004, T040 and T167 did not elaborate, and they are replaced by the next tasks of the order that pass the rules of the README.
- The runs of the lab specs `e2-cyclic-quotient-mld-3` and `e2-simplicial-mld-3` are made again with mmp-agent v0.0.4-5, where the family cyclic counts only the primitive points of the box (mmp-agent #16). The count `enc` of the family cyclic goes up from 25 to 88 germs to index 40, where 1/7(1, 1, 1), for example, has one divisor of log discrepancy at most 1 and not two. The two families now agree germ for germ on this count, so the note on the old count is gone from the summary of the simplicial run. The other outputs of the simplicial run are the same.
- The eval sets of spec 10.9 are in `eval/`: 200 Lean tasks with known answers (`eval/tasks`, 170 from Mathlib v4.35.0 and 30 from mmp-lean), 50 informal statements with the reviewed Lean statement and a planted wrong one (`eval/statements`), and 60 definitions with their reference, 30 with a planted difference (`eval/audit`). `eval/README.md` gives the format. `scripts/eval.py` checks the format, elaborates the Lean texts in mmp-lean (workflow `eval` there), and scores the answers of a runner with the pass rate and the cost. The lint workflow runs the format check.
- `records/fidelity.json` has an entry for `MinimalModel.Toric.ToricConeTheorem`, the statement of the S2 top theorem. F1 comes from `records/lean.json`. F2 and F3 are theorems of `MinimalModel/Fidelity/ToricCone.lean` (mmp-lean #23): on ℙ², the nef divisor `-K` has a nonnegative wall degree, `K` is not nef, and the variants with the degree at most 0 or more than 0 are false. The statement does not pass yet. F4 and F5 need the agents `refuter` and `explainer`, and F6 needs two reviewers.
- The lab spec `e2-simplicial-mld-3` runs E2 in dimension 3 over all simplicial toric germs to index 1200, cyclic or not, isolated or not, and its run is in `lab/runs`. The run of `e2-cyclic-quotient-mld-3` stays.
- The node finiteness-of-models (MM8GY5VB02) records the Lean statement S34 `FinitenessOfModels` of mmp-lean, BCHM Theorem E with a general ample divisor written out through linear systems and very general members over an uncountable field. Its statement and the S34 row of spec 06 and of the site now speak of weak log canonical models over $\mathcal{L}_A(V)$, as Theorem E does, and the vocabulary of the row is partial (linear systems).

### Changed

- Spec 11.2, 11.4, 00 and Q-20: Volumes 1, 5 and 6 are measured again from the outlines of P7 and P8 in mmp-handbook (#43 there). The new estimates are 220, 210 and 200 pages, down from 320, 340 and 300. Volumes 0 to 17 now total about 5,890 pages, and the whole handbook about 9,940.
- `records/replay.json` and `records/trust.json` are of the trust run of mmp-lean v0.0.4 at commit 600aa92.

### Fixed

- Spec 14.2 and 15 name the toric cone theorem `MinimalModel.Toric.toricConeTheorem`, the proof of the pinned statement `ToricConeTheorem`. The name `MinimalModel.Toric.coneTheorem` does not exist in mmp-lean. `records/trust.json` is written again from the same records with mmp-agent #13, and the trust report now finds the theorem: proved, with Q0 to Q4 yes.

## v0.0.4 - 2026-11-26

### Changed

- `records/lean.json` is the record of the build of mmp-lean v0.0.4 at commit 600aa92.

### Added

- `scripts/trust.sh` runs the workflow trust of mmp-lean at the release tag of `records/lean.json`, copies its replay record to `records/replay.json`, and writes `records/trust.json` with `mmp trust`. The node of the toric cone theorem names the pinned statement `MinimalModel.Toric.ToricConeTheorem` and its proof `MinimalModel.Toric.toricConeTheorem`.

### Fixed

- S52 and S29 now speak of the global mlds of enc pairs with coefficients in a finite set, as Han-Liu Conjecture 1.9(2') and Theorem 1.1 do. They spoke of germs before. Spec 04, 13 and 14 follow.
- The sources of S14, S29, S31, S43 and S45 are checked against the arXiv copies. S43 cites Gongyo, arXiv:1101.1394, Theorem 6.1 and Lemma 6.2, not Theorem 1.2. S45 cites the Generalised Abundance Conjecture of Lazić and Peternell, which the arXiv copy does not number, and asks for a rational boundary, a nef Cartier L and a semiample Q-divisor. The source of S34 is BCHM Theorem E, and its note says why no form without a general ample divisor is a result of BCHM.

## v0.0.3 - 2026-11-26

### Changed

- `records/lean.json` is the record of the build of mmp-lean v0.0.3 at commit 591c8a5.

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
