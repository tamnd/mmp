# 02. The goal

## 2.1 The goal in one sentence

State the whole minimal model program in Lean with faithful definitions, prove the known theory in an order that leads to the open parts, check the fresh claims of 2025 and 2026, work on the open conjectures in public with honest status, and teach all of it in a handbook that starts at first algebra.

## 2.2 Why now

1. **The vocabulary is almost reachable.** Mathlib at the pin has schemes, proper morphisms, birational maps, Weil divisors as cycles, the order of vanishing, `Proj`, sheaf cohomology and convex cones (01.11). The missing layer (Cartier divisors, the Picard group, ampleness, intersection numbers) is in open PRs, in TauCeti and in AxiomMath/Stacks. The project can state the MMP now and replace the missing parts by named definitions with fidelity checks.
2. **A Lean MMP exists and nobody has read it.** AxiomMath/MMP (01.12) claims the MMP for lc pairs in dimension at most 4. An audit by people with a textbook beside them is a new kind of contribution. It can turn a claim into a theorem in months, not years.
3. **The field has more claims than referees.** Hashizume, OpenAI 034, J. Liu, Hu-Liu and Hacon-Wang (01.3) all claim major parts of the program in 2026. A formal check of their finite or combinatorial parts is useful to the field now, and in five years it will be routine.
4. **One conjecture fell in a way that Lean can check.** Ajit's counterexample is a finite computation on a quotient of $E^4$. It is a good first formal result: small, new and certain.
5. **The sibling projects give the tools.** Spec 2161 and spec 2161l built the map, the ledger, the trust rows, the site and the agent roles. This project copies them and changes the mathematics.
6. **No book teaches the modern program.** Students learn BCHM from papers and seminar notes (01.14). A handbook with one notation and a path from first algebra is useful whatever happens to the conjectures.

## 2.3 Levels of success

The levels are independent. A level can be reached before a lower one is complete. The site reports each one separately (12.2).

| Level | Name | What it means | Measured by |
|---|---|---|---|
| G1 | State the program | the 60 statements of 06.2 are in Lean, each with a fidelity record that passes F1 to F7 | the count of nodes with status `faithful`; the target is 60 of 60 |
| G2 | First full proofs | the toric MMP (cone, contraction, flips, termination) and the first surface results are proved on Mathlib alone; the AxiomMath/MMP audit steps A1 to A8 are complete with a public report | the count of `proved` nodes in tiers T1 and T2, and the audit report |
| G3 | The known theory | the theorems of tiers T1 to T9 of 07 are stated and proved, by the project or by a bridge to an audited source; the handbook volumes P0 to P8 and 0 to 12 are released | the count of `proved` and `proved-mod` nodes per tier; the handbook releases |
| G4 | Fresh claims and partial results | at least five claims of 01.3 have a formal check of a substantial part; the 4-fold termination of AxiomMath/MMP passes the audit and two kernels; at least three new partial results on the open targets of 04 | the claim records with status `checked` or `refuted`; the papers or notes of the project |
| G5 | One open conjecture in a new case | a case of an open conjecture that the literature does not contain, proved in Lean and accepted by experts (for example the cone conjecture for one class of CY 3-folds, or ACC for mlds in a new class of 3-fold germs) | a refereed paper or an expert letter, and the Lean proof |
| G6 | A central conjecture | termination in dimension 5, abundance in dimension 4, or non-vanishing in dimension 4, proved and formalized | the same |

G1 to G3 are engineering with a known end. G4 is research with a good chance in two years. G5 is a research bet. G6 is a research bet that the project does not plan to win, and it is on the list so that work toward it has a name.

## 2.4 The meaning of "all"

The request was to solve all open problems of the MMP. The spec reads it as three commitments.

1. **State all of it.** Every open conjecture of the program that has a precise form gets a Lean statement with a fidelity record (06.2). The list follows report D: termination, existence of minimal models, abundance, non-vanishing, generalized abundance, b-semiampleness, Iitaka, ACC and LSC for mlds, $\mathrm{mld}\le\dim$, Fujita, effective non-vanishing for $\nu=3$, CY boundedness, the index conjecture, the cone conjecture, the strong Sarkisov program, the dual complex conjecture, and the char $p$ and Kähler forms. A conjecture without a precise form (for example "the MMP for foliations in all dimensions") gets a documented reason and a partial statement.
2. **Prove what is known, in an order that leads to the open parts.** The order follows the reduction graph of 03.11. A proof of a known theorem is chosen when it is a step toward an open target, or when the handbook needs it.
3. **Work on the open parts in public with honest status.** Each open target has a route (04), a weight, a ledger of attempts and a status that only the build can change. A claim of the project is published only after the disclosure rule of 14.4. A failure is published as a failure.

"All" also includes the learner. Every node that the map has, the handbook explains, with the prerequisites it needs (11).

## 2.5 Non-goals

1. **Not a reproof of AxiomMath/MMP.** The project does not write a second 2-million-line proof of the 4-fold MMP (05.2).
2. **Not a race with AI labs.** The project checks, audits and teaches. A lab result that is correct is a gain for the project, and it gets full credit on the site.
3. **Not a general algebraic geometry library.** The project upstreams what Mathlib wants (09.5), and keeps the rest small. It ports single files and writes only what the MMP needs.
4. **Not a replacement for referees.** A Lean check of part of a paper is evidence, not acceptance. The claim records say which part was checked.
5. **Not resolution of singularities.** That is spec 2161. The project uses one shared `Prop` for it (06.1).
6. **No promise on G5 and G6.** The weights in 04 are bets, and the milestones in 15 do not depend on them.

## 2.6 What would show the plan is wrong

| Signal | What it would mean | Response |
|---|---|---|
| The audit finds that a central AxiomMath/MMP definition is wrong (for example `IsLcPair` lets non-normal $X$ pass, or `IsMaximal` holds for a program that stops early) | R2 cannot close T(4); the kernel check proves a different statement | publish the finding after 14.4; move weight from R2 to R3 and R4; ask Axiom for a fix |
| The toric MMP takes more than 40k lines by S4 | Mathlib's cone API is not ready, or the plan is too wide | cut to simplicial fans and the cone theorem; upstream the cone lemmas first |
| No expert answers the letters of S0 by S2 | the project has no human review for F6 and Q7 | use the sibling projects' reviewers; slow the claim checks; publish fewer claims |
| Mathlib adds Cartier divisors and ampleness with a different design | the vocabulary of 06.1 needs a rewrite | the bridge pattern of 06.4 absorbs it; rewrite in one milestone |
| Three or more of the fresh claims in 01.3 fail in the first year | route R1 is more valuable than planned, and the claims are less trustworthy | raise the R1 weight; publish the method |
| The handbook volumes take twice the planned time | the writer role is not good enough, or the plan is too large | release P0 to P8 and 0 to 8 first; cut 15 to 17 to surveys |
