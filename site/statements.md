---
title: The statements
description: The 60 main statements of the minimal model program that mmp-lean will hold, by family, with their class, their vocabulary and their planned milestone.
lead: "Each main statement of the program is a `def ... : Prop` in a small statement file of mmp-lean. A referee reads these files. The status of each statement comes from the Lean build, through its node on the map."
---
## The statement files

The statements live in `MinimalModel/Statements/` of [tamnd/mmp-lean](https://github.com/tamnd/mmp-lean). There is one file for each family A to H. Each file imports only Mathlib and `MinimalModel/Statements/Basic.lean`, which has the vocabulary: varieties, divisors, pairs, intersection data, klt and lc pairs, flips and programs. Each definition and each statement has a docstring with the informal statement and a reference. A proof is a separate `theorem` in another file. The files are pinned by hash in `manifests/statements.sha256`.

A published theorem that is not in Lean yet enters as a named `def ... : Prop` in `MinimalModel/Statements/Hypotheses.lean`. It is a hypothesis of the theorems that use it. It is never an `axiom`.

| File | Family | Statements |
|---|---|---|
| `MinimalModel/Statements/Foundations.lean` | A: foundations | S01 to S09 |
| `MinimalModel/Statements/LowDim.lean` | B: surfaces and 3-folds | S10 to S18 |
| `MinimalModel/Statements/Termination.lean` | C: termination and flips | S19 to S29 |
| `MinimalModel/Statements/Models.lean` | D: BCHM, models and the Sarkisov program | S30 to S39 |
| `MinimalModel/Statements/Abundance.lean` | E: abundance and non-vanishing | S40 to S47 |
| `MinimalModel/Statements/Boundedness.lean` | F: invariants and boundedness | S48 to S55 |
| `MinimalModel/Statements/Effective.lean` | G: effective results | S56 to S57 |
| `MinimalModel/Statements/OtherSettings.lean` | H: other settings | S58 to S60 |

The project is at milestone S0. The exit criteria of S0 say that `Basic.lean` builds at the pinned toolchain with no `sorry`, that the statements planned for S0 are `stated`, and that the fidelity checks F1 to F3 pass for S04, S10, S11, S12, S20, S22 and S33. The [map](/map/) shows the status of each node. This page does not give a status by hand.

## The classes

- A **theorem** has a published proof that experts accept.
- An **open** statement is a conjecture.
- A **claimed** statement is a fresh claim of 2025 or 2026 (spec 01.3). It is never a hypothesis of another node.
- A **reduction** is an implication between other statements, for example "ACC and LSC for mld imply termination".
- A **refuted** statement is the negation of a conjecture that the literature disproves. It keeps the class claimed until a referee accepts the paper. S57 is the one example.

On the map, an open statement is a node of kind `conjecture`, and a claimed or refuted statement is a node of kind `claim`. A reduction is a node of kind `theorem` that uses the statements it connects.

## The vocabulary

- **ready**: Mathlib and the vocabulary of `Basic.lean` are enough.
- **partial**: the statement needs a named hypothesis, for example coherent cohomology or blow-ups.
- **missing**: the statement needs a family of definitions that does not exist in Lean yet, for example Kähler classes or foliations.

A statement with missing vocabulary has a node with status `unstated` until its family exists. The 54 statements with vocabulary ready or partial are the part G1a of level G1. The 6 statements with vocabulary missing are the part G1b: S27, S36, S38, S47, S59 and S60.

## The decisions in the statements

- Termination means that **every** program terminates. "Some program terminates" is a weaker statement with its own name, `ExistsTerminatingMMP`. BCHM prove the weaker form, with scaling, and say so.
- The definitions use $\mathbb{R}$-coefficients. Each statement names its coefficient set in its hypotheses. S22 is for rational boundary only.
- $\mathbb{Q}$-factoriality is a hypothesis where the source has it.
- The statements are relative, over a base with a projective morphism. The absolute case is the base $\operatorname{Spec} k$.
- The field is algebraically closed of characteristic 0 for the families A to G. S58 is in characteristic $p$.
- A published theorem that Lean does not have is a named `Prop`, never an `axiom`.

## The list

The column "Planned" gives the milestone at which the statement is planned to be `stated`. The links go to the node of each statement.

### Family A: foundations

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S01 | [`KleimanCriterion`](node:MMV4DPSCE3) | for projective $X$, $D$ is ample if and only if it is positive on $\overline{NE}(X)\setminus0$ | theorem | partial | S1 |
| S02 | [`KawamataViehweg`](node:MM7MQT1KEA) | Theorem 3.5 of spec 03, klt form, relative | theorem | partial (coherent cohomology) | S1 |
| S03 | [`KollarTorsionFree`](node:MMP0Y69ZRN) | Kollár's injectivity and torsion freeness | theorem | partial | S3 |
| S04 | [`ConeTheoremKlt`](node:MMDZBZY2BV) | Theorem 3.6 of spec 03 for projective klt pairs | theorem | ready | S0 |
| S05 | [`ConeTheoremLc`](node:MMV52CGQMS) | Theorem 3.6 of spec 03 for lc pairs (Fujino) | theorem | ready | S1 |
| S06 | [`ContractionTheorem`](node:MMQ2K4RSHT) | Theorem 3.7 of spec 03, contraction of a $(K+\Delta)$-negative extremal face | theorem | partial | S1 |
| S07 | [`RationalityTheorem`](node:MMSMTZS83C) | the nef threshold is rational with bounded denominator | theorem | ready | S1 |
| S08 | [`BasepointFree`](node:MM0VJ1HARY) | nef $D$ with $aD-(K+\Delta)$ nef and big is semiample | theorem | ready | S1 |
| S09 | [`LengthOfExtremalRays`](node:MMHTX4Z2B7) | each negative ray is spanned by a rational curve with $-(K+\Delta)\cdot C\le2\dim X$ | theorem | partial (rational curves) | S2 |

### Family B: surfaces and 3-folds

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S10 | [`Castelnuovo`](node:MMRP5RX4JJ) | a $(-1)$-curve on a smooth projective surface contracts to a smooth point | theorem | partial (blow-ups) | S0 |
| S11 | [`SurfaceConeTheorem`](node:MM8MGCYF75) | the cone theorem for smooth projective surfaces | theorem | ready | S0 |
| S12 | [`SurfaceMMP`](node:MM861R2D6G) | every smooth projective surface has a minimal model or is a $\mathbb{P}^1$-bundle or $\mathbb{P}^2$ | theorem | ready | S0 |
| S13 | [`LcSurfaceMMP`](node:MMXV8DZWP4) | the MMP for lc surface pairs (Fujino) | theorem | ready | S1 |
| S14 | [`SurfaceAbundance`](node:MMMSGVFVJH) | abundance for lc surface pairs | theorem | partial | S2 |
| S15 | [`ThreefoldFlips`](node:MM3A98X8YR) | flips exist for 3-fold klt pairs (Mori, Shokurov) | theorem | ready | S1 |
| S16 | [`ThreefoldTermination`](node:MMH0CM56AA) | T(3) for lc pairs | theorem | ready | S1 |
| S17 | [`ThreefoldAbundance`](node:MM5ECX1RGZ) | abundance for lc 3-folds (Miyaoka, Kawamata, KMM) | theorem | partial | S2 |
| S18 | [`ThreefoldLcMMP`](node:MMMAM98WJQ) | the lc 3-fold MMP runs and ends | theorem | ready | S1 |

### Family C: termination and flips

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S19 | [`SpecialTermination`](node:MMFCAWE0XH) | T(n-1) gives special termination in dim $n$ | reduction | ready | S1 |
| S20 | [`Termination n`](node:MMTJ3YNHTG) | T(n): every sequence of flips for an lc $n$-fold pair is finite | open | ready | S0 |
| S21 | [`TerminationPseffLc4`](node:MME79K17YJ) | T(4) for lc pairs with $K+\Delta$ pseudo-effective (Moraga) | theorem | ready | S1 |
| S22 | [`TerminationLc4Rational`](node:MMBTDMD2XP) | every MMP for a projective lc 4-fold with rational boundary terminates (OpenAI 056, AxiomMath/MMP) | claimed | ready | S0 |
| S23 | [`TerminationScalingBig`](node:MM07D8FAVG) | BCHM 1.4.2 | theorem | ready | S1 |
| S24 | [`TerminationBigLe5`](node:MMY38TT73M) | every MMP terminates for klt pairs with big boundary or big $K+\Delta$, $n\le5$ (HLZ) | claimed | ready | S1 |
| S25 | [`TerminationBig n`](node:MM2NY6352R) | the same in all dimensions (Hashizume) | claimed | ready | S1 |
| S26 | [`LcFlips`](node:MMDQRR7TZB) | lc flips exist (Birkar, Hacon-Xu) | theorem | ready | S1 |
| S27 | [`GeneralizedLcFlips`](node:MMQMD68H79) | flips exist for all lc generalized pairs (Hu-Liu) | claimed | missing (generalized pairs) | S3 |
| S28 | [`ShokurovReduction`](node:MMFPRYMSNJ) | ACC and LSC for mld in dim $n$ give T(n) | reduction | ready | S0 |
| S29 | [`HanLiuReduction`](node:MM0NXABJ9S) | ACC for enc mlds and T(terminal flips) give T(n) | reduction | ready | S2 |

### Family D: BCHM, models and the Sarkisov program

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S30 | [`KltFlips`](node:MMP51FQ005) | klt flips exist in all dimensions (BCHM 1.4.1) | theorem | ready | S0 |
| S31 | [`BCHM`](node:MM9399B0QP) | Theorem 3.10, with the induction $A_n$ to $F_n$ as six sub-statements | theorem | partial (extension theorems) | S2 |
| S32 | [`FiniteGenerationCanonical`](node:MM193HWD2S) | the canonical ring of a smooth projective variety is finitely generated | theorem | ready | S0 |
| S33 | [`MinimalModelConj`](node:MMY4HT1Q8M) | every projective lc pair with $K+\Delta$ pseudo-effective has a minimal model | open | ready | S0 |
| S34 | [`FinitenessOfModels`](node:MM8GY5VB02) | $E_n$: finitely many log terminal models over a rational polytope | theorem | ready | S2 |
| S35 | [`MoriFibreSpaceOutput`](node:MMNAN1JQAR) | not pseudo-effective and big boundary gives a Mori fibre space (BCHM 1.3.2) | theorem | ready | S1 |
| S36 | [`Sarkisov`](node:MM3YGGD1TZ) | two Mori fibre space outputs are joined by Sarkisov links (Hacon-McKernan) | theorem | missing (links) | S3 |
| S37 | [`FanoTypeMDS`](node:MMZ1VFD6K4) | $\mathbb{Q}$-factorial Fano type varieties are Mori dream spaces (BCHM 1.3.1) | theorem | partial (Cox rings) | S3 |
| S38 | [`StrongSarkisov n`](node:MMQHRKKEZY) | the strong Sarkisov program; theorem for $n\le4$ (He), claimed for all $n$ | open | missing | S4 |
| S39 | [`ToricMMP`](node:MMAWP4SA44) | every toric MMP of a simplicial projective fan ends at a minimal model or a Mori fibre space, with toric mld formulas | theorem | ready (fans, R3) | S2 |

### Family E: abundance and non-vanishing

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S40 | [`Abundance n`](node:MMPTP8SV13) | 3.12 in dim $n$ | open | ready | S0 |
| S41 | [`NonVanishing n`](node:MMZ5XGBW5M) | 3.13 in dim $n$ | open | ready | S0 |
| S42 | [`AbundanceBig`](node:MMRKRVGY9M) | abundance when $K+\Delta$ is big (klt) | theorem | ready | S1 |
| S43 | [`AbundanceNuZero`](node:MM5QPM66FR) | abundance when $\nu(K+\Delta)=0$ | theorem | ready | S2 |
| S44 | [`LiuXuReduction`](node:MMM6KF309B) | non-vanishing in dim $d$ gives abundance for $\nu\le1$ in dim $d$ | reduction | ready | S1 |
| S45 | [`GeneralizedAbundance`](node:MMSH2N59E3) | Lazić-Peternell | open | ready | S2 |
| S46 | [`IitakaConj`](node:MMY51YYYJX) | $C_{n,m}$ | open | ready | S2 |
| S47 | [`BSemiampleness`](node:MMRXDSNJQ7) | the moduli part of an lc trivial fibration is b-semiample (BFMT) | claimed | missing (b-divisors) | S4 |

### Family F: invariants and boundedness

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S48 | [`ACCLct`](node:MMGSDKRGR6) | Theorem 3.15 of spec 03 (HMX) | theorem | ready | S1 |
| S49 | [`ACCMld n`](node:MMWK2DDDPC) | 3.16 | open | ready | S0 |
| S50 | [`LSCMld n`](node:MMFKZ7VB29) | 3.17 | open | ready | S0 |
| S51 | [`MldBound`](node:MM0FZHT2BB) | Conjecture 3.18 of spec 03 (Shokurov) | open | ready | S1 |
| S52 | [`HanLiuEncACC`](node:MMXCD16PTN) | Han-Liu Conj. 1.9(2') in dim 4, and its toric case (Target T, 04.12) | open | ready | S1 |
| S53 | [`BAB`](node:MMB93N0PQZ) | Theorem 3.19 of spec 03 | theorem | partial (bounded families) | S3 |
| S54 | [`IndexConj`](node:MM3A7BTV1N) | the index conjecture for klt log CY pairs | open | ready | S2 |
| S55 | [`ConeConj`](node:MM1B2V5Q7P) | the Kawamata-Morrison cone conjecture for klt CY pairs | open | partial (automorphism groups) | S3 |

### Family G: effective results

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S56 | [`FujitaFreeness`](node:MMXQBHJKWR) | $K_X+mL$ is free for ample $L$ and $m\ge\dim X+1$ | open | ready | S1 |
| S57 | [`NotEffectiveNonVanishing4`](node:MMRG60YPYS) | the negation of the Ambro-Kawamata conjecture in dim 4, with Ajit's example as the witness | refuted | partial (abelian varieties) | S1 |

### Family H: other settings

| Id | Statement | Informal meaning | Class | Vocabulary | Planned |
|---|---|---|---|---|---|
| S58 | [`CharP3foldLcMMP`](node:MMD90YG1TD) | the lc 3-fold MMP over a perfect field of characteristic $p\ge5$ | theorem | partial (Frobenius) | S4 |
| S59 | [`KahlerThreefoldMMP`](node:MMK4VRWSWA) | the MMP for compact Kähler 3-folds | theorem | missing (Kähler) | S6 |
| S60 | [`AlgIntFoliationMMP`](node:MMRWTZFN7D) | the MMP for algebraically integrable foliations | theorem | missing (foliations) | S6 |
