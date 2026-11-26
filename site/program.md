---
title: The program
description: The minimal model program in short, what the literature proves and what is open on 2026-11-26, and the levels of success of mmp.
lead: The minimal model program is a program, not one conjecture. Its aim is to find, in each birational class, a model that is either minimal or a Mori fibre space, and then to understand that model.
---
## The program in short

Let $(X,\Delta)$ be a projective klt or lc pair over an algebraically closed field of characteristic 0. If $K_X+\Delta$ is nef, the pair is a minimal model. If it is not nef, the cone theorem gives a $(K_X+\Delta)$-negative extremal ray, and the contraction theorem gives its contraction $X \to Z$.

- If $\dim Z < \dim X$, the contraction is a Mori fibre space, and the program stops.
- If the contraction is birational and contracts a divisor, the program continues on $Z$.
- If the contraction is small, the program needs the flip $X^+ \to Z$, and it continues on $X^+$.

Three questions remain. Do flips exist? Does every sequence of flips terminate? When $K_X+\Delta$ is nef, is it semiample (abundance)? Flips exist in all dimensions for klt and lc pairs. Termination and abundance are open in dimension 4 and higher in refereed work.

## The words

The words of the program are defined in spec 03 of the project and in Volume 1 and Volume 4 of the handbook. The main ones are these:

- A **pair** $(X,\Delta)$ is a normal variety $X$ and an effective $\mathbb{R}$-divisor $\Delta$ such that $K_X+\Delta$ is $\mathbb{R}$-Cartier.
- The **log discrepancy** $a(E,X,\Delta)$ of a divisor $E$ over $X$ measures the singularity of the pair along $E$. The pair is **klt** if each log discrepancy is positive, and **lc** if each one is at least 0.
- The **minimal log discrepancy** $\mathrm{mld}(x;X,\Delta)$ is the smallest log discrepancy of a divisor with centre $x$.
- A **flip** of a small $(K_X+\Delta)$-negative contraction $X \to Z$ is a small contraction $X^+ \to Z$ with $K_{X^+}+\Delta^+$ ample over $Z$.

## What is proved and what is open

This table is the state of the literature on 2026-11-26, from spec 01 of the project. It is not the Lean state. The [map](/map/) gives the Lean state of each node. A claim of 2025 or 2026 is not refereed, and the project never uses one as a hypothesis.

| Area | Proved (selected) | Claimed in 2025 and 2026, not refereed | Open (selected) |
|---|---|---|---|
| Surfaces | the MMP, classification and abundance, in all characteristics | none | nothing central |
| 3-folds | the MMP, log flips, termination and abundance | none | effective bounds |
| Cone, contraction, vanishing | the cone, rationality, basepoint-free and contraction theorems for klt and lc pairs | none | nothing central |
| Flips | klt flips in all dimensions (BCHM, Hacon-McKernan); lc flips (Birkar, Hacon-Xu) | flips for all lc generalized pairs (Hu-Liu) | nothing central for usual pairs |
| Minimal models | klt pairs of log general type (BCHM); finite generation of the canonical ring | existence for lc generalized pairs is equivalent to termination with scaling (Hu-Liu) | lc pairs with $K+\Delta$ pseudo-effective, $\dim\ge5$ |
| Termination | T(3); terminal, canonical and pseudo-effective lc 4-folds; the MMP with scaling for big boundary (BCHM) | every MMP terminates for klt pairs with $\Delta$ or $K+\Delta$ big (Hashizume); $\dim\le5$ for big boundary (Han-Liu-Zhuang); all lc 4-folds with rational boundary (OpenAI 056, AxiomMath/MMP) | T(4) in refereed work; T(n) for $n\ge5$ without bigness |
| Abundance | $\dim\le3$; the big case; $\nu=0$; 4-folds with $\kappa>0$ | log abundance in all dimensions (OpenAI 034, contested); non-vanishing implies abundance (J. Liu) | 4-folds with $\kappa=0$ or $\kappa=-\infty$; non-vanishing in $\dim\ge4$ |
| Boundedness | BAB; complements; ACC for lct | $\mathrm{vol}\ge1/420$ for 3-folds of general type (Bie-Du-Yu) | Calabi-Yau 3-folds; the index conjecture in $\dim\ge4$ |
| mld | ACC for smooth and fixed 3-folds; toric germs (Ambro) | full LSC (Landi, withdrawn on 2026-11-24) | ACC and LSC for 3-folds; $\mathrm{mld}\le\dim$ |
| Effective results | Fujita freeness for $n\le5$ | a linear Fujita bound (Han); full Fujita (OpenAI 038) | Fujita freeness and very ampleness in general |
| Disproved | effective non-vanishing for $\nu(D)\ge4$ (Ajit); finite generation for generalized pairs (Liu-Wang) | | |

The [papers page](/paper/) has a record for each source that a node uses.

## The fresh claims

Spec 01.3 lists 17 claims of 2025 and 2026, C1 to C17. None is refereed. Each one has a claim record in `claims/` of [tamnd/mmp](https://github.com/tamnd/mmp). Route R1 checks a self-contained part of a claim in Lean. Route R2 audits the one claim that already has a Lean proof, AxiomMath/MMP. The project writes to the authors before a page about a check goes public.

## The levels of success

The levels are independent. A level can be reached before a lower one is complete.

| Level | Name | What it means |
|---|---|---|
| G1 | State the program | the 60 statements are in Lean, and each one passes the fidelity checks F1 to F7 |
| G2 | First full proofs | the toric MMP and the first surface results are proved on Mathlib alone; the audit steps A1 to A8 of AxiomMath/MMP are complete, with a public report |
| G3 | The known theory | the theorems of tiers T1 to T9 are stated and proved, by the project or by a bridge to an audited source; the handbook volumes P0 to P8 and 0 to 12 are released |
| G4 | Fresh claims and partial results | at least five claims have a formal check of a substantial part; at least three new partial results on the open targets |
| G5 | One open conjecture in a new case | a case of an open conjecture that the literature does not contain, proved in Lean and accepted by experts |
| G6 | A central conjecture | termination in dimension 5, abundance in dimension 4, or non-vanishing in dimension 4, proved and formalized |

G1 to G3 are engineering with a known end. G4 is research with a good chance in two years. G5 is a research bet. G6 is a research bet that the project does not plan to win. It is on the list so that work toward it has a name.

## The milestones

| Milestone | Target | Goal | Release |
|---|---|---|---|
| S0 | 2026-12-20 | the four repositories, the first statements, the site, the audit started | v0.1.0 |
| S1 | 2027-02-28 | the vocabulary, the audit index, the first claim check | v0.2.0 |
| S2 | 2027-04-30 | the toric cone theorem, most statements written | v0.3.0 |
| S3 | 2027-06-30 | the audit closes; the decision on S22 | v0.4.0 |
| S4 | 2027-09-30 | the toric MMP | v0.5.0 |
| S5 | 2027-12-31 | the surface program on Mathlib, the Han-Liu reduction | v1.0.0 |
| S6 | 2028-04-30 | the scheme dictionary and the last statements | v1.1.0 |
| S7 | 2028-08-31 | the first research result | v1.2.0 |
| S8 | 2028-12-31 | the library and the claims | v1.3.0 |
| S9 | open | an open case | v2.0.0 |

The dates are targets, set on 2026-11-26. The statements and the trust tooling of S0 and S1 cannot slip, because each later result depends on them.
