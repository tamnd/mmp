# 11. tamnd/mmp-handbook: The Minimal Model Program Handbook

The handbook is the minimal model program written as a set of textbooks. It is in two parts:
- **The prerequisites, Volumes P0 to P8.** They teach the algebraic geometry that the MMP uses. They start at classical varieties and end at bend-and-break, resolution, toric varieties and the first discrepancies.
- **The program, Volumes 0 to 17.** They start at divisors and cones and end at the 2026 frontier and the open problems.

Who it is for and how it is written:
- **Voice.** An expert writes it, to the standard of an expert. Each chapter defines its objects, states its results in standard notation with numbers, and proves them as a mathematician proves them.
- **Readers.** There are three kinds:
  - students with a first course in algebra and topology, who start at P0;
  - students who know Hartshorne II, III and V or Vakil, who take the fast path (11.5) and start at Volume 0;
  - working mathematicians who do not read Lean and want the status of a statement and its proof.
- **Formats.** It comes as PDF and EPUB volumes. The site has the same text in HTML at `/learn/` (12).

The handbook differs from the sister handbooks in four ways.
1. **It starts below its subject.** The langlands handbook assumes a first graduate year. This handbook has nine volumes of prerequisites. A student who has the background skips them, and a student who does not can start at P0. This is "all related knowledge for the learner" (02.4).
2. **Its sections have six fixed parts.** Every theorem section has the parts Statement, Proof in words, Examples, Exercises, Lean, and Notes and history, in that order (11.3). The builder checks the order.
3. **It shows two states.** The Lean part shows the Lean status of the node. The Notes and history part shows the state in the literature: `theorem`, `claimed`, `conjecture` or `refuted`. The two states are independent. A Lean proof of a statement that is only `claimed` in the literature does not change the literature state (06.6).
4. **It treats open problems as material to teach.** Volumes 16 and 17 are dated reports. They are rewritten at each milestone, like Volume 9 of the singularity handbook and Volume 13 of the langlands handbook.

The curriculum comes from research reports F (research/sources/F-books-curriculum.md, sections 5 to 7) and G (research/sources/G-prerequisites-learner-path.md, sections 5 to 8).

## 11.1 The prerequisite volumes P0 to P8

| | Volume | Level | Pages (estimate) | Spine texts | Chapters |
|---|---|---|---|---|---|
| P0 | Guide and classical varieties | upper undergraduate | 350 | Reid, *Undergraduate Algebraic Geometry*; Shafarevich, Vol. 1; Harris | 8 |
| P1 | Commutative algebra for geometry | first graduate year | 450 | Atiyah-Macdonald; Matsumura; Eisenbud | 13 |
| P2 | Categories, homological algebra and sheaves | first graduate year | 300 | Vakil Part I; Weibel | 8 |
| P3 | Schemes, divisors and line bundles | first graduate year | 550 | Vakil; Hartshorne II; Görtz-Wedhorn I | 13 |
| P4 | Cohomology and duality | first and second year | 500 | Hartshorne III; Vakil; Görtz-Wedhorn II; Stacks | 9 |
| P5 | Curves and surfaces | second year | 550 | Hartshorne IV and V; Beauville; Reid, Park City notes | 12 |
| P6 | Complex geometry and Hodge theory | second year | 400 | Huybrechts; Voisin I; Griffiths-Harris | 8 |
| P7 | Intersection numbers, positivity and vanishing | second year | 450 | Lazarsfeld I and II; Debarre Ch. 1 | 11 |
| P8 | Tools of birational geometry: rational curves, resolution, toric varieties, singularities | second year | 500 | Debarre; Kollár-Mori Ch. 1 and 4; Kollár, *Lectures on Resolution*; Cox-Little-Schenck; Reid, *Young Person's Guide* | 13 |
| | Total | | about 4,050 | | 95 |

The chapters of each volume (from G 5.2; the full chapter briefs are in G):

- **P0.**
  1. How to read the handbook, and the reading paths of 11.5.
  2. The MMP in one chapter, with no proofs.
  3. Affine varieties.
  4. Projective varieties.
  5. Rational maps and the quadratic transformation of $\mathbb{P}^2$.
  6. Dimension, tangent spaces and the Jacobian criterion.
  7. Plane curves and elliptic curves.
  8. Cubic surfaces and the 27 lines.
- **P1.**
  1. Rings, modules and flatness.
  2. Localization, the prime spectrum and primary decomposition.
  3. Noetherian and Artinian rings.
  4. Integral extensions and Noether normalization.
  5. Dimension theory.
  6. Completion.
  7. DVRs, Dedekind domains and valuations.
  8. Normal rings and class groups.
  9. Regular local rings.
  10. Depth, Cohen-Macaulay and Gorenstein rings.
  11. Serre's criterion and reflexive modules.
  12. Kähler differentials.
  13. Graded rings.
- **P2.**
  1. Categories, functors and the Yoneda lemma.
  2. Abelian categories.
  3. Derived functors.
  4. Spectral sequences.
  5. Sheaves on spaces.
  6. Sheaves of modules.
  7. Sheaf cohomology and Čech cohomology.
  8. Derived categories, as much as P4 Ch. 9 needs.
- **P3.**
  1. Affine schemes.
  2. Schemes.
  3. Morphisms.
  4. Separated and proper morphisms.
  5. Quasicoherent and coherent sheaves.
  6. Proj, $\mathcal{O}(n)$ and $\mathbb{P}(\mathcal{E})$.
  7. Dimension, smoothness and normalization.
  8. Weil divisors.
  9. Cartier divisors, line bundles and $\mathbb{Q}$-Cartier divisors.
  10. Linear systems.
  11. Blow-ups.
  12. Differentials and the canonical sheaf.
  13. Flat families.
- **P4.**
  1. Cohomology of quasicoherent sheaves.
  2. Cohomology of projective space.
  3. Euler characteristic and Hilbert polynomial.
  4. Higher direct images.
  5. Base change.
  6. Formal functions, Zariski's main theorem and Stein factorization.
  7. Serre duality.
  8. Ext sheaves and local duality.
  9. Grothendieck duality, dualizing complexes and Kempf's criterion.
- **P5.**
  1. Curves and Riemann-Roch.
  2. Maps of curves.
  3. Singular curves.
  4. Elliptic curves and bundles on $\mathbb{P}^1$.
  5. Intersection theory on surfaces.
  6. Blow-ups of surfaces.
  7. Castelnuovo's criterion and factorization.
  8. Contractions, negativity and Zariski decomposition.
  9. Ruled, rational and del Pezzo surfaces.
  10. Cubic surfaces and $\mathbb{P}^2$ blown up in 9 points.
  11. Kodaira dimension and the Enriques-Kodaira classification.
  12. The MMP for surfaces, as a preview of Volume 2.
- **P6.**
  1. Several complex variables.
  2. Complex manifolds and Dolbeault cohomology.
  3. Hermitian geometry and Chern classes.
  4. Kähler manifolds and Hodge theory.
  5. Line bundles on compact Kähler manifolds.
  6. Kodaira vanishing and Kodaira embedding.
  7. Chow, GAGA and the Lefschetz principle.
  8. Singular metrics and analytic multiplier ideals.
- **P7.**
  1. Intersection numbers.
  2. Numerical equivalence and $N^1$, $N_1$.
  3. The criteria of Nakai-Moishezon, Kleiman and Seshadri.
  4. Nef and ample cones and $\overline{NE}(X)$.
  5. Big and pseudo-effective divisors.
  6. Section rings and Iitaka dimension.
  7. Volume and base loci.
  8. Vanishing I: Kodaira and Kawamata-Viehweg.
  9. Vanishing II: Grauert-Riemenschneider and Kollár.
  10. Multiplier ideals.
  11. Characteristic $p$: Raynaud, Deligne-Illusie, Frobenius splitting.
- **P8.**
  - Part A, rational curves:
    1. Hom and Hilbert schemes.
    2. Bend-and-break.
    3. Uniruled and rationally connected varieties.
  - Part B, resolution:
    4. Resolution of curves and surfaces.
    5. Hironaka's theorem, as statements.
  - Part C, toric varieties:
    6. Cones, fans and toric varieties.
    7. Toric divisors.
    8. Toric resolution and the toric cone.
  - Part D, singularities:
    9. Quotient singularities.
    10. Du Val singularities.
    11. Rational singularities.
    12. Cones over varieties.
    13. First discrepancies.

Dependencies (G 6.1):

| Volume | Needs |
|---|---|
| P0 | undergraduate algebra and topology |
| P1 | P0, for motivation only |
| P2 | P1 Ch. 1 to 3 |
| P3 | P1; P2 Ch. 1, 5, 6 |
| P4 | P2, P3 |
| P5 | P4 Ch. 1 to 7 |
| P6 | P2 Ch. 5 to 7; P3 for Ch. 5 and 7. It is read in parallel with P4 and P5 |
| P7 | P4; P5 Ch. 5 to 8; P6 Ch. 6 for Ch. 8 to 11 |
| P8 | P5; P7 Ch. 1 to 5 for Parts A to C; P4 Ch. 9 and P7 Ch. 8 for Part D |

```
P0 -> P1 -> P2 -> P3 -> P4 -> P5 -> P7 -> P8
            |           \         ^
            +---> P6 ----+--------+
```

Two alternative sizes, from G 5.1:
- **Eight volumes.** P0 merges into P1 and P3.
- **Ten volumes.** P8 splits into "Rational curves and resolution" and "Toric varieties and singularities".

The plan keeps nine. The split of P8 is the first change to make if P8 grows past 600 pages.

## 11.2 The MMP volumes 0 to 17

| | Volume | Level | Pages (estimate) | Spine | Tiers (07) |
|---|---|---|---|---|---|
| 0 | How to read this handbook | guide | 60 | Moraga 2024; Lazić 2024; Birkar 2012 Ch. 1 | all |
| 1 | Divisors, curves and cones | background | 220 | KM98 Ch. 1; Lazarsfeld I; Debarre Ch. 1 | T1 |
| 2 | The MMP for surfaces | core | 380 | Reid 1997; Beauville; Matsuki Ch. 1 | T3 |
| 3 | The toric MMP | core | 300 | Cox-Little-Schenck Ch. 15; Fujino-Sato 2004; Reid 1983 | T5 |
| 4 | Singularities of pairs | core | 420 | Reid 1987; KM98 Ch. 2 and 5; Kollár 2013 | T4 |
| 5 | Vanishing theorems and multiplier ideals | core | 210 | KM98 Ch. 2; Lazarsfeld; Esnault-Viehweg | T2 |
| 6 | Rational curves and bend-and-break | core | 200 | Debarre 2001; Kollár 1996; KM98 Ch. 1 | T2 |
| 7 | Cone and contraction theorems | core | 360 | KM98 Ch. 3; Matsuki Ch. 6 to 8; Fujino 2017 | T2 |
| 8 | Flips, flops and the 3-fold MMP | core | 460 | KM98 Ch. 4 to 7; Astérisque 211; Corti 2007 Ch. 2 | T6 |
| 9 | BCHM: existence of minimal models | advanced | 440 | BCHM; Corti 2007; Corti-Kaloghiros-Lazić; Hacon-Kovács | T7 |
| 10 | Abundance, termination and the Sarkisov program | advanced | 400 | Astérisque 211; Birkar 2007; Fujino 2017 | T8, T9 |
| 11 | The MMP in positive and mixed characteristic | advanced | 380 | Hacon-Xu 2015; Cascini-Tanaka-Xu 2015; Tanaka; BMPSTWW | T11 |
| 12 | Boundedness, complements and BAB | advanced | 420 | Birkar ICM 2018; Kebekus, Bourbaki 1157; Prokhorov | T10 |
| 13 | Moduli of stable varieties | research | 400 | Kollár 2023; Kovács 2009 | T10 |
| 14 | K-stability and K-moduli of Fano varieties | research | 440 | Xu 2025 | T10 |
| 15 | The MMP for foliations | research | 360 | Cascini-Spicer 2026; Brunella; Spicer 2025 lectures | T11 |
| 16 | The 2026 frontier: generalized pairs, Kähler spaces, 4-folds | research | 320 | Birkar-Zhang; Moraga 2025; the 2026 preprints | T8, T9, T11; routes R1, R2 |
| 17 | Open problems | research | 120 | Birkar ICM 2018; Xu-Zhuang 2026 | routes R1 to R9 |
| | Total | | about 5,890 | | |

The two parts together are about 9,940 pages, the size of a long series. No one reads all of it. The reading paths of 11.5 are the real product for a learner.

Dependencies between the MMP volumes (F 7.4):

| Volume | Needs |
|---|---|
| 0 | none |
| 1 | the P volumes, as in 11.4 |
| 2 | 1 |
| 3 | 1, 2 |
| 4 | 1, 2, 3 |
| 5 | 1, 4 |
| 6 | 1, 2 |
| 7 | 4, 5, 6 |
| 8 | 3, 4, 7 |
| 9 | 5, 7, 8 |
| 10 | 9 |
| 11 | 2, 4, 7, 8 |
| 12 | 9, 10 |
| 13 | 4, 9, 12 |
| 14 | 4, 7, 12, 13 |
| 15 | 4, 7, 8 |
| 16 | 9, 10, 12 |
| 17 | all |

```
          1 ──► 2 ──► 3 ──► 4 ──► 5 ──┐
          │     │                     ▼
          │     └──► 6 ────────────► 7 ──► 8 ──► 9 ──► 10 ──► 12 ──► 13 ──► 14
          │                          │     │     │             │
          │                          └──► 11 ◄──┘    15 ◄──────┘(4, 7, 8)
          │                                          16 ◄── 9, 10, 12
          └──────────────────────────────────────►  17 ◄── all
```

### 11.2.1 The content of each MMP volume

The full volume briefs are in F 7.2. The table below fixes the main theorems, the worked examples that each volume must have, and the number of exercises. Node keys in F (`MM.V2.castelnuovo`) are working names. They become the slugs of nodes (08.3), and `mmp node new` gives the tags.

| Vol. | Main theorems | Required worked examples | Exercises |
|---|---|---|---|
| 0 | the MMP conjecture in one paragraph; the status table by dimension (11.6) | the minimal model of $\mathrm{Bl}_p\mathbb{P}^2$ in two lines | 10, grade A |
| 1 | $\mathbb{Q}$- and $\mathbb{R}$-divisors over a base $Z$; relative $N^1(X/Z)$ and $N_1(X/Z)$; relative Kleiman; the relative nef, big and pseudo-effective cones; Iitaka fibration and $\kappa$; numerical dimension $\kappa_\sigma$ (Nakayama); the negativity lemma in all dimensions; exceptional loci; Zariski's main theorem as used in contractions | the blow-up of a point in $\mathbb{P}^n$ ($K_Y = \pi^*K_X + (n-1)E$, $E^n = (-1)^{n-1}$); nef cones of $\mathbb{P}^1\times\mathbb{P}^1$ and $\mathbb{F}_n$; a divisor with $\kappa = 0$ and $\kappa_\sigma = 1$ | 40 to 60 |
| 2 | Castelnuovo; factorization into blow-ups; the cone theorem for smooth surfaces; the three extremal contractions; existence and uniqueness of minimal models for $\kappa \ge 0$; log surfaces and surfaces with quotient singularities; abundance for surfaces; the Enriques-Kodaira outline | $\mathbb{F}_n$ and elementary transformations; the cones of del Pezzo surfaces $S_r$ (3, 6, 10, 16, 27, 56, 240 $(-1)$-curves for $r = 2, \dots, 8$); a general type surface with a $(-1)$-curve; $\mathbb{P}^2$ blown up in 9 points | 50 to 70 |
| 3 | fans; $\mathbb{Q}$-factorial means simplicial; the toric cone theorem; toric contractions and flips by wall crossing; termination of toric flips; the toric MMP ends; the secondary fan and Gale duality; variation of GIT for $\mathbb{C}^*$ | the $\mathbb{C}^*$ action on $\mathbb{C}^4$ with weights $(a_1, a_2, -b_1, -b_2)$; the Atiyah flop as two triangulations of a square; the Francia flip as weights $(1, 1, -1, -2)$; $\frac12(1,1)$ and $\frac13(1,1)$ as cones; the toric MMP on a weighted blow-up of $\mathbb{P}^3$ | 40 to 50 |
| 4 | discrepancy and its independence of the model; terminal, canonical, klt, plt, dlt, lc; computation on a log resolution; klt surface germs are quotients; du Val = canonical surface germs; Reid's terminal lemma and $\frac1r(1,-1,a)$; adjunction and inversion of adjunction (surface case proved); lct and mld; the ACC and LSC conjectures stated | $A_1$, discrepancy 0; $\frac13(1,1)$, discrepancy $-\frac13$; $\frac1n(1,1)$, discrepancy $-\frac{n-2}{n}$; the cone over a plane cubic (lc, not klt); the cone over a plane quartic (not lc); the cone over a curve of genus $g$ by a line bundle of degree $d$, $a = -1 - \frac{2g-2}{d}$; $\frac12(1,1,1)$, discrepancy $\frac12$ | 60 to 80 |
| 5 | Kawamata-Viehweg for pairs and over a base; the covering trick; Kollár injectivity and torsion freeness; Nadel vanishing; multiplier ideals (restriction, subadditivity, Skoda); invariance of plurigenera (outline); failure in characteristic $p$ (preview of 11) | Kawamata-Viehweg on $\mathbb{P}^2$ with a fractional line arrangement; Howald's theorem for monomial ideals; vanishing on a blow-up | 40 to 60 |
| 6 | Hom schemes; bend-and-break; Mori's rational curve with $0 < -K_X \cdot C \le n + 1$; the cone theorem for smooth varieties by Mori's method; uniruledness; rational connectedness of Fano manifolds (Kollár-Miyaoka-Mori); the length of extremal rays | lines on a cubic surface as minimal rational curves; rational curves on $\mathbb{P}^n$; the cone of $\mathbb{P}^1 \times \mathbb{P}^2$ | 40 to 50 |
| 7 | nonvanishing; the base point free theorem; rationality; the cone theorem for klt pairs; the contraction theorem; divisorial, small and fibre type; the lc versions (Ambro, Fujino), sketched; Kawamata's length bound; a section that compares the proof of 6 and the proof of 7 | the del Pezzo cones again; a smooth Fano 3-fold with $\rho = 2$; a divisorial contraction to a curve; a fibre type contraction to a surface | 40 to 60 |
| 8 | flips and flops; uniqueness of flips; Mori's flip theorem with the extremal neighbourhoods outlined; Shokurov's 3-fold log flips; termination by difficulty; terminal $\mathbb{Q}$-factorial models; flops connect minimal models (Kollár); the semistable MMP (outline) | the Atiyah flop ($xy = zw$, $N_C = \mathcal{O}(-1)^{\oplus 2}$); the Francia flip ($K \cdot C^- = -\frac12$, $K \cdot C^+ = 1$); Reid's pagoda; the weighted blow-up of a $\frac12(1,1,1)$ point | 50 to 70 |
| 9 | pl flips and Shokurov's reduction; the Hacon-McKernan extension theorem; existence of pl flips; special termination; the MMP with scaling; finiteness of models; nonvanishing for big boundary; BCHM and finite generation; Mori dream spaces; the Cascini-Lazić route (outline). Chapter 1 is a printed map of the induction | the MMP with scaling on a toric 3-fold; finite generation for a surface by hand; the Mori chambers of $\mathbb{F}_n$ and of a del Pezzo surface | 40 to 50, grades B and C |
| 10 | abundance for 3-folds; termination of 4-fold canonical flips; Shokurov's reduction of termination to ACC and LSC; Birkar's termination with scaling; Moraga's pseudo-effective lc 4-folds; effective termination in dimension at most 5; the Liu-Xu and Han-Liu reductions; the Sarkisov program (Corti, Hacon-McKernan) | ruled surfaces as Sarkisov links; a link from the blow-up of a point of $\mathbb{P}^3$; abundance for an elliptic surface by the canonical bundle formula | 30 to 40 |
| 11 | excellent surfaces (Tanaka); failure of Kodaira vanishing; $F$-splitting and $F$-singularities; the 3-fold MMP for $p > 5$, $p = 5$, $p > 3$; lc 3-folds; the mixed characteristic MMP (BMPSTWW); counterexamples in characteristic 2 and for 1-foliations. Chapter 1 is a toolkit chapter | a quasi-elliptic surface in characteristic 2 or 3; Raynaud's counterexample (outline); $F$-purity of $\frac1n(1,1)$ for $p \nmid n$ | 30 to 40 |
| 12 | the canonical bundle formula; generalized pairs; ACC for lct (Hacon-McKernan-Xu); boundedness of general type with fixed volume; DCC of volumes; complements and their boundedness; BAB; the Jordan property of Cremona groups; coregularity. A printed induction diagram for BAB | complements on del Pezzo surfaces; the bounded family of smooth del Pezzo surfaces; the unbounded $\frac1n(1,1)$ cones as $\epsilon \to 0$ | 30 to 40 |
| 13 | slc pairs; stable reduction; the KSBA functor; local closedness and Kollár's condition; boundedness; properness; projectivity; wall crossing | $\overline{M}_g$; a stable surface with a $\frac14(1,1)$ point; KSBA limits of plane quintics | 30 to 40 |
| 14 | test configurations and Donaldson-Futaki; the Fujita-Li criterion; the $\delta$-invariant; the normalized volume; openness; boundedness; properness; reductivity; higher rank finite generation (Liu-Xu-Zhuang); uniqueness of degenerations; projectivity; Yau-Tian-Donaldson as a statement | $\mathbb{P}^2$ is K-stable and $\mathrm{Bl}_p\mathbb{P}^2$ is not; $\delta$ of del Pezzo surfaces; the normalized volume of $\frac1n(1,1)$; K-moduli of cubic surfaces | 40 to 50 |
| 15 | foliations and $K_{\mathcal{F}}$; the foliated cone theorem on surfaces; the MMP for rank 1 and rank 2 foliations on 3-folds; foliated adjunction; foliated flips; algebraically integrable foliations; numerically trivial $K_{\mathcal{F}}$; 1-foliations in characteristic $p$ | the Riccati foliation; a degree $d$ foliation on $\mathbb{P}^2$, $K_{\mathcal{F}} = (d-1)H$; the contraction of an invariant $(-1)$-curve | 30 to 40 |
| 16 | generalized pairs and the generalized MMP; the Kähler MMP for 3-folds; the 2026 preprints, each marked `claimed` (01.3); the AxiomMath/MMP formalization and the audit of route R2 (04.3); the claim checks of route R1 | a generalized pair from an elliptic fibration; one 4-fold flip sequence with termination checked by hand | 15 to 25, grade C |
| 17 | termination in dimension $\ge 5$; abundance in dimension $\ge 4$; nonvanishing; ACC and LSC for mld; characteristic $p$ in dimension 4 and in $p = 2, 3$; lc foliated flips; K-stability problems (Xu-Zhuang 2026); boundedness after BAB; Cremona groups; the Lean gaps | none; each problem has a "first test case" | none |

The examples come back. Each one is first seen in a low volume and computed again with new tools later (F 7.3, G 7.5):

| Running example | First seen | Again in |
|---|---|---|
| the blow-up of a point | P3 Ch. 11, P5 Ch. 6 | Vol. 1, 2, 4 (discrepancy of a smooth point), 14 (K-instability of $\mathrm{Bl}_p\mathbb{P}^2$) |
| the cuspidal cubic $y^2 = x^3$ | P0 Ch. 7 | P8 Ch. 4 (resolution), Vol. 4 (lct $= \frac56$) |
| the quadric cone, $A_1$, $\frac12(1,1)$ | P0 Ch. 6 | P8 Ch. 10 and 12, Vol. 3, 4, 11 ($F$-purity) |
| the cone over a rational normal curve, $\frac1n(1,1)$ | P8 Ch. 12 | Vol. 3, 4, 12 (unbounded families), 14 (normalized volume) |
| the cone over an elliptic curve | P8 Ch. 12 | Vol. 4 (lc, not klt, not rational) |
| $\mathbb{F}_n$ | P5 Ch. 9, P8 Ch. 6 | Vol. 1, 2, 3 (secondary fan), 9 (Mori chambers), 10 (Sarkisov links), 15 (Riccati) |
| del Pezzo surfaces and the 27 lines | P0 Ch. 8, P5 Ch. 10 | Vol. 2, 6, 7, 9, 12 (complements), 14 ($\delta$, K-moduli of cubics) |
| $E \times E$ for an elliptic curve $E$ | P5 Ch. 4 | Vol. 1 (a round nef cone when $E$ has no complex multiplication), Vol. 7 ($K \equiv 0$, so the cone theorem gives no extremal ray) |
| the Atiyah flop | P8 Ch. 8 | Vol. 3 (toric), 8 (full) |
| the Francia flip | Vol. 3 | Vol. 8 (difficulty before and after) |
| Reid's pagoda | Vol. 8 | Vol. 17 (classification of flops) |

## 11.3 A section

The folder layout, the numbering, the `Node:` lines and the status rules are those of the singularity and langlands handbooks. So `mhb` starts as a copy of `shb` (11.9).

**Folders.**
- A volume is a folder `content/<id>-<slug>/`, with id `p0` to `p8` for the prerequisites and `00` to `17` for the program. Examples: `content/p3-schemes/`, `content/08-flips/`.
- The folder has a `volume.yaml` with `number`, `title`, `subtitle`, `level`, `requires` and `spine`.
- A chapter is a folder `<NN>-<slug>/` with an `intro.md` and one file per section. It may end with a `problems.md` of longer exercises.
- Numbering is by volume, chapter and item. In the P volumes the number has the volume prefix: Theorem P5.7.2 is item 2 of chapter 7 of P5. In the MMP volumes it has no prefix: Theorem 8.3.4 is item 4 of chapter 3 of Volume 8.

**Front matter.**

```yaml
---
title: The Francia flip
nodes: [MM6H2KQ0TS]
sources: [km98, reid83, corti07]
reads_with: [km98:2.7, matsuki02:ch14]     # parallel reading in a standard text
requires: [P5.6, P8.9, P8.13, 3.4]         # chapters this section uses; P keys from 11.1
level: core            # guide | prereq | background | core | advanced | research
kind: theorem          # theorem | background | survey
status: drafted        # drafted | checked | reviewed
drafted_by: writer@claude-opus-5-5
reviewed_by: []
---
```

**The six parts.** A section with `kind: theorem` has these `##` headings, in this order. `mhb check` faults a missing heading or a wrong order (F 6.2).

1. **Statement.** The definitions it needs, if they are new, and the theorem, numbered and in bold. Then the `Node:` line:

   ```markdown
   **Theorem 8.2.3 (Francia).** Let $X^-$ be the 3-fold ... Then the flip $X^- \dashrightarrow X^+$ exists, $X^+$ is smooth near $C^+$, and $N_{C^+/X^+} \cong \mathcal{O}(-1) \oplus \mathcal{O}(-2)$.

   Node: MM6H2KQ0TS · Lean: `MinimalModel.Examples.franciaFlip` · status: proved · literature: theorem
   ```

   The builder fills in the status and the literature state from `records/status.json` and the paper records of `tamnd/mmp` at build time. The writer never types them.
2. **Proof in words.** One to three paragraphs that give the idea of the proof and say where the difficulty is. A reader who stops here knows why the theorem is true.
3. **Examples.** At least one example computed in full, and one example where a hypothesis fails and the conclusion fails with it. The full proof follows the examples in the core volumes (11.7), under the heading `### Proof` inside this part, or it comes before the examples in the background volumes. The position of the full proof is the one place where the bands differ.
4. **Exercises.** 3 to 8 exercises, each marked (A) routine, (B) standard or (C) research level. An exercise that needs a computer is also marked (M), with the lab spec of 13 that checks it. A chapter may add a `problems.md` with longer exercises.
5. **Lean.** The Lean statement as a code block, copied by the builder from `tamnd/mmp-lean` at the commit of `EDITION`. Then three lines:
   - the status (06.2, 08.3), with the named hypotheses for `proved-mod`, and the source, the commit and the audit verdict for `proved-ext`;
   - the fidelity choices that a reader must know, for example "divisors are finitely supported functions on prime divisors (06.1)" or "klt is tested over all divisorial valuations, not only exceptional ones";
   - "not in Lean" when there is no node, with the reason.
6. **Notes and history.** Who proved it, when, and where; the other proofs; the literature state; the generalizations; what is open.

A section with `kind: background` (definitions and small lemmas) may leave out Proof in words. A section with `kind: survey` (Volumes 13 to 17) may leave out Exercises and gives a proof sketch in place of a full proof.

**Rules.**
- Each theorem on the map has a `Node:` line. A classical result that is not on the map may have none. The check then gives a warning, not an error.
- The text never claims more than the status. If a node is `claimed`, `open` or `refuted`, the text of the section must say so in words. `mhb check` searches for the word.
- A result that a P volume states without proof is a **black box**. Examples are Hironaka's theorem, Grothendieck duality in general, the existence of Hilbert schemes, GAGA, the theorem of the base and BDPP. Each black box has one row in the table of P0 Ch. 1, with its reference, and the label "black box" at each use in P and M. In Lean it is a named hypothesis of 09.2, so the reader sees the same list in the book and in the Lean code.
- An MMP volume never proves again a result of a P volume. It cites it by number, for example "by Theorem P7.8.4".
- Every statement from P3 on is written over a base $Z$ when the MMP needs the relative version, because every MMP statement is relative (G 7.5).
- Every definition and every theorem has a `Lean:` line with one of three values: a `MinimalModel` name, an external name (Mathlib, AxiomMath/MMP, TauCeti) with its status, or "not in Lean" (G 7.5).

**Two fixed conventions.** Volume 0 Ch. 3 fixes the notation, and every later volume cites it at the first use.
- **The discrepancy box.** It is printed on the first page of Volumes 4 to 17, because students mix the two conventions (F 5.1):

  > For a projective birational $f: Y \to X$ and a pair $(X, \Delta)$, write $K_Y + \Delta_Y = f^*(K_X + \Delta)$ with $f_*\Delta_Y = \Delta$. For a prime divisor $E$ on $Y$, the *discrepancy* is $a(E, X, \Delta) = -\operatorname{mult}_E \Delta_Y$, and the *log discrepancy* is $a(E, X, \Delta) + 1$. The pair is terminal or canonical if $a > 0$ or $a \ge 0$ for every exceptional $E$ over $X$. It is klt or lc if $a > -1$ or $a \ge -1$ for every prime divisor $E$ over $X$, exceptional or not. For a divisor $E$ on $X$ itself, $a(E, X, \Delta)$ is minus the coefficient of $E$ in $\Delta$, so klt asks for coefficients less than 1 and lc for coefficients at most 1. The Lean code states the same conditions with the log discrepancy, over all divisorial valuations (06.1).

- **The notation table.** $\equiv$ is numerical equivalence and $\sim_{\mathbb{Q}}$ is $\mathbb{Q}$-linear equivalence; $N^1(X/Z)$ and $N_1(X/Z)$; $\overline{NE}(X/Z)$; $\rho(X/Z)$; $\kappa$ is the Iitaka dimension and $\kappa_\sigma$ (also written $\nu$) the numerical dimension; a flip is $X^- \dashrightarrow X^+$, with $K_{X^-}$ negative on the flipping curves and $K_{X^+}$ positive on the flipped curves; $\frac1r(a_1, \dots, a_n)$ is the quotient of $\mathbb{A}^n$ by $\zeta \mapsto (\zeta^{a_1} x_1, \dots, \zeta^{a_n} x_n)$ with $\zeta$ a primitive $r$-th root of unity.

## 11.4 The interface between the two parts

Report G 6.2 gave the needs of the MMP volumes with provisional labels M0 to M9. The table maps them to the numbering of 11.2 and adds the volumes that G did not list. Each row becomes the `requires` field of the `volume.yaml` of that volume.

| MMP volume | G label | Prerequisite chapters it needs |
|---|---|---|
| 0 Guide | M0 | P0 Ch. 2; P5 Ch. 12 |
| 1 Divisors, curves and cones | (new) | P3 Ch. 8 to 12; P4 Ch. 1 to 6; P7 Ch. 1 to 7 |
| 2 Surfaces | M1 | P3 Ch. 8 to 11; P4 Ch. 1 to 7; P5 all; P7 Ch. 1 to 4; P8 Ch. 4, 9 to 11 |
| 3 Toric MMP | part of M9 | P8 Part C (Ch. 6 to 8); P7 Ch. 4 |
| 4 Singularities of pairs | M3 | P1 Ch. 8, 10, 11; P3 Ch. 9; P4 Ch. 9; P7 Ch. 8 to 10; P8 Part B, Part D |
| 5 Vanishing and multiplier ideals | (new) | P6 Ch. 4, 6, 8; P7 Ch. 8 to 10; P8 Ch. 5 |
| 6 Rational curves and bend-and-break | part of M2 | P4 Ch. 5; P8 Part A; P7 Ch. 4 |
| 7 Cone and contraction theorems | M2 | P4 Ch. 6; P7 Ch. 1 to 5, 8; P8 Part A, Ch. 5 |
| 8 Flips, flops and the 3-fold MMP | M4 | P7 all; P8 Ch. 5, 8, 9, 13 |
| 9 BCHM | M5 | P7 Ch. 5 to 10; P6 Ch. 8 for extension theorems |
| 10 Abundance, termination, Sarkisov | M6 | P5 Ch. 11; P6 Ch. 4 and 5; P7 Ch. 6, 9 |
| 11 Characteristic $p$ and mixed characteristic | part of M9 | P7 Ch. 11; P8 Ch. 5; P1 Ch. 6 (completion) |
| 12 Boundedness, complements, BAB | M7 | P7 Ch. 5, 7; P8 Part A |
| 13 Moduli of stable varieties | M8 | P1 Ch. 11 ($S_2$, demi-normal); P3 Ch. 13; P4 Ch. 5, 9 |
| 14 K-stability | (new) | P1 Ch. 7 (valuations); P7 Ch. 7 (volume); P3 Ch. 13 |
| 15 Foliations | (new) | P3 Ch. 12; P5 Ch. 5 to 9 |
| 16 Frontier | part of M9 | P6 all (Kähler spaces) |
| 17 Open problems | (new) | as each problem needs |

**Overlap.** Volumes 1, 5 and 6 overlap P7 and P8. The rule decides the split:
- the P volume gives the absolute case and the smooth case, with full proofs;
- the MMP volume gives the relative case, the singular case and the case of pairs, and cites the P volume for the rest.

So Volume 1 cites Kleiman's criterion from P7 Ch. 3 and proves the relative version. Volume 6 cites bend-and-break from P8 Ch. 2 and proves the cone theorem by Mori's method. Report F gave Volumes 1, 5 and 6 the estimates 320, 340 and 300 pages, without the P volumes. At S2 the writer measured them again from the outlines of P7 and P8 (Q-20). The outlines are `outlines/p7.md` and `outlines/p8.md` in mmp-handbook, and the measurement is `outlines/q20.md`. The new estimates are 220, 210 and 200 pages, and the table of 11.2 has them. No result is cut. The three volumes cite the absolute and smooth proofs of P7 Ch. 1 to 11 and P8 Ch. 1 to 3.

## 11.5 Reading paths

A path is a list of chapters, not of volumes. The site shows each path at `/learn/paths/` (12) with a checkbox per chapter.

| Path | For | Chapters | Pages | Time |
|---|---|---|---|---|
| **Full** | a strong undergraduate | P0 to P8 in order, with P6 in parallel with P5 or P7; then Volumes 0 to 8 | about 7,000 | four to five semesters for P, two more for 0 to 8 |
| **Fast** | a student who knows Hartshorne II, III and V, or Vakil | P0 Ch. 1, 2 (40); P1 Ch. 10, 11 (70); P3 Ch. 8, 9 (60); P4 Ch. 6, 8, 9 (140); P5 Ch. 8, 11, 12 (130); P6 Ch. 6, 8 (80); P7 all (450); P8 Ch. 1 to 5 and 9 to 13 (380); then Volumes 0 to 8 | 1,350 of P, then 2,940 of M | two semesters for P |
| **Surfaces first** | a student who wants Volume 2 only | P0; P1 Ch. 1 to 9; P3; P4 Ch. 1 to 7; P5; P8 Ch. 4, 9 to 11; then Volumes 0, 2 | about 2,400 | three semesters |
| **Toric first** | a student from combinatorics or convex geometry; the Lean contributor of route R3 | P0 Ch. 1 to 4; P8 Part C; Volume 3 with its Lean parts; then P3 Ch. 8 to 11 and Volume 4 Ch. 1 to 3 | about 900 | one semester |
| **Complex-analytic** | a student who knows Huybrechts | skip P6; P1 Ch. 4 to 11 and P3, P4 quickly; Griffiths-Harris for much of P5; then the fast path from P7 | about 1,800 | two semesters |
| **Arithmetic** | a student who knows Liu or Silverman | P5 Ch. 5 to 12; P7; P8; then Volumes 0 to 8, and Volume 11 early | about 1,300 of P | two semesters |
| **BCHM seminar** (Xu, PKU 2015) | a student who knows KM98 Ch. 1 to 3 | Volume 4 Ch. 1 to 4; Volume 5; Volume 7; Volume 8 Ch. 1 and 2; Volume 9 section by section | about 1,400 | one semester |
| **Boundedness** (Moraga, UCLA 2021 to 2022) | a student after the BCHM path | Volume 10 Ch. 1 to 3; Volume 12; Volume 16 Ch. 1 | about 650 | one semester |
| **Shape first** (Birkar, Collège de France 2011) | a reader who wants the program before the proofs | Volume 0; the first chapter of each of Volumes 1 to 12; Volume 17 | about 400 | four weeks |
| **Lean contributor** | a person who wants to write Lean for the project | Volume 0 Ch. 4; P3 Ch. 8 and 9 with their Lean parts; Volume 4 Ch. 1; the Lean parts of Volume 3; 06 of this spec | about 300 | four weeks |

The page counts of the fast path add to 1,350 with P0 Ch. 1 and 2. G 5.3 gives "about 1,150" before the P8 count was fixed. The table uses the chapter sums.

## 11.6 The learner kit

Each release of the handbook has these parts, which are also on the site at `/learn/`:

1. **The status table by dimension.** Rows: surfaces, 3-folds in characteristic 0, 3-folds in characteristic $p > 5$, $p = 5$, $p = 2, 3$, 4-folds, 5-folds, all dimensions. Columns: existence of flips, termination, existence of minimal models, abundance, the cone theorem, ACC. Each cell has the literature state and the Lean status of the node, written by the builder from the records (F 5.1, item 7). It is in Volume 0 and Volume 17, and it is the home of `/learn/status/`.
2. **The black box table.** It is in P0 Ch. 1. Each black box has its reference, the volumes that use it and its Lean hypothesis (09.2).
3. **The glossary.** Every term with its first definition, its volume and its node. Examples: dlt, plt, mld, $\epsilon$-lc, enc, pl flip, Mori fibre space, Sarkisov link.
4. **The list of running examples** of 11.2.1, each with a page that links to every place where it is computed.
5. **The notebooks.** For each exercise marked (M), a Macaulay2, Sage or Normaliz notebook that the lab of 13 runs and checks. Examples are the mld of a toric germ, the 27 lines on a cubic, the basket of a terminal 3-fold and Howald's theorem.
6. **The Lean bridge for readers.** Volume 0 Ch. 4 teaches enough Lean to read a statement of 06.2: the syntax of a theorem, what `Prop` and `structure` mean, what a named hypothesis is, and how to read `#print axioms`. No exercise of the handbook needs Lean.
7. **The solutions.** Each volume has `solutions/<id>.md`. They are released to teachers on request through `/teach/` (12), so that the exercises stay useful for courses. Grade A solutions are public, so that a student alone can check the routine work.

## 11.7 Style by band

| Band | Volumes | Style |
|---|---|---|
| Guide | P0 Ch. 1 and 2, Volume 0 | short chapters, no proofs, many pictures of fans and cones, the status table |
| Prerequisite | P0 to P8 | complete proofs; each definition followed by two examples; follow the spine text closely and say so in `reads_with`; Lean names where Mathlib has them (G 4); 15 to 30 exercises per chapter, grades A and B, some from the spine texts with credit |
| Background | 1 | complete proofs; each definition followed by two examples; exercises A and B |
| Core | 2 to 8 | examples first, then the theorem, then the proof in words, then the full proof; each chapter ends with a computation the reader does by hand; every flip is first seen in a toric or weighted example |
| Advanced | 9 to 12 | proof maps before proofs; induction diagrams for BCHM and for BAB; full proofs of the key lemmas; other lemmas cite the page of the source |
| Research | 13 to 17 | full statements, proof sketches and a dated status; claims from preprints are marked `claimed` |

The text uses ASD-STE100: short sentences, no "we", no em dash and no en dash, math in `$...$`, and names of theorems with several authors with a hyphen. The banned word list of `lhb` is copied into `mhb`.

## 11.8 Who writes and who checks

The `writer` role (10.3) drafts from the papers, the map and the Lean code.
- **`checked`.** A draft becomes `checked` when a second model pass and the script checks find no problem:
  - every cited result exists in the source at the given place (Q-11 for KM98 numbers);
  - every `Node:` line and every `requires` and `reads_with` key resolves;
  - the six parts are present and in order;
  - each exercise has a grade and a solution;
  - each example of 11.2.1 that the volume must have is present;
  - every number in a worked example agrees with the lab run that checks it (13), when there is one;
  - the style rules hold.
- **`reviewed`.** A section becomes `reviewed` when a person with the right background has read it and signed it in `reviewed_by`.

Only `reviewed` chapters go into a numbered release. Drafts are in the `-dev` builds and on the site with a banner.

Reviewers (Q-19):
- **P volumes.** Graduate students who have taught or taken a course from the spine text are good reviewers. One faculty member signs each volume.
- **Volumes 2 to 8.** These are the heart of the handbook and its main use for students. The project looks for their reviewers first, among the people who teach from KM98, Matsuki or Debarre.
- **Volumes 9 to 17.** An expert of the field signs each volume. A section about a fresh claim also needs the owner, by the rule of 14.4.

Some proofs in the literature are long and, in places, hard to follow. Examples are Mori's flip theorem, the extremal neighbourhoods of Kollár-Mori and the full BCHM induction. The handbook may give a different proof than the paper, for example the proof that the Lean code follows, or the Corti-Kaloghiros-Lazić route to flips. It then says so and gives both references.

Exercises from other books (Kollár's exercise book, Birkar's notes, Xu 2025) are adapted with credit and only within the licence of the source (Q-21).

## 11.9 The builder `mhb`

`mhb` is written in Python, like `shb` and `lhb`. It starts as a copy of `shb`, with the singularity parts removed and these additions:
- the keys `level`, `kind`, `reads_with` and `requires`, in `content.py` and `check.py` (`lhb` does not implement `level` and `reads_with` yet, F 6.2);
- the six-part check and the `kind` rules of 11.3;
- the grade markers (A), (B), (C), (M) and the solution split;
- the P and M numbering;
- the black box table and the glossary, built from the front matter;
- the status table by dimension, built from `records/status.json`;
- the "text never claims more than the status" check;
- a per-volume index of the Lean names, with their status.

Commands:

```
mhb new volume p7 "Intersection numbers, positivity and vanishing"
mhb new section 08-flips/02-examples francia
mhb number --write          # numbers statements by volume, chapter, item
mhb check [-volume 08]      # front matter, six parts, Node lines, requires, style, solutions
mhb paths                   # 11.5 → build/paths.json for /learn/paths/
mhb build -volume 08 -format pdf,epub,html
mhb release -volume 08      # only if every section is reviewed
```

The steps of a build:
1. read the Markdown;
2. number the statements;
3. check the links, the `Node:` lines, the `requires` and `reads_with` keys and the six parts;
4. fill in the Lean code blocks and the status from `tamnd/mmp-lean` and `tamnd/mmp` at the commits of `EDITION`;
5. write LaTeX with `tex/handbook.sty` and run LuaLaTeX;
6. write the EPUB and the HTML for the site.

The output goes to `build/mmp-handbook-<id>-<version>.{pdf,epub}`. Each release is a GitHub release. `EDITION` records the commits of `tamnd/mmp`, `tamnd/mmp-lean` and AxiomMath/MMP that the edition describes. A volume that cites a `proved-ext` node therefore names the Axiom commit and the audit verdict of that commit.

## 11.10 The order of writing

The handbook is written in the order of the milestones (15). The order follows two needs: the Lean work needs its reference text early, and a student needs the low volumes first.

| Milestone | Drafted | Released |
|---|---|---|
| S1 | Volume 0; P0; Volume 3 Ch. 1 to 3 (with the toric Lean work of route R3) | Volume 17, first dated report |
| S2 | P1, P2, P3; Volume 3; Volume 4 Ch. 1 to 3; the outlines of P7 and P8 (for Q-20) | Volume 0 |
| S3 | P4, P5; Volume 1; Volume 2 | P0; Volume 16, first dated report |
| S4 | P7, P8; Volume 4; Volume 5 | P1, P2, P3; Volume 3 |
| S5 | P6; Volumes 6, 7 | P4, P5; Volumes 1, 2 |
| S6 | Volumes 8, 9 | P7, P8; Volume 4 |
| S7 | Volumes 10, 11 | P6; Volumes 5, 6, 7 |
| S8 | Volumes 12, 13 | Volumes 8, 9 |
| S9 | Volumes 14, 15 | Volumes 10 to 15, as reviewers sign them |

Volume 17 is released as a dated report at each milestone from S1 on, and Volume 16 from S3 on. If the writing takes twice the planned time (02.6), the order holds and the cut is at the end: P0 to P8 and Volumes 0 to 8 first, and Volumes 15 to 17 become surveys.
