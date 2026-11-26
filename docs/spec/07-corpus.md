# 07. The corpus: the theories and papers to formalize

This is the list that "all related results" means in document 02. Each row is a paper or a book that some node of the map needs, with the reason it is needed. The tiers are in dependency order. A tier uses only the tiers above it, except where a row says otherwise. This is the first version of the list. It grows when a node needs a new source, and each addition names the node that asked for it.

The sources are the reports A to G in `research/sources/`. The tags [P], [S], [U], [R] are those of document 01. They apply to the bibliographic facts of the row, not to the truth of the theorem. Every [S] and [U] row is a task for the `reader` role (document 10) before a node depends on it. Q-11 (16) asks for a check of all KM98 numbers.

The column **Lean** says what exists in Lean on 2026-11-26.
- **ML**: in Mathlib at the pin (05.1). **PR**: in an open Mathlib pull request.
- **AX**: in AxiomMath/MMP at `1f9ade3670` (05.2). These are audited (04.3) and bridged (06.4), not copied.
- **TC**: TauCeti. **SG**: singularity-lean. **YD**: YaelDillies/toric. **HR**: the hironaka project. These are portable (05.3).
- **fc**: a statement in formal-conjectures. **none**: nothing found.

The column **Use** is the plan of the project.
- **reuse**: use the Mathlib result as it is.
- **prove**: a full formal proof.
- **port**: a proof ported from a source of 05.3, then checked (05.4).
- **bridge**: an equivalence with an AxiomMath/MMP statement, proved in `MinimalModelBridge` (09.4).
- **state**: a Lean statement, used as a named hypothesis until it is proved (09.2).
- **ex**: certified examples or computations (document 13).
- **read**: a source of ideas, definitions and handbook text, with no theorem in the map.

The column **Pri** is the priority.
- **A**: needed before milestone S4 (document 15).
- **B**: needed by the routes of document 04 in the first two years.
- **C**: later, or only for the handbook.

## 7.1 Tier T0: references

The standard texts that define the language. They enter the map through definitions and through the handbook (document 11), not through theorems. Report F gives the full judgement of each book for students. The prerequisite texts of volumes P0 to P8 (Atiyah-Macdonald, Hartshorne, Vakil, Huybrechts and the others) are in report G and in 11.2. They are not rows here, because no node of the map depends on them; Mathlib is the formal prerequisite.

| Id | Work | What it gives | Lean | Use | Pri | Tag |
|---|---|---|---|---|---|---|
| T0-01 | Kollár and Mori, *Birational Geometry of Algebraic Varieties*, Cambridge Tracts 134 (1998) | the reference definitions of 06.1; the numbering of Theorems 3.5 to 3.7; the spine of Volumes 1, 4, 7 and 8 | AX (partial) | read | A | [S] |
| T0-02 | Kollár, *Singularities of the Minimal Model Program*, Cambridge Tracts 200 (2013) | dlt modifications, lc centres, adjunction, the definitions of risk 5 | none | read | A | [S] |
| T0-03 | Lazarsfeld, *Positivity in Algebraic Geometry* I and II, Ergebnisse 48 and 49 (2004) | nef, big and ample cones, multiplier ideals, Nadel vanishing | partly TC | read | A | [S] |
| T0-04 | Matsuki, *Introduction to the Mori Program*, Universitext (2002) | the toric chapter, the 3-fold program in detail; a second text for Volumes 3 and 8 | none | read | A | [S] |
| T0-05 | Debarre, *Higher-Dimensional Algebraic Geometry*, Universitext (2001) | rational curves, bend and break, the cone theorem by deformation | none | read | B | [S] |
| T0-06 | Fujino, *Foundations of the Minimal Model Program*, MSJ Memoirs 35 (2017) | quasi-log schemes, the fundamental theorems for lc pairs | none | read | A | [S] |
| T0-07 | Hacon and Kovács, *Classification of Higher Dimensional Algebraic Varieties*, Oberwolfach Seminars 41 (2010) | the BCHM proof at seminar level; the spine of Volume 9 | none | read | A | [S] |
| T0-08 | Corti (ed.), *Flips for 3-folds and 4-folds*, OUP (2007) | Shokurov's pl flips, "What is a flip?" | none | read | B | [S] |
| T0-09 | Kollár et al., *Flips and Abundance for Algebraic Threefolds*, Astérisque 211 (1992) | 3-fold flips and abundance; the spine of Volumes 8 and 10 | none | read | B | [S] |
| T0-10 | Kawamata, Matsuda and Matsuki, "Introduction to the minimal model problem", Adv. Stud. Pure Math. 10 (1987) | the MMP in all dimensions modulo flips and termination | none | read | B | [U] |
| T0-11 | Beauville, *Complex Algebraic Surfaces*, LMS Student Texts 34 (1996); Bădescu, *Algebraic Surfaces* (2001) | surfaces in all characteristics; the spine of Volume 2 | none | read | A | [S] |
| T0-12 | Cox, Little and Schenck, *Toric Varieties*, GSM 124 (2011); Fulton, *Introduction to Toric Varieties* (1993) | fans, the toric cone theorem, Chapter 15 (the secondary fan and the toric MMP) | YD (partial) | read | A | [S] |
| T0-13 | Reid, "Young person's guide to canonical singularities", PSPUM 46 (1987) | terminal and canonical singularities, Reid-Tai, baskets | none | read | A | [S] |
| T0-14 | Kollár, *Rational Curves on Algebraic Varieties*, Ergebnisse 32 (1996) | Hilbert and Chow schemes, bend and break | none | read | C | [S] |
| T0-15 | Kollár, *Families of Varieties of General Type*, Cambridge Tracts 231 (2023) | KSBA moduli; the spine of Volume 13 | none | read | C | [S] |
| T0-16 | Xu, *K-stability of Fano Varieties*, New Math. Monographs 50 (2025) | valuations, normalized volume, K-moduli; the spine of Volume 14 | none | read | C | [S] |
| T0-17 | Birkar, "Lectures on birational geometry", arXiv:1210.2670; Kollár, "Exercises in the birational geometry", arXiv:0809.2579 | the lecture-note path; about 100 exercises for Volumes 1 to 8 | none | read | A | [P] |
| T0-18 | Corti, Kaloghiros and Lazić, "Introduction to the MMP and the existence of flips", Bull. LMS 43 (2011), arXiv:0811.1047; Cascini and Lazić, "New outlook" I and II | the short proof of finite generation; a second route to S30 | none | read | B | [S] |
| T0-19 | Lazić, "Programming the Minimal Model Program: a proposal", Beitr. Algebra Geom. 65 (2024), arXiv:2310.01097 | an MMP expert's plan for a formalization; checked against 06.1 | none | read | A | [P] |
| T0-20 | The Stacks project, tags for normality, Weil divisors, dualizing complexes | the definitions AxiomMath/MMP follows; step A7 of the audit | AX (Stacks layer) | read | A | [P] |

## 7.2 Tier T1: schemes, divisors and positivity

The layer of 06.1. Most rows are definitions with a small API. Many are in Mathlib or in a portable source.

| Id | Work | What it gives | Lean | Use | Pri | Tag |
|---|---|---|---|---|---|---|
| T1-01 | schemes, morphisms of finite type, separated and proper morphisms | `IsVariety` (06.1) | ML | reuse | A | [P] |
| T1-02 | normal schemes, Serre's criterion $R_1 + S_2$, discrete valuations at codimension one points | `IsNormalScheme`, `PrimeDivisor`, the order of a function along a prime divisor | ML (partial), AX | prove | A | [P] |
| T1-03 | Weil divisors, principal divisors, linear equivalence; $\mathbb{Q}$- and $\mathbb{R}$-divisors | `Divisor R X`, `RLinEquiv` | AX, SG (partial) | port | A | [P] |
| T1-04 | Cartier divisors, $\mathbb{Q}$-Cartier and $\mathbb{R}$-Cartier divisors, $\mathbb{Q}$-factoriality | `IsQCartier`, `IsRCartier`, `IsQFactorial` | AX | port | A | [P] |
| T1-05 | the canonical divisor of a normal variety; reflexive sheaves $\mathcal{O}_X(D)$ | `CanonicalDivisor` | AX (via dualizing data) | bridge | A | [P] |
| T1-06 | line bundles, the Picard group, pullback of Cartier divisors | the pullback in a contraction step | ML (partial) | prove | A | [P] |
| T1-07 | intersection numbers by Euler characteristics (Snapper; Kleiman 1966) | an instance of `IntersectionData` (F2) | TC (partial) | port | A | [U] |
| T1-08 | $N^1(X)$, $N_1(X)$, the theorem of the base | `N₁`, `IntersectionData.finiteDim` as a hypothesis | none | state | A | [U] |
| T1-09 | the closed cone of curves $\overline{NE}(X)$ | `coneOfCurves` as a `PointedCone` | AX (relative) | bridge | A | [P] |
| T1-10 | ample, very ample, nef; Kleiman's criterion; Nakai-Moishezon | `IsAmple`, `IsNef`, statement S01 | TC, AX (partial) | prove | A | [S] |
| T1-11 | big and pseudo-effective divisors, Kodaira's lemma, the volume | `IsBig`, `IsPseudoEffective`, `vol` | none | prove | A | [S] |
| T1-12 | section rings, Iitaka dimension, Iitaka fibration | `iitakaDim`, S46 | none | prove | B | [S] |
| T1-13 | Nakayama's $\sigma$-decomposition and $\kappa_\sigma$ (Nakayama, MSJ Memoirs 14, 2004) | `numericalDim` (risk 4) | none | state | B | [U] |
| T1-14 | coherent cohomology, Serre vanishing, Serre duality | the setting of vanishing theorems | ML (Čech, partial), AX (derived) | state | B | [P] |
| T1-15 | blow-ups and birational maps of varieties | contractions, flips and log resolutions | ML (partial) | prove | A | [P] |
| T1-16 | resolution of singularities in char 0 (Hironaka 1964; Kollár, Annals Studies 166) | `HasLogResolution`, shared with spec 2161 (Q-09) | HR (partial), fc | state | A | [S] |

## 7.3 Tier T2: the foundational theorems

KM98 Chapters 2 and 3 and Fujino arXiv:0909.4445 for lc pairs. This is the first layer of real theorems. Most of it waits on coherent cohomology, so the project proves the toric and surface cases (T4, T5) and states the general case.

| Id | Work | What it gives | Lean | Use | Pri | Tag |
|---|---|---|---|---|---|---|
| T2-01 | Kodaira vanishing | the base of every vanishing statement | AX (snc, char 0) | bridge | A | [P] |
| T2-02 | Kawamata-Viehweg vanishing (Kawamata 1982; Viehweg 1982) | S02 | AX (smooth, snc) | bridge | A | [P] |
| T2-03 | Kollár injectivity and torsion freeness (Ann. of Math. 123, 1986) | S03 | none | state | B | [U] |
| T2-04 | the non-vanishing theorem of Shokurov (1985) | the input to the basepoint free theorem | none | state | A | [U] |
| T2-05 | the basepoint free theorem (Kawamata, Shokurov) | S08 | none | state | A | [S] |
| T2-06 | the rationality theorem | S07 | none | state | A | [S] |
| T2-07 | the cone theorem for klt pairs (Mori 1982; Kawamata 1984) | S04 | AX (relative, klt) | bridge | A | [P] |
| T2-08 | the contraction theorem | S06 | none | state | A | [S] |
| T2-09 | bend and break; lengths of extremal rays (Mori 1982; Kawamata 1991) | S09 | none | state | B | [U] |
| T2-10 | Jovinelly, Lehmann and Riedl, "Optimal bounds in Bend-and-Break", arXiv:2509.08065 | the optimal length bound; a check of S09 | none | read | C | [P] |
| T2-11 | Fujino, "Fundamental theorems for the log minimal model program", arXiv:0909.4445 | the cone, contraction and vanishing theorems for lc pairs; S05 | none | state | A | [P] |
| T2-12 | Ambro, "Quasi-log varieties" (2003); Fujino's quasi-log theory (T0-06) | the framework for lc pairs | none | read | C | [U] |
| T2-13 | Nadel vanishing and multiplier ideals (Lazarsfeld II, Chapter 9) | the analytic tools of BCHM and of HM | none | state | B | [S] |

## 7.4 Tier T3: surfaces

The first complete program. Volume 2 of the handbook and statements S10 to S14. This is part of G2 (02.3).

| Id | Work | What it gives | Lean | Use | Pri | Tag |
|---|---|---|---|---|---|---|
| T3-01 | the intersection form on a smooth projective surface, Riemann-Roch, the adjunction formula | the base of the surface program | none (TC plans) | prove | A | [S] |
| T3-02 | the Hodge index theorem | negative definiteness of contracted curves | none | prove | A | [S] |
| T3-03 | Castelnuovo's contraction criterion | S10 | none | prove | A | [S] |
| T3-04 | the cone theorem for smooth surfaces (Mori; Kollár's exercises) | S11 | AX (dim 2) | prove | A | [P] |
| T3-05 | minimal models of smooth surfaces, ruled surfaces, $\mathbb{P}^2$ | S12 | AX (`rationalBirationalProgramProperty_two`) | prove | A | [P] |
| T3-06 | Zariski decomposition (Zariski 1962; Fujita) | the surface case of $\sigma$-decomposition | none | prove | B | [U] |
| T3-07 | Artin's contractibility criterion; rational and elliptic surface singularities | lc surface singularities | none | prove | B | [U] |
| T3-08 | Fujino, "Minimal model theory for log surfaces", Publ. RIMS 48 (2012) | S13, the lc surface program without $\mathbb{Q}$-factoriality | none | prove | A | [S] |
| T3-09 | abundance for surfaces (Enriques-Kodaira classification; Fujino for lc) | S14 | none | state | B | [S] |
| T3-10 | Tanaka, the MMP for excellent surfaces in all characteristics (2014 to 2018) | S12 and S13 in char $p$; the first case of route R7 | none | prove | B | [S] |
| T3-11 | Enokizono and Moriyama, arXiv:2609.12478 | abundance for log surfaces without $\mathbb{Q}$-factoriality or lc | none | read | C | [P] |
| T3-12 | Alexeev and Liu, arXiv:1612.09116, 1803.09582 | volumes of lc surfaces, the record $1/48983$ | none | ex | C | [P] |

## 7.5 Tier T4: singularities

The definitions of risk 5 and the examples of F2. Report C and Volume 4.

| Id | Work | What it gives | Lean | Use | Pri | Tag |
|---|---|---|---|---|---|---|
| T4-01 | discrepancy and log discrepancy over divisorial valuations (KM98 2.3) | `logDiscrepancy` (06.1) | AX (via a resolution) | prove | A | [P] |
| T4-02 | terminal, canonical, klt, plt, dlt, lc (KM98 2.3, Kollár 2013 Chapter 2) | `IsKlt`, `IsLc`, `IsDlt` | AX (`IsKltPair`, `IsLcPair`) | bridge | A | [P] |
| T4-03 | the test on one log resolution (KM98 2.32) | `isKlt_iff_of_logResolution` | none | prove | A | [S] |
| T4-04 | cones over curves and quotient singularities; the Reid-Tai criterion | Example 3.4; F2 instances | none | prove | A | [S] |
| T4-05 | Mori's classification of terminal 3-fold singularities; Reid's basket | the inputs to E1 (13) | none | ex | B | [U] |
| T4-06 | inversion of adjunction (Kawakita, Invent. Math. 167, 2007) | adjunction for plt and lc centres | none | state | B | [U] |
| T4-07 | minimal log discrepancies (Shokurov; Ambro 1999); log canonical thresholds | `mld`, `lct` | none | prove | A | [S] |
| T4-08 | Ein, Mustaţă and Yasuda, Invent. Math. 153 (2003), math/0209392 | LSC and inversion of adjunction on smooth and lci varieties by jet schemes | none | state | B | [P] |
| T4-09 | Kawakita, arXiv:2312.13599, 2412.03006 | ACC for mld on smooth 3-folds and on a fixed 3-fold | none | state | B | [P] |
| T4-10 | Han, Liu and Luo, arXiv:2202.05287; Liu and Luo, arXiv:2207.04610 | ACC for 3-fold mld near 1; the accumulation point $5/6$ | none | state | B | [P] |
| T4-11 | Nakamura and Shibata, Duke 175 (2026), arXiv:2404.06164; arXiv:2608.28038 | PIA is false; LSC in families is false; the index conjecture fails outside klt | none | ex | A | [P] |
| T4-12 | normalized volumes (Chi Li, arXiv:1511.08164; Blum; Xu-Zhuang) and Han's inequality $\widehat{\mathrm{vol}} \le n^{n-1}\mathrm{mld}$ | the local volume tools of HQZ | none | read | B | [P] |
| T4-13 | Ishii, *Introduction to Singularities* (2018); Hacon, "Singularities of the MMP" (2025) | the student path of Volume 4 | none | read | C | [S] |

## 7.6 Tier T5: toric geometry and the toric MMP

Route R3 (04.4). The one setting in which the whole program can be proved in Lean in the first years. Statement S39 and Target T live here.

| Id | Work | What it gives | Lean | Use | Pri | Tag |
|---|---|---|---|---|---|---|
| T5-01 | rational polyhedral cones, duality, Gordan's lemma, faces | the base of fans | ML (`PointedCone`, partial), PR (dual cones, faces) | reuse | A | [P] |
| T5-02 | fans, simplicial and complete fans, projectivity by support functions | `Fan` (R3 step 1) | YD (partial) | port | A | [P] |
| T5-03 | torus-invariant divisors, wall relations, $\mathrm{Pic}$ and $N^1$ of a toric variety | R3 step 2 | none | prove | A | [S] |
| T5-04 | the toric cone theorem: $\overline{NE}$ spanned by walls (Reid 1983; Fujino-Sato, Michigan Math. J. 52, 2004) | R3 step 3 | none | prove | A | [S] |
| T5-05 | toric contractions and toric flips (Reid 1983) | R3 steps 4 and 5; Francia's flip for F2 | none | prove | A | [U] |
| T5-06 | termination of toric flips (Reid; Matsuki Chapter 14) | R3 step 6; the scope is Q-12 | none | prove | A | [S] |
| T5-07 | toric discrepancies and mld by the Newton polytope; Borisov's toric ACC for mld | R3 step 7 | none | prove | A | [U] |
| T5-08 | Ambro, LSC of mld for toric varieties (1999) | R3 step 8; E2 | none | prove | B | [U] |
| T5-09 | the secondary fan and Mori dream spaces (Cox-Little-Schenck Chapter 15; Hu-Keel, math/0004017) | S37 in the toric case | none | prove | B | [P] |
| T5-10 | the scheme of a fan, and the dictionary from fans to `Scheme` | R3 step 9; the bridge to YD | YD (partial) | port | B | [P] |
| T5-11 | Han and Liu, arXiv:2209.13122, Geom. Topol. 29 (2025), Conj. 1.9(2') | the statement of Target T (S52) | none | state | A | [P] |
| T5-12 | Moraga and Süß, arXiv:2111.01738; Liu, Moraga and Süß, arXiv:2205.12326 | toric and complexity-one boundedness by volume | none | read | C | [P] |

## 7.7 Tier T6: 3-folds

| Id | Work | What it gives | Lean | Use | Pri | Tag |
|---|---|---|---|---|---|---|
| T6-01 | Mori, "Flip theorem and the existence of minimal models for 3-folds", JAMS 1 (1988) | terminal 3-fold flips | none | state | B | [U] |
| T6-02 | Shokurov, "3-fold log flips", Izv. 40 (1992) | S15 | none | state | B | [S] |
| T6-03 | Kawamata, "Termination of log flips for algebraic 3-folds" (1992); Shokurov 1996 | S16 | AX (3-fold program) | bridge | B | [S] |
| T6-04 | Miyaoka 1988; Kawamata, Invent. Math. 108 (1992); Keel, Matsuki and McKernan, Duke 75 (1994) | S17 | none | state | B | [S] |
| T6-05 | the lc 3-fold program as AxiomMath/MMP states it (`projectiveLowerLogMMP_three`) | S18 | AX | bridge | A | [P] |
| T6-06 | Chen and Chen, arXiv:1302.0374, Compositio 151 (2014); Zhu, arXiv:0710.4409 | $\mathrm{vol} \ge 1/1680$; the case $\chi = 1$; E1 | none | ex | B | [P] |
| T6-07 | Brown, Kasprzyk and Reid, the graded ring database (39,550 baskets) | the finite enumeration of E1 | none | ex | B | [S] |
| T6-08 | Yasuda, arXiv:2603.13703 | an algorithm for the 3-fold MMP over computable fields | none | ex | C | [P] |

## 7.8 Tier T7: BCHM and the program in all dimensions

| Id | Work | What it gives | Lean | Use | Pri | Tag |
|---|---|---|---|---|---|---|
| T7-01 | Hacon and McKernan, "On the existence of flips", math/0507597 | pl flips by extension theorems | none | state | B | [P] |
| T7-02 | Birkar, Cascini, Hacon and McKernan, JAMS 23 (2010), math/0610203 | S30, S31, S32, S34, S35, S37; the induction $A_n$ to $F_n$ | none | state | A | [P] |
| T7-03 | Siu, analytic finite generation, math/0610740 | a second proof of S32 | none | read | C | [P] |
| T7-04 | Corti, Hacking, Kollár, Lazarsfeld and Mustaţă, "Lectures on flips and minimal models", arXiv:0706.0494 | the outline that Volume 9 follows | none | read | A | [S] |
| T7-05 | Birkar, "On existence of log minimal models" I and II, arXiv:0706.1792, 0907.4170 | minimal models for $\kappa \ge 0$ in dim 5; weak non-vanishing implies S33 | none | state | B | [P] |
| T7-06 | Birkar, arXiv:1104.4981; Hacon and Xu, arXiv:1105.1169 | S26, lc flips | none | state | B | [P] |
| T7-07 | Hacon and McKernan, the Sarkisov program, JAMS 26 (2013), arXiv:0905.0946; Corti 1995 | S36 | none | state | C | [P] |
| T7-08 | He, the strong Sarkisov program in dim 4, JPAA 230 (2026), arXiv:2311.08750 | S38 for $n \le 4$ | none | state | C | [P] |
| T7-09 | Hu and Keel, "Mori dream spaces and GIT", math/0004017 | S37 | none | state | B | [P] |
| T7-10 | Lyu and Murayama, arXiv:2209.08732 | the relative MMP with scaling for excellent algebraic spaces and analytic settings | none | read | C | [P] |

## 7.9 Tier T8: termination and its reductions

Route R4 (04.5) and statements S19 to S29. The open centre of the subject.

| Id | Work | What it gives | Lean | Use | Pri | Tag |
|---|---|---|---|---|---|---|
| T8-01 | Shokurov, "Letters of a bi-rationalist V" (2004) | S28: ACC and LSC for mld give T(n) | none | prove | A | [U] |
| T8-02 | Birkar, "ACC for log canonical thresholds and termination of log flips", math/0502116 | ACC for lct plus special termination give termination for $\kappa \ge 0$ | none | prove | A | [P] |
| T8-03 | special termination (Fujino; Lazić, Moraga and Tsakanikas, arXiv:2007.06458) | S19 | none | prove | A | [P] |
| T8-04 | Kawamata, Matsuda and Matsuki 1987; Fujino, math/0301154 | termination of terminal and canonical 4-fold flips | none | state | B | [P] |
| T8-05 | Alexeev, Hacon and Kawamata, math/0605137 | termination of many 4-fold flips | none | state | B | [P] |
| T8-06 | Moraga, Math. Z. 310 (2025), arXiv:1802.10202; Chen and Tsakanikas, arXiv:2011.02236 | S21 | none | state | A | [P] |
| T8-07 | Han and Liu, Geom. Topol. 29 (2025), arXiv:2209.13122 | S29; a second proof of T(3) | none | prove | A | [P] |
| T8-08 | Han, Qi and Zhuang, arXiv:2506.20183 | finitely many mld values and bounded fibres in a general type MMP | none | state | B | [P] |
| T8-09 | Han, Liu and Zhuang, arXiv:2509.01501 | S24 with explicit bounds in dim $\le 4$; E8 | none | state | B | [P] |
| T8-10 | Lazić and Xie, Épijournal 9 (2025), arXiv:2305.01752 | Nakayama-Zariski decompositions and termination | none | read | C | [P] |
| T8-11 | D. Kim, arXiv:2405.11902 | termination with scaling under bounded index and $\kappa_\sigma \ge \dim X - 1$ | none | read | C | [P] |
| T8-12 | Birkar and Zhang, generalized pairs, Publ. IHES 123 (2016), arXiv:1410.0938; Hacon and Liu, arXiv:2105.13590 | the language of generalized pairs; G1b | none | state | B | [P] |

## 7.10 Tier T9: abundance and non-vanishing

Route R5 (04.6) and statements S40 to S47.

| Id | Work | What it gives | Lean | Use | Pri | Tag |
|---|---|---|---|---|---|---|
| T9-01 | Kawamata, "Pluricanonical systems on minimal algebraic varieties" (1985) | S42 from the basepoint free theorem | none | prove | A | [U] |
| T9-02 | Nakayama, *Zariski-decomposition and Abundance*, MSJ Memoirs 14 (2004) | $\kappa_\sigma$; S43 | none | state | B | [U] |
| T9-03 | Gongyo, arXiv:1005.2796 (Theorem 1.2, rational boundary) and arXiv:1101.1394 (Theorem 6.1 and Lemma 6.2, real boundary) | S43 for lc pairs | none | state | B | [P] |
| T9-04 | Demailly, Hacon and Păun, Acta Math. 210 (2013) | non-vanishing and dlt extension give abundance | none | state | B | [S] |
| T9-05 | Lazić and Peternell, generalised abundance I and II | S45 | none | state | B | [P] |
| T9-06 | Liu and Xu, arXiv:2505.05250 | S44; abundance for $\nu \le 1$ in dim $\le 5$ | none | state | A | [P] |
| T9-07 | Hashizume, arXiv:1609.00121; Lazić and Tsakanikas, Publ. RIMS 58 (2022) | reductions of non-vanishing and minimal models to smooth varieties | none | state | B | [P] |
| T9-08 | Hashizume and Hu, arXiv:1906.00769 | good minimal models of log abundant lc pairs | none | read | C | [S] |
| T9-09 | Kawamata, "Minimal models and the Kodaira dimension of algebraic fiber spaces" (1985); Viehweg; Birkar-Chen | cases of S46 | none | read | C | [U] |
| T9-10 | Prokhorov and Shokurov, "Towards the second main theorem on complements" (2009) | S47 in relative dimension one | none | read | C | [U] |

## 7.11 Tier T10: boundedness, ACC, complements and moduli

Route R6 (04.7) and statements S48 to S56. Report C.

| Id | Work | What it gives | Lean | Use | Pri | Tag |
|---|---|---|---|---|---|---|
| T10-01 | Hacon, McKernan and Xu, "ACC for log canonical thresholds", Ann. of Math. 180 (2014), arXiv:1208.4150 | S48; accumulation points of lct | none | state | A | [P] |
| T10-02 | Hacon, McKernan and Xu, arXiv:1011.1464, 1412.1186 | DCC for volumes; boundedness of stable pairs | none | state | B | [P] |
| T10-03 | Hacon and McKernan, Takayama, Tsuji (2006) | effective birationality of $|mK_X|$ | none | state | B | [U] |
| T10-04 | Birkar, arXiv:1603.05765 and 1609.05543, Ann. of Math. | S53 (BAB); boundedness of complements | none | state | B | [P] |
| T10-05 | Shokurov, arXiv:2012.06495; Chen, Han and Xue, arXiv:2409.01310; Chen, Han, He and Xie, arXiv:2501.03739 | complements in full generality and for generalized pairs | none | read | C | [P] |
| T10-06 | Borisov's toric ACC; Alexeev, Kollár for surfaces and 3-folds | the low-dimensional cases of S49 | none | prove | B | [U] |
| T10-07 | Esser, Totaro and Wang, arXiv:2109.13383, 2209.04597; Totaro and Wang, arXiv:2104.12200; Esser, Liu and Wang, arXiv:2406.03570 | doubly exponential examples; the weighted hypersurfaces of E4 | none | ex | B | [P] |
| T10-08 | Bie, Du and Yu, arXiv:2611.12786, 2611.14402, 2611.18357 | $\mathrm{vol} \ge 1/420$ and the moduli at $1/420$ (claims, 7.13) | none | ex | A | [P] |
| T10-09 | Chen and Chen, arXiv:0712.4356; Jiang, arXiv:2109.03453 | $(-K)^3 \ge 1/330$ for terminal weak $\mathbb{Q}$-Fano 3-folds | none | ex | B | [P] |
| T10-10 | Filipazzi, Hacon and Svaldi, JEMS 27 (2025), arXiv:2112.01352; Filipazzi and Xu, arXiv:2607.27048 | boundedness of elliptic CY 3-folds and of most elliptic CY 4-folds | none | read | C | [P] |
| T10-11 | Kawamata, Morrison, Totaro: the cone conjecture and its known cases | S55 | none | state | C | [U] |
| T10-12 | Han, arXiv:2609.01574 | the linear Fujita bound $m \ge \lceil 1.77629\ldots\, n \rceil$; a step toward S56 | none | read | B | [P] |
| T10-13 | Liu, Xu and Zhuang, Ann. of Math., arXiv:2102.09405; Blum, Liu, Xu and Zhuang, arXiv:2510.06197 | properness and projectivity of K-moduli | none | read | C | [P] |
| T10-14 | Birkar, "Moduli of algebraic varieties", arXiv:2211.11237; Kollár 2023 (T0-15) | stable minimal models; KSBA moduli | none | read | C | [P] |
| T10-15 | Ajit, arXiv:2610.09270 | S57: counterexamples to the Ambro-Kawamata conjecture in dim 4 | none | ex | A | [P] |

## 7.12 Tier T11: other settings

Route R7 and family H of 06.2. The rows are grouped by setting. Report B has the details.

| Id | Work | What it gives | Lean | Use | Pri | Tag |
|---|---|---|---|---|---|---|
| T11-01 | Hacon and Xu, JAMS 28 (2015), arXiv:1302.0298; Cascini, Tanaka and Xu, Ann. ENS 48 (2015), arXiv:1305.3502 | the char $p$ 3-fold program, $p > 5$ | none | state | B | [S] |
| T11-02 | Birkar, arXiv:1311.3098; Birkar and Waldron, arXiv:1410.4511 | log flips, cone and contraction for 3-folds, $p > 5$ | none | state | B | [P] |
| T11-03 | Hashizume, Nakamura and Tanaka, arXiv:1711.10706 | S58: the lc 3-fold MMP over perfect fields of char $p > 5$ | none | state | B | [P] |
| T11-04 | Hacon and Witaszek, the 3-fold program in char 5; BMPSTWW, Publ. IHES (2023) | the char 5 and mixed char cases | none | read | C | [S] |
| T11-05 | Raynaud surfaces; Cascini-Tanaka and Bernasconi counterexamples; Totaro, arXiv:2407.02608 | the failures of vanishing and of Cohen-Macaulayness in char $p$ (F3 instances for family H) | none | ex | B | [P] |
| T11-06 | Zheng Xu, arXiv:2212.04039, 2307.03938; Bernasconi, Witaszek and Xu, arXiv:2610.10439 | 3-fold abundance in char $p$; $p > 42$ (claim) | none | read | C | [P] |
| T11-07 | Waldron, arXiv:2608.14236 | the 4-fold cone theorem for $p > 5$ under log resolution | none | read | C | [P] |
| T11-08 | Höring and Peternell, Invent. Math. (2016); Das, Hacon and Păun | S59: the Kähler 3-fold program | none | state | C | [S] |
| T11-09 | Das and Hacon, arXiv:2412.07650; Hacon and Xie, arXiv:2607.24986; Hacon and Wang, arXiv:2611.29683 | the transcendental and Kähler programs in higher dimension (claims) | none | read | C | [P] |
| T11-10 | Fujino, arXiv:2208.11872; Enokizono and Hashizume, arXiv:2404.05126, 2501.03531 | the lc program for projective morphisms of analytic spaces | none | read | C | [P] |
| T11-11 | Cascini and Spicer, Forum Pi (2025); Cascini and Spicer, survey arXiv:2604.09027 | the foliated MMP for rank 1 and co-rank 1 on 3-folds | none | read | C | [P] |
| T11-12 | Liu, Meng and Xie, Compositio 161 (2025), arXiv:2404.01559; CHLMSSX, arXiv:2408.14258, 2504.10737 | S60: the MMP for algebraically integrable foliations and adjoint foliated structures | none | state | C | [P] |
| T11-13 | Bernasconi, arXiv:2309.13978 | the MMP fails for 1-foliated surfaces in char $p$ | none | ex | C | [P] |

## 7.13 Watch list: fresh claims that are not in the corpus

These are recorded with the kind `claim` and the status `claimed` (06.6). They are never used as hypotheses until the `reader` role and an outside expert have checked them, and the paper record has `expert_status: accepted`. Each one has a page on the site with its date and status. Route R1 of document 04 is the project's work on them. The claims C1 to C17 of 01.3 are the full list; the rows below are the ones with a statement in 06.2 or a first node in 04.

| Claim | Source | Date | What it claims | Why it matters |
|---|---|---|---|---|
| T(4) for lc 4-folds with rational boundary | OpenAI family 056 (paper); AxiomMath/MMP `1f9ade3670` (Lean) [P] | 2026-10-06 and later | every MMP of a projective lc 4-fold with $\mathbb{Q}$-boundary terminates; kernel-checked over Stacks foundations | S22; the audit of route R2 decides its status |
| Other OpenAI families (034, 035 and others) | openai/math [P] | 2026-09 to 2026-10 | Kähler abundance cases; char $p$ abundance for $\nu = 1$; non-vanishing implies abundance | no Lean; some revised or retracted [S]; route R1 picks one checkable lemma each |
| Every MMP terminates for big boundary | Hashizume, arXiv:2609.33679, v2 [P] | 2026-10-13 | S25; finiteness of marked Mori fibre spaces; strong Sarkisov in all dimensions | the draft says it was AI-assisted; the method uses HQZ bounds, not mld |
| Non-vanishing implies abundance | J. Liu, arXiv:2610.35913 [P] | 2026-10-07 | non-vanishing for smooth varieties in dim $d$ gives good minimal models for lc pairs of dim $\le d$ | posted after the OpenAI release, with a hash for priority; the reduction is checkable as an implication of named `Prop`s |
| Flips for all lc generalized pairs | Hu and Liu, arXiv:2603.03817 [P] | 2026-03-04 | S27 | removes the NQC and $\mathbb{Q}$-factorial hypotheses |
| A non finitely generated generalized lc ring | Liu and Y. Wang, arXiv:2608.03258 [P] | 2026-08-04 | a counterexample for generalized pairs | "mostly AI-generated, human-verified"; a finite check is a good R1 target |
| Counterexamples to effective non-vanishing | Ajit, arXiv:2610.09270, v2 [P] | 2026-10-14 | S57 | arithmetic of the example is E3 (13); the first R1 node |
| $\mathrm{vol} \ge 1/420$ for 3-folds of general type | Bie, Du and Yu, arXiv:2611.12786 (118 pp.) [P] | 2026-11-09 | the sharp volume bound, with code in the ancillary files | E1 certifies the basket enumeration |
| 3-fold abundance for $p > 42$ | Bernasconi, Witaszek and Xu, arXiv:2610.10439 [P] | 2026-10-07 | full lc abundance in large characteristic | "very preliminary" by the authors |
| Kähler MMP with scaling | Hacon and Wang, arXiv:2611.29683 [P] | 2026-11-22 | termination with scaling for Kähler klt pairs | uses OpenAI manuscripts as input |
| b-semiampleness | Bakker, Filipazzi, Mauri and Tsimerman, arXiv:2508.19215; Hu, K. Liu and Shen, arXiv:2611.12744 [P] | 2025-12-18; 2026-11-09 | S47 | two independent methods; a conjecture of Prokhorov and Shokurov |
| LSC of mld (failed) | Landi, arXiv:2611.30971 [P] | 2026-11-23 | a proof of Ambro's conjecture and of the mld bound | v2 says "Lemma 3.2 is false"; the record stays as `withdrawn` |
| Fujita freeness (disputed) | Chan, arXiv:2411.07129 [P] | 2024 to 2026 | S56 in all dimensions | a v2 comment reports a problem; status `disputed` |
| Uniform and non-uniform YTD | Trusiani, arXiv:2605.30063; a counterexample by Jihao Liu [P] | 2026 | the cscK form of YTD splits | outside the 60; an E-type computation can check the example |

## 7.14 The paper record

Each paper has a file `papers/<id>.yaml` in `tamnd/mmp`:

```yaml
id: T8-07
key: HL25
title: null                                  # the reader role copies it from arXiv:2209.13122
authors: [Jingjun Han, Jihao Liu]
where: Geom. Topol. 29 (2025) 399-441
doi: null
arxiv: "2209.13122"
also: [T8-01]                                # Shokurov's reduction, the older form
read: { version: journal, by: reader, date: 2026-12-21, tag: S }
tier: T8
why: the reduction of termination to terminal flips and ACC for enc mld; the statement of Target T
expert_status: accepted                      # accepted | claimed | announced | withdrawn | disputed
uses: [T4-07, T8-02, T8-03]
results:
  - id: "Theorem 1.2"
    statement: HanLiuReduction               # the name in MinimalModel/Statements/ (06.2)
    node: hanliu-reduction
    kind: theorem                            # theorem | definition | conjecture | claim | example
    status: stated                           # computed from the map: unstated | stated | proved-mod | proved | refuted | claimed
  - id: "Conjecture 1.9(2')"
    statement: HanLiuEncACC
    node: hanliu-enc-acc
    kind: conjecture
    status: stated
lean_elsewhere:                              # other formalizations, with commit and licence
  - { repo: AxiomMath/MMP, commit: 1f9ade3670, licence: null, what: none for this paper, use: none }
lean_status: none                            # none | stated | port-available | proved
code_licence: null                           # the licence of the code the project ports for this paper
handbook: { volume: 10, chapter: null }       # document 11
notes: The toric case of Conj. 1.9(2') is Target T (04.12). Check the exact title and theorem numbers against the journal.
```

- `expert_status` is set by a person. It is shown with every hypothesis that comes from the paper (14.3).
- `announced` is for a result that its authors state in a talk or a survey without a full paper.
- `withdrawn` and `disputed` keep the record. The site shows why, with the date and the source of the comment.
- `lean_status` and `code_licence` let `mmp` find the cheapest source for a node: a ported proof beats a new proof (05.4).

A claim record (route R1) is the same file with three more fields:

```yaml
claim:
  first_seen: 2026-10-14
  checked_part: "the arithmetic of the example (E3)"   # the part route R1 checks; the section number is filled by the reader
  unrefereed_inputs: []                      # the dependencies that are themselves claims
  authors_contacted: null                    # date of the letter (14.4)
  lean_result: null                          # "checked" | "gap found" | "counterexample" with a link to the node
```

## 7.15 Counts and order

The tiers have 154 rows: 20 in T0, 16 in T1, 13 in T2, 12 in T3, 13 in T4, 12 in T5, 8 in T6, 10 in T7, 12 in T8, 10 in T9, 15 in T10 and 13 in T11. A row with several papers counts as one. The watch list has 14 more rows. `mmp corpus --count` checks these numbers.

By use, about 30 rows are `prove`, 5 `port`, 8 `bridge`, about 55 `state`, about 15 `ex` and the rest `read` or `reuse`. This ratio is deliberate. G1 (document 02) needs the statements, not the proofs. The project writes the proofs on the path to G2: the toric program, the surface program and the reductions between named statements.

The first ten to formalize, in order:

1. **T1-02 and T1-03**, normal schemes, prime divisors and $\mathbb{R}$-divisors, ported from singularity-lean (05.5).
2. **T1-04 and T1-05**, $\mathbb{Q}$-Cartier divisors and the canonical divisor, with the bridge to AxiomMath/MMP.
3. **T4-01 and T4-02**, discrepancies and the classes klt and lc, over divisorial valuations.
4. **T5-01 and T5-02**, cones and fans on `PointedCone`, with the YD port.
5. **T5-03 and T5-04**, toric divisors and the toric cone theorem.
6. **T8-01**, Shokurov's reduction S28, as an implication between named `Prop`s.
7. **T8-07**, the Han-Liu reduction S29, in the same form.
8. **T5-05 and T5-06**, toric contractions, flips and termination.
9. **T5-07 and T5-11**, toric mld and the statement of Target T.
10. **T3-01 to T3-05**, the surface program, after T1-07 gives an `IntersectionData` instance for surfaces.

Items 1 to 3 are the vocabulary of 06.1 and the base of the audit (04.3, steps A4 and A5). Items 4, 5, 8 and 9 are route R3 to the toric MMP theorem S39. Items 6 and 7 are the first reductions of route R4. Item 10 is the surface half of G2. They are the work of milestones S0 to S4 (document 15).
