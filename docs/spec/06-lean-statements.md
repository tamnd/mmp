# 06. The Lean statements and how to trust them

A Lean proof is worth only as much as its statement. In the MMP this risk is large, for three reasons:
- **The statements are long chains of definitions.** "Every MMP for an lc pair terminates" uses varieties, normality, divisors with real coefficients, the canonical divisor, discrepancies over all divisorial valuations, the cone of curves, extremal rays, contractions, flips and sequences of them. An error at any link changes the meaning, and the kernel cannot see it.
- **Small hypotheses carry the content.** Klt or lc, $\mathbb{Q}$ or $\mathbb{R}$ coefficients, $\mathbb{Q}$-factorial or not, "every program" or "some program": each choice gives a different theorem or a different conjecture, and some of them are false.
- **Many foundations are hypotheses.** Vanishing, the theorem of the base and log resolutions enter as named `Prop`s or as structures with axioms as fields. A set of hypotheses that cannot all hold makes every statement provable.

This document fixes the Lean form of the main statements and the checks that each statement passes before any proof of it counts.

The statements live in one file per family, `MinimalModel/Statements/*.lean`. Each file imports only Mathlib and `MinimalModel/Statements/Basic.lean`.
- The files are small and have comments. They are the files that a referee reads.
- Each statement is a `def ... : Prop`. A proof is a separate `theorem` in another file.
- The statement files are pinned in `manifests/statements.sha256` and compared with `lake comparator` (09.6).

The Mathlib names in this document are those of the pin (05.1) as report E gives them [P]. The `stater` role checks each name at S0. A renamed declaration changes only the code, not the decision.

## 6.1 The vocabulary

All names are in the namespace `MinimalModel`. Where Mathlib or a ported source (05.3) has the notion, the statement uses it and does not define it again. The sketch below fixes the shapes. The bodies marked `sorry` are written at S0; CI rejects the file until they are filled (09.2).

```lean
import Mathlib

universe u

open AlgebraicGeometry CategoryTheory

namespace MinimalModel

variable (k : Type u) [Field k]

/-- A variety over `k`: an integral scheme, separated and of finite type over `k`.
Ported from singularity-lean (05.5, step 1). -/
class IsVariety (X : Scheme.{u}) (f : X ⟶ Spec (.of k)) : Prop where
  integral : IsIntegral X
  separated : IsSeparated f
  finiteType : LocallyOfFiniteType f
  compact : CompactSpace X

/-- Normal: all stalks are integrally closed domains. -/
class IsNormalScheme (X : Scheme.{u}) : Prop where
  isIntegrallyClosed_stalk : ∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)

/-- Prime divisors are the points of coheight one. -/
def PrimeDivisor (X : Scheme.{u}) : Type u := {x : X // Order.coheight x = 1}

/-- Divisors with coefficients in `R`. `QDivisor` and `RDivisor` are the cases ℚ and ℝ.
This is the shape of AxiomMath/MMP, so the bridge is an identity (6.4). -/
abbrev Divisor (R : Type*) [AddCommGroup R] (X : Scheme.{u}) := PrimeDivisor X →₀ R

variable {X : Scheme.{u}} [IsIntegral X] [IsNormalScheme X]

/-- The divisor of a rational function, from Mathlib `ord` at codimension one points. -/
noncomputable def Divisor.principal (φ : (X.functionField)ˣ) : Divisor ℤ X := sorry

/-- `D ∼_R D'`: the difference is an ℝ-combination of principal divisors. -/
def RLinEquiv (D D' : Divisor ℝ X) : Prop := sorry

/-- Locally principal, and its ℚ and ℝ versions. -/
def IsCartier (D : Divisor ℤ X) : Prop := sorry
def IsQCartier (D : Divisor ℚ X) : Prop := sorry
def IsRCartier (D : Divisor ℝ X) : Prop := sorry
class IsQFactorial (X : Scheme.{u}) [IsIntegral X] [IsNormalScheme X] : Prop where
  qCartier : ∀ D : Divisor ℚ X, IsQCartier D

/-- A canonical divisor: a Weil divisor with `𝒪(K) ≅ ω` on the smooth locus. -/
structure CanonicalDivisor (X : Scheme.{u}) [IsIntegral X] [IsNormalScheme X] where
  K : Divisor ℤ X
  iso_on_smooth : sorry

/-- A pair `(X, Δ)` with `Δ ≥ 0` and `K_X + Δ` ℝ-Cartier. -/
structure Pair (X : Scheme.{u}) [IsIntegral X] [IsNormalScheme X] where
  K : CanonicalDivisor X
  Δ : Divisor ℝ X
  nonneg : 0 ≤ Δ
  rCartier : IsRCartier (K.K.mapRange (↑) (by simp) + Δ)

/-- The intersection pairing of ℝ-Cartier divisors with curves, as data with its axioms.
At S6 it is built from Euler characteristics (TauCeti shape, 05.3). Each use
must come with an instance (F2), so the axioms are known to be consistent. -/
structure IntersectionData (X : Scheme.{u}) [IsIntegral X] [IsNormalScheme X] where
  Curve : Type u
  dot : Divisor ℝ X → Curve → ℝ
  dot_add : ∀ D D' C, dot (D + D') C = dot D C + dot D' C
  dot_principal : ∀ φ C, dot ((Divisor.principal φ).mapRange (↑) (by simp)) C = 0
  finiteDim : sorry   -- the theorem of the base, a hypothesis (03.14)

variable (I : IntersectionData X)

/-- `N₁(X)`, the closed cone of curves as a Mathlib `PointedCone`, and positivity. -/
def N₁ : Type u := sorry
def coneOfCurves : PointedCone ℝ (N₁ I) := sorry
def IsNef (D : Divisor ℝ X) : Prop := ∀ C, 0 ≤ I.dot D C
def IsAmple (D : Divisor ℝ X) : Prop := sorry      -- some multiple very ample; Kleiman is S01
def IsBig (D : Divisor ℝ X) : Prop := sorry
def IsPseudoEffective (D : Divisor ℝ X) : Prop := sorry
def IsSemiample (D : Divisor ℝ X) : Prop := sorry
noncomputable def iitakaDim (D : Divisor ℚ X) : WithBot ℕ := sorry
noncomputable def numericalDim (D : Divisor ℝ X) : WithBot ℕ := sorry  -- Nakayama's κ_σ (risk 4)

/-- Divisorial valuations of `K(X)` and their centres on `X`. -/
structure DivisorialValuation (X : Scheme.{u}) [IsIntegral X] where
  v : Valuation X.functionField (WithZero (Multiplicative ℤ))
  isDivisorial : sorry
  centre : X

/-- The log discrepancy `A_{X,Δ}(E)`; the discrepancy is `A - 1`. -/
noncomputable def logDiscrepancy (P : Pair X) (E : DivisorialValuation X) : ℝ := sorry

def IsKlt (P : Pair X) : Prop := ∀ E, 0 < logDiscrepancy P E
def IsLc (P : Pair X) : Prop := ∀ E, 0 ≤ logDiscrepancy P E
def IsTerminal (P : Pair X) : Prop := sorry   -- `1 < A` on exceptional `E`
def IsCanonical (P : Pair X) : Prop := sorry
def IsDlt (P : Pair X) : Prop := sorry
noncomputable def mld (P : Pair X) (x : X) : WithBot ℝ := sorry
noncomputable def lct (P : Pair X) (D : Divisor ℝ X) : ℝ := sorry

/-- Log resolutions exist. Shared with spec 2161 (one `Prop`, one record in both maps). -/
def HasLogResolution (P : Pair X) : Prop := sorry

/-- An extremal ray, its contraction, and a flip. -/
structure ExtremalRay where
  generator : N₁ I
  mem : generator ∈ coneOfCurves I
  ne_zero : generator ≠ 0
  isExtremal : sorry   -- a + b ∈ ray with a, b in the cone gives a, b ∈ ray
structure Flip (P : Pair X) where
  target : Scheme.{u}
  map : X ⤏ target
  small : sorry
  kPlusAmple : sorry

/-- An MMP: steps indexed by `ℕ`, each a divisorial contraction or a flip of a
`(K+Δ)`-negative extremal ray, that may stop at a minimal model or a Mori fibre space. -/
structure Program (P : Pair X) where
  len : ℕ∞
  step : ∀ i : ℕ, (i : ℕ∞) < len → sorry
  isMaximal : Prop := sorry    -- it stops only at a minimal model or a Mori fibre space

end MinimalModel
```

The definitions of discrepancy use **all** divisorial valuations, not one resolution. The test on one log resolution is a theorem under `HasLogResolution` (statement-level lemma `isKlt_iff_of_logResolution`). This keeps the shared hypothesis out of the definitions.

## 6.2 The main statements

### 6.2.1 Families

The 60 statements are in eight families, one file each. Each statement has an id `Snn`, a Lean name, a class, a vocabulary status and a planned milestone.
- Classes: `theorem` (in the literature, refereed), `open` (a conjecture), `claimed` (a fresh claim of 01.3; never a hypothesis, 6.6), `reduction` (an implication between other statements), `refuted` (a conjecture that the literature disproves; the statement is its negation, class `claimed` until refereed).
- Vocabulary: `ready` (Mathlib and 6.1 suffice), `partial` (needs a named hypothesis), `missing` (needs a family of definitions not yet in 6.1).
- Milestones are those of 15. A statement planned at S0 is stated and passes F1 to F3 at S0.

### 6.2.2 The list

**Family A: foundations** (`Statements/Foundations.lean`)

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S01 | `KleimanCriterion` | for projective $X$, $D$ is ample if and only if it is positive on $\overline{NE}(X)\setminus0$ | theorem | partial | S1 |
| S02 | `KawamataViehweg` | 3.5, klt form, relative | theorem | partial (coherent cohomology) | S1 |
| S03 | `KollarTorsionFree` | Kollár's injectivity and torsion freeness | theorem | partial | S3 |
| S04 | `ConeTheoremKlt` | 3.6 for projective klt pairs | theorem | ready | S0 |
| S05 | `ConeTheoremLc` | 3.6 for lc pairs (Fujino) | theorem | ready | S1 |
| S06 | `ContractionTheorem` | 3.7, contraction of a $(K+\Delta)$-negative extremal face | theorem | partial | S1 |
| S07 | `RationalityTheorem` | the nef threshold is rational with bounded denominator | theorem | ready | S1 |
| S08 | `BasepointFree` | nef $D$ with $aD-(K+\Delta)$ nef and big is semiample | theorem | ready | S1 |
| S09 | `LengthOfExtremalRays` | each negative ray is spanned by a rational curve with $-(K+\Delta)\cdot C\le2\dim X$ | theorem | partial (rational curves) | S2 |

**Family B: surfaces and 3-folds** (`Statements/LowDim.lean`)

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S10 | `Castelnuovo` | a $(-1)$-curve on a smooth projective surface contracts to a smooth point | theorem | partial (blow-ups) | S0 |
| S11 | `SurfaceConeTheorem` | the cone theorem for smooth projective surfaces | theorem | ready | S0 |
| S12 | `SurfaceMMP` | every smooth projective surface has a minimal model or is a $\mathbb{P}^1$-bundle or $\mathbb{P}^2$ | theorem | ready | S0 |
| S13 | `LcSurfaceMMP` | the MMP for lc surface pairs (Fujino) | theorem | ready | S1 |
| S14 | `SurfaceAbundance` | abundance for lc surface pairs | theorem | partial | S2 |
| S15 | `ThreefoldFlips` | flips exist for 3-fold klt pairs (Mori, Shokurov) | theorem | ready | S1 |
| S16 | `ThreefoldTermination` | T(3) for lc pairs | theorem | ready | S1 |
| S17 | `ThreefoldAbundance` | abundance for lc 3-folds (Miyaoka, Kawamata, KMM) | theorem | partial | S2 |
| S18 | `ThreefoldLcMMP` | the lc 3-fold MMP runs and ends | theorem | ready | S1 |

**Family C: termination and flips** (`Statements/Termination.lean`)

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S19 | `SpecialTermination` | T(n-1) gives special termination in dim $n$ | reduction | ready | S1 |
| S20 | `Termination n` | T(n): every sequence of flips for an lc $n$-fold pair is finite | open | ready | S0 |
| S21 | `TerminationPseffLc4` | T(4) for lc pairs with $K+\Delta$ pseudo-effective (Moraga) | theorem | ready | S1 |
| S22 | `TerminationLc4Rational` | every MMP for a projective lc 4-fold with rational boundary terminates (OpenAI 056, AxiomMath/MMP) | claimed | ready | S0 |
| S23 | `TerminationScalingBig` | BCHM 1.4.2 | theorem | ready | S1 |
| S24 | `TerminationBigLe5` | every MMP terminates for klt pairs with big boundary or big $K+\Delta$, $n\le5$ (HLZ) | claimed | ready | S1 |
| S25 | `TerminationBig n` | the same in all dimensions (Hashizume) | claimed | ready | S1 |
| S26 | `LcFlips` | lc flips exist (Birkar, Hacon-Xu) | theorem | ready | S1 |
| S27 | `GeneralizedLcFlips` | flips exist for all lc generalized pairs (Hu-Liu) | claimed | missing (generalized pairs) | S3 |
| S28 | `ShokurovReduction` | ACC and LSC for mld in dim $n$ give T(n) | reduction | ready | S0 |
| S29 | `HanLiuReduction` | ACC for enc mlds and T(terminal flips) give T(n) | reduction | ready | S2 |

**Family D: BCHM, models and the Sarkisov program** (`Statements/Models.lean`)

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S30 | `KltFlips` | klt flips exist in all dimensions (BCHM 1.4.1) | theorem | ready | S0 |
| S31 | `BCHM` | Theorem 3.10, with the induction $A_n$ to $F_n$ as six sub-statements | theorem | partial (extension theorems) | S2 |
| S32 | `FiniteGenerationCanonical` | the canonical ring of a smooth projective variety is finitely generated | theorem | ready | S0 |
| S33 | `MinimalModelConj` | every projective lc pair with $K+\Delta$ pseudo-effective has a minimal model | open | ready | S0 |
| S34 | `FinitenessOfModels` | $E_n$: finitely many log terminal models over a rational polytope | theorem | ready | S2 |
| S35 | `MoriFibreSpaceOutput` | not pseudo-effective and big boundary gives a Mori fibre space (BCHM 1.3.2) | theorem | ready | S1 |
| S36 | `Sarkisov` | two Mori fibre space outputs are joined by Sarkisov links (Hacon-McKernan) | theorem | missing (links) | S3 |
| S37 | `FanoTypeMDS` | $\mathbb{Q}$-factorial Fano type varieties are Mori dream spaces (BCHM 1.3.1) | theorem | partial (Cox rings) | S3 |
| S38 | `StrongSarkisov n` | the strong Sarkisov program; theorem for $n\le4$ (He), claimed for all $n$ | open | missing | S4 |
| S39 | `ToricMMP` | every toric MMP of a simplicial projective fan ends at a minimal model or a Mori fibre space, with toric mld formulas | theorem | ready (fans, R3) | S2 |

**Family E: abundance and non-vanishing** (`Statements/Abundance.lean`)

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S40 | `Abundance n` | 3.12 in dim $n$ | open | ready | S0 |
| S41 | `NonVanishing n` | 3.13 in dim $n$ | open | ready | S0 |
| S42 | `AbundanceBig` | abundance when $K+\Delta$ is big (klt) | theorem | ready | S1 |
| S43 | `AbundanceNuZero` | abundance when $\nu(K+\Delta)=0$ | theorem | ready | S2 |
| S44 | `LiuXuReduction` | non-vanishing in dim $d$ gives abundance for $\nu\le1$ in dim $d$ | reduction | ready | S1 |
| S45 | `GeneralizedAbundance` | Lazić-Peternell | open | ready | S2 |
| S46 | `IitakaConj` | $C_{n,m}$ | open | ready | S2 |
| S47 | `BSemiampleness` | the moduli part of an lc trivial fibration is b-semiample (BFMT) | claimed | missing (b-divisors) | S4 |

**Family F: invariants and boundedness** (`Statements/Boundedness.lean`)

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S48 | `ACCLct` | 3.15 (HMX) | theorem | ready | S1 |
| S49 | `ACCMld n` | 3.16 | open | ready | S0 |
| S50 | `LSCMld n` | 3.17 | open | ready | S0 |
| S51 | `MldBound` | 3.18 | open | ready | S1 |
| S52 | `HanLiuEncACC` | Han-Liu Conj. 1.9(2') in dim 4, and its toric case (Target T, 04.12) | open | ready | S1 |
| S53 | `BAB` | 3.19 | theorem | partial (bounded families) | S3 |
| S54 | `IndexConj` | the index conjecture for klt log CY pairs | open | ready | S2 |
| S55 | `ConeConj` | the Kawamata-Morrison cone conjecture for klt CY pairs | open | partial (automorphism groups) | S3 |

**Family G: effective results** (`Statements/Effective.lean`)

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S56 | `FujitaFreeness` | $K_X+mL$ is free for ample $L$ and $m\ge\dim X+1$ | open | ready | S1 |
| S57 | `NotEffectiveNonVanishing4` | the negation of the Ambro-Kawamata conjecture in dim 4, with Ajit's example as the witness | refuted | partial (abelian varieties) | S1 |

**Family H: other settings** (`Statements/OtherSettings.lean`)

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S58 | `CharP3foldLcMMP` | the lc 3-fold MMP over a perfect field of characteristic $p\ge5$ | theorem | partial (Frobenius) | S4 |
| S59 | `KahlerThreefoldMMP` | the MMP for compact Kähler 3-folds | theorem | missing (Kähler) | S6 |
| S60 | `AlgIntFoliationMMP` | the MMP for algebraically integrable foliations | theorem | missing (foliations) | S6 |

The table has 60 rows. G1 (02.3) has two parts:
- **G1a**: the rows with vocabulary `ready` or `partial`, 54 rows. Target: all stated and through F5 by S4.
- **G1b**: the rows with vocabulary `missing`, 6 rows (S27, S36, S38, S47, S59, S60). Each has a node with status `unstated` and `needs` edges to the missing definitions until its family exists. `mmp status` (10.1) checks the counts.

Statements that are not in the 60 but have nodes: the dimension-specific forms (`Termination 5`, `Abundance 4`), the char $p$ and mixed forms of each family, boundedness of CY 3-folds, very ampleness, the dual complex conjecture, the claims of 01.3 that are not above. They are added by the `stater` role as the routes reach them, with the same battery.

### 6.2.3 The decisions in these statements

| Decision | Choice | Why |
|---|---|---|
| Every program or some program | every, for all termination statements; "some" is a separate weaker statement with its own name (`ExistsTerminatingMMP`) | BCHM prove "some" (with scaling) and say so; the conjectures are about every sequence (risk 1) |
| $\mathbb{Q}$ or $\mathbb{R}$ coefficients | $\mathbb{R}$ in definitions; each statement names the coefficient set in its hypotheses (`Δ.coeffsIn ℚ`) | the literature uses both; S22 is for rational boundary only |
| $\mathbb{Q}$-factorial | a hypothesis where the source has it; programs carry it in each step | KM98 runs the MMP on $\mathbb{Q}$-factorial pairs; AxiomMath/MMP does not assume it (04.3, A5) |
| Absolute or relative | relative over a base `U` with a projective morphism; the absolute case is `U = Spec k` | BCHM is relative, and relative statements are needed for flips |
| The field | `[Field k] [IsAlgClosed k] [CharZero k]` for families A to G; `CharP k p` and `PerfectField k` for S58 | the standard setting; char $p$ statements are a separate family (03.14) |
| Discrepancy | log discrepancy over all divisorial valuations, with a lemma for one log resolution | keeps `HasLogResolution` out of definitions (6.1) |
| Intersection theory | `IntersectionData` with axioms as fields, and an instance for each use | coherent finiteness is far from Mathlib (05.7); risk 9 |
| Numerical dimension | Nakayama's $\kappa_\sigma$ in definitions; other versions are separate names with an equivalence lemma where known | risk 4 |
| Universe | one universe `u`; the bridge specializes to 0 | AxiomMath/MMP fixes `Scheme.{0}` (05.2) |
| Hypotheses for deep inputs | a published but unformalized theorem is a named `def ... : Prop`, never an `axiom` | the proof of a downstream theorem shows its hypotheses in its type, and `#print axioms` stays clean (09.2) |

## 6.3 The fidelity battery

A statement is *trusted* only after it passes every check below. The results are rows of `records/fidelity.json`. The site shows them (12, page Trust).

| Check | What it does | Who does it |
|---|---|---|
| F1. Elaboration | the file builds with the pinned toolchain; it has no `sorry`, `axiom` or `opaque`; `#print axioms` of each statement shows at most `propext`, `Classical.choice`, `Quot.sound` | CI |
| F2. Positive instances | proofs of the statement in known cases, or of known cases from it: the cone theorem on $\mathbb{P}^n$, $\mathbb{F}_n$ and $\mathrm{Bl}_p\mathbb{P}^2$; discrepancies of the cone over a rational normal curve (Example 3.4); $\mathrm{mld}=n$ at a smooth point; a toric flip (Francia's); termination on a toric instance. **Every structure of hypotheses (`IntersectionData`, vanishing) gets one instance**, so its axioms are consistent | agent `stater` and people |
| F3. Negative instances | proofs that wrong variants are false or trivial: drop "every" and show that "some program terminates" holds for a trivial program; drop `small` from `Flip` and build an infinite sequence of steps; allow $\Delta$ with coefficients $>1$ and show that lc becomes empty; drop $\mathbb{Q}$-factoriality and show that a step leaves the class of pairs | agent `refuter` |
| F4. Triviality attack | a strong prover gets a budget to prove the statement in a trivial way: an empty type of programs, a vacuous `IsMaximal`, a cone of curves that is zero, an `IntersectionData` with no curves, a universe quirk; a success is a failed check | agent `refuter`, budget in 10.6 |
| F5. Round trip | an independent model translates the Lean statement to English without the docstring; a person compares the result with the docstring and with KM98 or the source paper | agent `explainer` and people |
| F6. Human review | two birational geometers sign that the Lean statement means the docstring; the names and dates go into `records/fidelity.json` | people |
| F7. Pinning | the statement file hash is in `manifests/statements.sha256`; `lake comparator` matches each proof to the pinned statement | CI |

A statement of class `theorem` or `reduction` counts for G1 after F1 to F5. A statement that a top theorem of 14.2 proves needs F6 too.

A statement of class `open`, `claimed` or `refuted` needs all seven before any proof of it is announced. F6 must have reviewers from two different groups of document 01:
- a core MMP group (BCHM, termination, abundance);
- a singularities and boundedness group (mld, ACC, BAB, K-stability);
- a characteristic $p$ group, for family H and route R7;
- a Lean group that knows Mathlib algebraic geometry, for the definitions of 6.1.

A statement is frozen after F6. A change after F6 starts the battery again.

**The audit is the battery applied to someone else's statements.** Route R2 (04.3) runs F1, F2, F3, F4 and F6 on the AxiomMath/MMP definitions and main theorems. Its results go into `records/fidelity.json` with the source `AxiomMath/MMP@1f9ade3670`.

## 6.4 The bridges to other statements

In 2026 several public Lean statements overlap the project's. Each is a test of the project's statements, because different people (or systems) wrote them for different purposes.

| External statement | Where | Bridge to prove |
|---|---|---|
| `MMP.Fourfold.Program.IsMaximal.isNefOnCurves_or_isMoriFibreSpace`, `n_ne_top_of_isAlgClosed` | AxiomMath/MMP | S22, and S20 for $n=4$ with rational boundary; universe 0 |
| `projectiveLowerLogMMP_three` | AxiomMath/MMP | S18, S16 |
| `rationalBirationalProgramProperty_two` | AxiomMath/MMP | S12, S13 |
| `subsingleton_derivedCohomologyOverField_divisorialSheaf_neg` | AxiomMath/MMP | S02 for smooth projective $X$ with snc $\Delta$ |
| `IsKltPair.exists_relativeClosedConeOfCurves_eq_add_hull` | AxiomMath/MMP | S04, relative form |
| `MMP.Mori.IsNormalVariety`, `QDivisor`, `PrimeDivisor` | AxiomMath/MMP | the 6.1 vocabulary: equivalences proved in the bridge |
| `IsAmple`, `IsNef`, `intersectionNumber` | TauCeti | the 6.1 positivity shapes, after a back-port (05.3) |
| `IsSncDivisor`, `IsEmbeddedResolution` | singularity-lean | `HasLogResolution` is equivalent to their resolution statement for snc pairs |
| `resolution_of_singularities_of_charZero` | formal-conjectures | `HasLogResolution` in char 0 |
| `ToricVariety` | YaelDillies/toric | the scheme of a fan (R3 step 9) is a `ToricVariety` |

The bridges are proved in `MinimalModelBridge/` for AxiomMath/MMP (09.4) and in `MinimalModel/Bridge/` for the small sources, one file per external statement. Each external statement is copied word for word into the bridge file with its source commit. A change upstream then shows as a failed comparison, not as a silent change of meaning.

## 6.5 Misformalization risks, ranked

1. **"Some program terminates" in place of "every program terminates".** The first is BCHM with scaling; the second is the conjecture. A statement with a quantifier in the wrong place proves a known theorem and claims an open one. Check: F3 as in 6.3, and in the audit, step A6.
2. **A flip that is not a flip.** If `Flip` does not require the map to be small, $K^+$-ample over the base and an isomorphism in codimension one, then trivial or wrong steps enter programs, and termination becomes false or trivial. Check: F3 (drop each field and show the failure), and F2 on Francia's flip.
3. **A hidden or dropped hypothesis.** The pair class, the coefficient set, $\mathbb{Q}$-factoriality and the base field. Check: the decision table 6.2.3, and a lint (10.3, role `auditor`) that compares the hypotheses of each statement with its source theorem.
4. **Numerical dimension.** $\nu$ has several definitions for pseudo-effective divisors (Nakayama's $\kappa_\sigma$, Lehmann's variants); they agree in some cases only. A statement of abundance or of Liu-Xu with the wrong one is a different statement. Check: each use names its version; equivalence lemmas only where proved.
5. **Discrepancy conventions.** Discrepancy and log discrepancy differ by 1, and signs differ between sources. "Over all divisors" and "over exceptional divisors" give different classes (klt versus plt). Check: F2 on Example 3.4 and on smooth points, in both conventions.
6. **The cone of curves.** Curves must be integral, proper, and over the right field; $N_1$ must be numerical classes, not cycles. A cone of cycles that is not closed or not finite dimensional changes "extremal ray". Check: F2 on $\mathbb{F}_n$; the bridge to AxiomMath `closedConeOfCurves`.
7. **$\mathbb{Q}$ and $\mathbb{R}$.** $\sim_\mathbb{R}$ and $\equiv$ differ; $\mathbb{R}$-Cartier is not "some multiple is Cartier". Check: a lemma for each implication that holds and a counterexample (toric) for each that fails.
8. **Universe and size.** A statement over `Scheme.{u}` that is proved only for `u = 0`. Check: `#check @theorem.{1}` works for the project's statements; the bridge is the only place with universe 0.
9. **Inconsistent hypotheses.** A structure of axioms (`IntersectionData`, a vanishing `Prop`) that has no model makes every statement that assumes it provable. Check: F2 requires an instance of each structure, in the toric or surface world.
10. **Relative and absolute.** Ampleness over $U$ and absolute ampleness differ; flips are relative over the base of the contraction. Check: the absolute case as `U = Spec k`, with a lemma.

## 6.6 Claims

The project never states in its README, on the site or in a release note that it has proved an open case unless all of these hold:
- the proof builds;
- the axioms are the three standard ones;
- two kernels accept it (the Lean kernel and nanoda or lean4lean, 14.1);
- the statement passed F1 to F7;
- at least two experts who are not paid by the project have read the written proof in the handbook.

Before that, the status is "a Lean proof that has passed checks F1 to Fn". The site says which checks (14).

For a fresh claim of route R1 the rule is the same in the other direction. The project says only "a Lean check of section X of the preprint found Y". It names the statement, the hypotheses and the checks passed. It writes to the authors before any page goes public (14.4). **A fresh claim is never a hypothesis of another node.** It enters as a hypothesis only after its paper is accepted by experts, and then as a named `Prop` with its paper record (07.14).

For AxiomMath/MMP the rule has one more step. Its theorems are kernel-checked, but they are not the project's statements until the bridge of 6.4 is proved and the audit of 04.3 passes. Until then S22 has status `claimed`, whatever the bridge build says. After the audit passes, S22 changes to `proved-ext` (08.3) with the credit line "proof by OpenAI (paper) and Axiom (Lean); audit by the project" (14.2). It becomes `proved` only if the proof is ported into `MinimalModel`.
