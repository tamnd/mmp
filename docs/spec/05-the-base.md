# 05. The base: what the project starts from

This document lists what exists in Lean on 2026-11-26 and what the project takes from it. The source is report E. Every Mathlib path is under `Mathlib/` at the pin `56a005855e` [P] unless a row says otherwise. A name that the report found by its absence is [U] until a second search confirms it (09.3).

The base has four parts:
1. **Mathlib at the pin**: the only dependency of the main library `MinimalModel`.
2. **AxiomMath/MMP and AxiomMath/Stacks**: the largest Lean source in the field, audited and bridged, never a dependency of the main library.
3. **Small sources to port**: TauCeti, formal-conjectures, YaelDillies/toric, and the sibling projects.
4. **Sources to read but not copy**: repositories without a licence, and the papers.

## 5.1 Mathlib at the pin

The pin is Lean v4.35.0 with Mathlib tag v4.35.0 (`56a005855ea17e0b0958f73ec801ae140b0a1679`, 2026-10-13). Mathlib has 8,624 files at the pin, of which 140 files (49,654 lines) are in `AlgebraicGeometry` [P]. The same pin is used by AxiomMath/MMP, AxiomMath/Stacks, singularity-lean, langlands-lean, resolutionorg/hironaka and grothendiecklabs/grothendieck-riemann-roch [P]. A shared pin lets the bridge package depend on AxiomMath/MMP with no port.

**What the MMP uses, and Mathlib has** [P]:

| Topic | Paths | Declarations | Use |
|---|---|---|---|
| Schemes and morphisms | `AlgebraicGeometry/Scheme.lean`, `Morphisms/*` | `Scheme`, `IsProper`, `Smooth`, `Flat`, `IsFinite`, `Etale`, `IsSeparated`, `LocallyOfFiniteType`, `IsDominant` | the ambient category |
| Properties | `Properties.lean`, `Noetherian.lean` | `IsIntegral`, `IsReduced`, `IsLocallyNoetherian`, `IsNoetherian` | varieties (06.1) |
| Function field | `FunctionField.lean` | `Scheme.functionField` | $K(X)$, rational functions |
| Rational and birational maps | `Birational/RationalMap.lean` (651 lines), `Birational/Birational.lean` (293 lines) | `PartialMap`, `RationalMap` with notation `X ⤏ Y`, `Birational`, `BirationalOver` | birational contractions, flips |
| Normalization | `Normalization.lean` (684 lines) | `Scheme.Hom.normalization` | normal models |
| Cycles and Weil divisors | `AlgebraicCycle/Basic.lean` (187 lines) | `AlgebraicCycle X R`, `IsWeilDivisor`, `weilDivisors` | divisors with $\mathbb{Z}$, $\mathbb{Q}$, $\mathbb{R}$ coefficients |
| Order of vanishing | `OrderOfVanishing.lean` (135 lines; split on master, #43273) | `ordHom`, `ord` under `IsDiscreteValuationRing` of the stalk | principal divisors |
| Proj | `ProjectiveSpectrum/*` | `IsProper (Proj.toSpecZero 𝒜)` | flips as $\mathrm{Proj}$, lc models |
| Sheaves of modules | `Modules/Sheaf.lean`, `Modules/Tilde.lean` | `X.Modules`, pushforward, pullback, `tilde` | $\mathcal{O}_X(D)$ |
| Cohomology | `CategoryTheory/Sites/SheafCohomology/*` | `H n` via `Ext`, the long exact sequence, Mayer-Vietoris, Čech | statements of vanishing |
| Differentials | `Differentials/Presheaf.lean`, `RingTheory/Kaehler/*` | `relativeDifferentials'`, `KaehlerDifferential` | $K_X$ on the smooth locus |
| Picard group of a ring | `RingTheory/PicardGroup.lean` | `CommRing.Pic`, `Module.Invertible` | local line bundles |
| Dimension | `Topology/KrullDimension.lean`, `RingTheory/KrullDimension/*` | `topologicalKrullDim`, `ringKrullDim` | $\dim X$, codimension |
| Valuations | `RingTheory/Valuation/*`, `DiscreteValuationRing/*` | `Valuation`, `ValuationSubring`, `IsDiscreteValuationRing` | divisorial valuations |
| Regular local rings | `RingTheory/RegularLocalRing/*` | `IsRegularLocalRing` | smoothness of pairs |
| Convex cones | `Geometry/Convex/Cone/*` | `PointedCone R E` (a `Submodule (Nonneg R) E`), `dual`, `DualFG`, `IsSimplicial`, `IsFaceOf`, `Face` | the cone of curves, fans |
| Frobenius | `Algebra/CharP/Frobenius`, `RingTheory/Perfection` | `frobenius` | route R7 |

**What the MMP needs, and Mathlib lacks** [U, by absence]:

| Topic | Status | The project's answer |
|---|---|---|
| normal schemes, varieties | no class | local `IsVariety` (from singularity-lean) and `IsNormalVariety` (06.1) |
| projective morphisms, $\mathbb{P}^n$ as a scheme | no `IsProjective`; PR #26061 draft | port `ProjectiveSpace` from formal-conjectures; `IsProjectiveOver` as a local definition |
| Cartier divisors, line bundles, $\mathrm{Pic}$ of a scheme | none; PR #44200 open | local definitions with the shapes of TauCeti (5.3); bridge when Mathlib merges |
| linear equivalence, class group | PR #38472 open | local, mirroring the PR |
| ample, nef, big, intersection numbers | none | `IsAmple` local; intersection numbers as a structure `IntersectionData` with axioms as fields (06.1), and the Euler characteristic definition when finiteness exists |
| $N^1$, $N_1$, Néron-Severi | none | defined; finite dimension as a hypothesis (03.14) |
| coherent finiteness on proper schemes | none | a named hypothesis; the largest gap (E §7, L2) |
| Serre duality, Riemann-Roch, vanishing | none; #41621 draft for curves | named hypotheses with fidelity records |
| canonical divisor | none | a structure: a Weil divisor with an isomorphism to $\omega$ on the smooth locus |
| blow-ups, resolution | none | `blowupChart` from singularity-lean; `HasLogResolution` as the shared hypothesis |
| Kodaira dimension, section rings | none | local, on `Proj` and graded rings |
| fans, polyhedra, toric varieties | none; polytopes PR #42647 open | route R3 builds fans (04.4) |
| Kähler manifolds, currents | none | route R9 states only |

**Open PRs to watch** [P]: principal Weil divisors #38472; the sheaf of a Weil divisor #38953; $R_k$ #43440; conditional Riemann-Roch for curves #41621 (draft); the Picard group #44200; affine vanishing #36345; flasque vanishing #35790; the cohomology API #43392; polytopes #42647; conic Carathéodory #44900; the dual cone rework #37951; faces of sets #45046; projective space #26061. At each pin bump the `porter` role records the merge status and opens a migration task for each merged PR (09.3).

## 5.2 AxiomMath/MMP and AxiomMath/Stacks

**AxiomMath/MMP** [P][R] (E §2.1):
- github.com/AxiomMath/MMP, Apache-2.0; one commit `1f9ade3670`, 2026-11-16, "The minimal model program in Lean"; Lean v4.35.0; Mathlib `56a005855e`; Stacks `c496df0d9beea9deaeabcea8492605f9a0a2313b`.
- 2,269 files, 116.4 MB, about 2,054,000 lines.
- The README says the modules were "written by AI agents" and have "not yet been reviewed by humans", and claims no `sorry`, no `native_decide` and no added axiom.
- The main theorem `MMP.Fourfold.Program.IsMaximal.isNefOnCurves_or_isMoriFibreSpace` has the hypotheses `[Field k] [IsAlgClosed k] [CharZero k] {X : Scheme.{0}} [IsIntegral X] [CompactSpace X] [IsLocallyNoetherian X] [IsNormal X] {K : Divisor X} {B : QDivisor X} (hdim : topologicalKrullDim X = 4) {P : Program sX K B} (hP : P.IsMaximal)` and the conclusion that `P.n ≠ ⊤` and the end is nef on curves or a Mori fibre space.
- Sizes of the parts, estimated from bytes [U]: Fourfold 391k lines, Singularities 310k, Resolution 178k, Analytic 129k, Abundance 114k, Threefold 96k, Vanishing 62k, MinimalModel 55k, Divisor 55k, Surface 52k, Intersection 49k, Flip 42k, Positivity 42k, ConeTheorem 32k, Termination 29k.
- There is no toric file. The five hits for "toric" are inside the word "Combinatorics" [P].

**AxiomMath/Stacks** [P] (E §2.2): Apache-2.0, v4.35.0, `StacksCore` and `StacksFrontier`, 44,630 files in `StacksFrontier/AlgebraicGeometry` alone (about 700 MB). The parts that matter: Divisors (555 files), Intersection (259), Picard (205), Blowup (281), ResolutionOfSurfaces (496), Surfaces (99), Duality (1,061), Quot (1,671).

**How the project uses them.**
1. **Audit.** Route R2 (04.3) reads the statement closure of the main theorems. The audit records live in `tamnd/mmp`, not in the Lean repository.
2. **Bridge.** The package `MinimalModelBridge` (09.4) depends on AxiomMath/MMP at `1f9ade3670` and proves the project's statements from Axiom's theorems. It is the only package that imports `MMP`. Its CI runs on a large machine and is not part of the main build.
3. **Port statements, not proofs.** When the main library needs an AxiomMath definition, the `porter` copies the definition and the statements of the lemmas, with the header line of 5.4, and proves them again or keeps them as named hypotheses. It never copies a proof of more than 200 lines; a longer proof stays behind the bridge.
4. **Never reprove at scale.** The project does not write a second 4-fold MMP (02.5).

The universe matters: AxiomMath/MMP fixes `Scheme.{0}`. The project's statements are universe polymorphic. The bridge specializes them to universe 0 (recheck item: whether the comparator accepts this, Q-07).

## 5.3 Small sources to port

| Source | Commit, pin | What the project takes | How |
|---|---|---|---|
| singularity-lean (tamnd) | `9e18e81`, v4.35.0 | `IsVariety`, `regularLocus`, `IsResolution`, `IsSncDivisor`, `IsEmbeddedResolution`, `strictTransform`, `blowupChart`, `NormalDimOne` (normal implies regular in codimension 1), divisorial valuations (26 files) | port by file; the resolution vocabulary is the shared one (06.1) |
| langlands-lean (tamnd) | `da1c218`, v4.35.0 | the shape of `Comparator/`, `Fidelity/`, `Bridge/`, `manifests/`, scripts | copy the skeleton |
| formal-conjectures (google-deepmind) | `9097e2f90e`, v4.33.1 | `ProjectiveSpace` (43 lines), `VectorBundleData` (61 lines), `Scheme.HasResolution` | port with a port check, since the pin differs |
| TauCeti | `6b0d2cd87d`, v4.37.0-rc1 | the statement shapes of `InvertibleSheaf`, `LineBundleClass`, `IsAmple`, `intersectionNumber` (via Euler characteristics), `IsNef`, `NumericalClassGroup`; the rational polyhedron files (32) for R3 | copy shapes; port small files with a back-port to v4.35.0 |
| YaelDillies/toric | `97b1287db9`, v4.37.0-rc1 | `ToricVariety`, `SplitTorus` | read now; coordinate for the scheme dictionary of R3 step 9 |
| resolutionorg/hironaka | v4.35.0 | the blow-up library and the char 0 resolution statement | read; the bridge for `HasLogResolution` in char 0, if it is proved |

## 5.4 The porting rule

The rule of spec 2161l applies with one change.
1. **Port, do not depend**, in the main library. The main library builds on Mathlib alone.
2. Each ported file starts with the line `-- Ported from <repo>@<commit>:<path>`, and has an entry in `manifests/ported.yaml` with the fields `repo`, `commit`, `licence`, `paths`, `into`, `changes`.
3. Only sources with a licence that allows it are ported (Apache-2.0, MIT, BSD). A source without a licence is read and cited, never copied.
4. A ported statement keeps its fidelity record from the source, if any, and gets a new one in the project (06.3).
5. **The change:** an AI-written source (AxiomMath/MMP, AxiomMath/Stacks, TauCeti) gets one more field, `ai_written: true`. A definition ported from it must pass F6 (two human readers) before any statement that uses it can have status `faithful`.

## 5.5 The first port: the pair vocabulary

The first port is the base of 06.1. It is chosen because every statement needs it and because it is small.

| Step | From | Into | Size |
|---|---|---|---|
| 1 | singularity-lean `Statements/Basic.lean`: `IsVariety`, `regularLocus`, `IsRegularScheme` | `MinimalModel/Ported/Singularity/Basic.lean` | about 300 lines |
| 2 | singularity-lean `Statements/Embedded.lean`: `IsSncDivisor`, `IsEmbeddedResolution`, `strictTransform` | `MinimalModel/Ported/Singularity/Embedded.lean` | about 900 lines |
| 3 | singularity-lean `Scheme/NormalDimOne.lean` | `MinimalModel/Ported/Singularity/NormalDimOne.lean` | about 400 lines |
| 4 | formal-conjectures `ProjectiveSpace.lean` | `MinimalModel/Ported/FormalConjectures/ProjectiveSpace.lean` | 43 lines |
| 5 | TauCeti `LineBundle/Ample.lean` and `IntersectionNumber/Nef.lean`, statement shapes | `MinimalModel/Positivity/Shapes.lean`, rewritten | about 500 lines |

Exit: the five files build on Mathlib at the pin; `manifests/ported.yaml` has five entries; the `Fidelity/` tests of 06.3 for `IsSncDivisor` and `IsVariety` pass.

## 5.6 The cross-checks

Two sources prove some of the same things in different ways. The project uses the agreement as evidence and the disagreement as a task.

| Pair | What to compare | Where |
|---|---|---|
| project toric cone theorem (R3) and AxiomMath `IsKltPair.exists_relativeClosedConeOfCurves_eq_add_hull` | both give `PointedCone` decompositions; on a toric instance they must agree | `MinimalModelBridge/Toric.lean`, after the scheme dictionary |
| project discrepancy (06.1) and AxiomMath `Singularities/*` | the class of the cone over a rational normal curve of degree $m$ (Example 3.4) | `Fidelity/Discrepancy.lean` and the bridge |
| project `IsAmple` (TauCeti shape) and AxiomMath `Positivity/*` | ampleness of $\mathcal{O}(1)$ on $\mathbb{P}^n$ | the bridge |
| AxiomMath surface program and the project's statement S12 | the output of the program on $\mathrm{Bl}_p\mathbb{P}^2$ | the bridge (O-R2-2) |
| TauCeti intersection numbers and AxiomMath `Intersection/*` | $E^2=-1$ on $\mathrm{Bl}_p\mathbb{P}^2$ | read only, since TauCeti is on another pin |

## 5.7 What the base does not give

1. **Coherent finiteness, Serre duality, Riemann-Roch and vanishing** on Mathlib. These are the largest gap. The project states them as named hypotheses and does not plan to prove them before S6 (15). Upstream work on them belongs to Mathlib and to others; the project contributes test cases and reviews (09.5).
2. **Resolution of singularities.** Spec 2161 works on it. The project uses `HasLogResolution`.
3. **The theorem of the base.** $N^1(X)$ finite dimensional is a hypothesis.
4. **A reviewed MMP.** AxiomMath/MMP is the only one, and it is not reviewed (R2).
5. **Anything toric.** The project builds it (R3).
6. **Kähler geometry and foliations.** Statements only (R8, R9).
