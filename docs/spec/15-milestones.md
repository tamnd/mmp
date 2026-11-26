# 15. Milestones

Each milestone has a goal, exit criteria and a release. A tool can check each exit criterion, or a named person signs it. The dates are targets set on 2026-11-26. The levels G1 to G6 are those of 02.3, the statements S01 to S60 those of 06.2, the tiers T0 to T11 those of 07, the routes R1 to R9 and the audit steps A1 to A8 those of 04, and the experiments E1 to E10 those of 13.

The milestone column of 06.2.2 gives, for each statement, the milestone by which it is `stated`. The table below does not repeat that list. "The S2 statements" means the statements whose column says S2 or earlier.

| Milestone | Target | Goal | Exit criteria | Release |
|---|---|---|---|---|
| S0 | 2026-12-20 | the four repositories, the first statements, the site, the audit started | the repositories exist (after the owner confirms, 00 decision 12); `MinimalModel/Statements/Basic.lean` (06.1) builds at the pin with no `sorry`; the S0 statements are `stated`, and F1 to F3 pass for S04, S10, S11, S12, S20, S22 and S33; `mmp index`, `mmp status`, `mmp port check` and `mmp site build` work; mmp.tamnd.com shows `/program/`, `/statements/`, `/map/`, `/audit/` and `/trust/`; audit steps A1 and A2 done; `MinimalModel/Toric/Fan.lean` started on `PointedCone`; the letters of Q-03, Q-05 and Q-09 sent; Palomar registration asked (Q-14) | mmp v0.1.0, mmp-lean v0.1.0, mmp-agent v0.1.0 |
| S1 | 2027-02-28 | the vocabulary, the audit index, the first claim check | the first toolchain bump, to `v4.36.0`, for `MinimalModel` and the bridge together (09.3, Q-07); the S1 statements `stated`, F1 to F5 for the S0 statements; audit steps A3 (two kernels) and A4 (definition index) done; the fan, cone and divisor files of route R3 build; the claim records of 01.3 written by the `reader` role, with the first plans; the Ajit check (S57, E3) done and the letter sent; E1 run | v0.2.0; handbook Vol. 0 and P0 drafted; Vol. 17, first dated report |
| S2 | 2027-04-30 | the toric cone theorem, most statements written | `MinimalModel.Toric.toricConeTheorem` proved (Q0 to Q4 **yes**); the S2 statements `stated`; audit step A5 at half of the ranked definitions; the first measurement of cost per proved node and per audited definition; the eval sets of 10.9 in use; E2 run in dimension 3; the outlines of P7 and P8, and the new page estimates of Volumes 1, 5 and 6 (Q-20) | v0.3.0; Vol. 0 released; P1 to P3, Vol. 3 and Vol. 4 Ch. 1 to 3 drafted |
| S3 | 2027-06-30 | the audit closes; the S22 decision | audit steps A5, A6, A7 and A8 done, with the public report after the 30 days of 14.4; the bridges of O-R2-2 and O-R2-3 build; S22 is `proved-ext` with Q9 **yes**, or stays `claimed` with a public list of findings; `MinimalModel.shokurovLemma` (O-R4-1) proved; the S3 statements `stated`; E2 run in dimension 4 to index 6, and the plan for index 12 (Q-22); the review of Target T and its backups (04.12) | v0.4.0; P0 released; Vol. 16, first dated report; P4, P5, Vols. 1, 2 drafted |
| S4 | 2027-09-30 | the toric MMP | `MinimalModel.Toric.flipExists`, `terminationOfFlips` and `mmp` (S39) proved, with Q0 to Q5 **yes**; the toric library under 40k lines, or the cut of 02.6 made; all 54 G1a statements `stated` and through F5 (06.2.2), and F6 by two reviewers for the open ones; the S4 statements `stated`; the first R1 report: one self-contained part of a 2026 claim checked, with Q10; E9 run with F2 instances from the Lean toric code | v0.5.0; P1 to P3 and Vol. 3 released; P7, P8, Vols. 4, 5 drafted |
| S5 | 2027-12-31 | the surface program on Mathlib, the Han-Liu reduction | `MinimalModel.Surface.castelnuovo` and `MinimalModel.Surface.minimalModel` proved or `proved-mod` with at most five named hypotheses; S29 `HanLiuReduction` `proved-mod`; tiers T1 and T3 at least 70% `proved`, `proved-mod` or `proved-ext`; G2 met (02.3) | v1.0.0; P4, P5, Vols. 1, 2 released; P6, Vols. 6, 7 drafted |
| S6 | 2028-04-30 | the scheme dictionary and the last statements | $X_\Sigma$ as a Mathlib `Scheme`, and the comparison of the toric notions with the general ones of 06.1 (04.4, step 9); the two G1b statements left, S59 and S60, `stated` (G1 met when they are `faithful`); the foliation and Kähler vocabulary of routes R8 and R9 | v1.1.0; P7, P8, Vol. 4 released; Vols. 8, 9 drafted |
| S7 | 2028-08-31 | the first research result (G4, toward G5) | Target T (S52, the toric case) proved or refuted in Lean, with a preprint that an outside expert has read; or another node on a route of 04 of the size of a paper lemma; three claims of 01.3 with a checked part | v1.2.0; P6, Vols. 5, 6, 7 released; Vols. 10, 11 drafted |
| S8 | 2028-12-31 | the library (G3, first part) and the claims (G4) | tiers T1 to T6 at least 90% `proved`, `proved-mod` or `proved-ext`; tiers T7 to T9 `stated`; five claims of 01.3 with a checked part (G4); at least three partial results on the open targets of 04 | v1.3.0; Vols. 8, 9 released, so P0 to P8 and Vols. 0 to 9 are out; Vols. 12, 13 drafted |
| S9 | open | an open case (G5) | a named open target of 04 proved in Lean, with all trust rows **yes**, and a refereed paper or an expert letter | v2.0.0; Vols. 10 to 15 as reviewers sign them |

The research routes run from S0 on, in parallel with the library.
- Route R2 (the audit) runs from S0 and closes at S3. It has a fixed share of the budget until then (10.6).
- Route R1 starts at S0 with reading only. The `reader` role builds the claim records of 07.13, and the lab tests the explicit numbers of the claims (E1, E3, E10).
- Route R3 (toric) is the main library work from S0 to S4.
- Routes R4 to R9 start with their statements and reductions, and they take a larger share of the budget after S4.
- Each milestone report says what each route found, including the negative results.

## 15.1 What can slip and what cannot

- **The statements and the trust tooling (S0, S1) cannot slip.** Every later result depends on them.
- **The audit (S3) cannot slip by more than one milestone.** S22 is the largest fresh claim in the field (01.3). The audit is useful only while the question is open. If A5 is too large for the readers the project has, the audit report says which definitions were read in full and which were sampled, and Q9 stays **open** for the sampled part.
- **The order of the library can change.** If the cone and fan lemmas land in Mathlib early (the pull requests of 09.5), S2 is shorter. If the scheme layer of TauCeti or of the AxiomMath/Stacks port is cheaper than expected, S6 moves before S5.
- **S4 is the largest risk of the library.** No Lean project has fans or a toric MMP (01). The plan budgets five months, and the cut of 02.6 (simplicial fans and the cone theorem only) is ready.
- **S5 depends on hypotheses.** Coherent cohomology, Serre duality and Riemann-Roch for surfaces are not in Mathlib (05). The surface program is `proved-mod` if they are still hypotheses. In that case the release says so in its first line.
- **S7 is a research milestone.** If no route gives a new result by then, the milestone report says so. The project then plans again with the experts (02.6).
- **The handbook can slip, in its own order** (11.10). If the writing takes twice the planned time, P0 to P8 and Volumes 0 to 8 come first, and Volumes 15 to 17 become surveys (02.6).

## 15.2 The budget

- **Agent budget.** It starts at 200 dollars a day (10.6). The owner raises it when the measured cost per proved node and per audited definition (S2) shows that it pays.
- **Machines.**
  - The bridge runner (64 GB, 09.4) builds AxiomMath/MMP once a day and on each change to `bridge/`. A cold build takes about 6 hours [U]. It is the largest machine cost until S3.
  - The lab machine (32 cores, 13.6) is rented by the month from S1 on.
  - The trust workflow and the weekly replay in two kernels run on rented time for a few hours each week.
- **People.** The audit (A5, A6), F6 and the handbook reviews need people. The letters of Q-05 and Q-19 ask for them at S0. The plan assumes four readers for the audit and one reviewer per core volume. If fewer answer, the audit samples more and the handbook releases later. The exit criteria do not change.
- **First measurements.** The cost per node and per audited definition (S2) and the core hours of E2 (S3) are exit criteria, so that the later plan rests on numbers.
