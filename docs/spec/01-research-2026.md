# 01. The state of the field, November 2026

This document records what is known on 2026-11-26, with sources. It is a synthesis of the seven research reports A to G in `research/sources/` (index: `research/00-index.md`). The tags are:
- **[P]**: the primary source was read (arXiv abstract page or PDF, journal page, repository file);
- **[S]**: secondary, from citations, catalogues, search results or news;
- **[U]**: unverified, from memory;
- **[R]**: a claim that a repository or a paper makes about itself, not checked by the project.

A tag after a row or a sentence is the tag that the report gives. A judgment of difficulty or of value is the project's own and is [U]. Every [S] and [U] item becomes a task for the `reader` role (10.3) before a node of the map depends on it. Links to arXiv have the form `https://arxiv.org/abs/<id>`.

Conventions: the base field is algebraically closed of characteristic 0 unless a row says otherwise. "T(n)" is termination of flips in dimension $n$. "Abundance" is log abundance for lc pairs. Section 3 of document 03 defines the words.

## 1.1 What is proved and what is open

The MMP is a program, not one conjecture. Its aim is to find, in each birational class, a model that is either minimal ($K+\Delta$ nef) or a Mori fibre space, and then to understand that model. The table gives the state by area. Sections 1.2 to 1.11 have the details and the sources.

| Area | Proved (selected) | Claimed in 2025 and 2026, unrefereed | Open (selected) | Source |
|---|---|---|---|---|
| Surfaces | the MMP, classification, abundance, all characteristics | none | nothing central | A 2, B 1.2 [U, standard] |
| 3-folds | the MMP (Mori, Shokurov, Kawamata, Kollár), log flips, termination, abundance (Miyaoka, Kawamata, KMM) | none | effective bounds | A 3 [U] |
| Cone, contraction, vanishing | cone, rationality, basepoint-free and contraction theorems for klt and lc pairs (Kawamata, Kollár, Shokurov, Ambro, Fujino) | none | nothing central | A 2 [S] |
| Flips | klt flips in all dimensions (BCHM, Hacon-McKernan); lc flips (Birkar 1104.4981, Hacon-Xu 1105.1169); klt NQC generalized flips (Hacon-Liu 2105.13590) | flips for all lc generalized pairs (Hu-Liu 2603.03817) | nothing central for usual pairs | A 4 [P] |
| Minimal models | klt pairs of log general type (BCHM, JAMS 2010); finite generation of the canonical ring; Fano varieties are Mori dream spaces | existence for lc generalized pairs is equivalent to termination with scaling (2603.03817) | lc pairs with $K+\Delta$ pseudo-effective, $\dim\ge5$ | A 5, D 3 [P] |
| Termination | T(3); terminal, canonical and pseudo-effective lc 4-folds (KMM, Fujino, Moraga, Chen-Tsakanikas); MMP with scaling for big boundary (BCHM) | every MMP terminates for klt pairs with $\Delta$ or $K+\Delta$ big, all $n$ (Hashizume 2609.33679); dim $\le5$ proved (HLZ 2509.01501); all lc 4-folds with rational boundary (OpenAI family 056, formalized in AxiomMath/MMP) | T(4) in refereed work; T(n), $n\ge5$, without bigness | A 6, D 2 [P] |
| Abundance | $\dim\le3$; the big case; $\nu=0$; 4-folds with $\kappa>0$; smooth $\dim\le5$ with $\kappa\ge0$, $\nu\le1$ (Liu-Xu 2505.05250) | log abundance in all dimensions (OpenAI 034, "Contested"); non-vanishing implies abundance (J. Liu 2610.35913) | 4-folds with $\kappa=0$ or $\kappa=-\infty$; non-vanishing in $\dim\ge4$ | A 7, D 4, D 5 [P] |
| Sarkisov program | weak form, all $n$ (Hacon-McKernan 0905.0946); strong form, $\dim 4$ (He 2311.08750, JPAA 2026) | strong form, all $n$ (Hashizume Cor. 1.7) | strong form in refereed work, $\dim\ge5$ | A 8 [P] |
| Boundedness | BAB (Birkar 1609.05543, 1603.05765); complements; ACC for lct (HMX 1208.4150); boundedness of stable varieties | sharp Fano volume bound (Bie-Du-Yu 2610.10537); $\mathrm{vol}\ge1/420$ for 3-folds of general type (2611.12786) | CY 3-folds; the index conjecture in $\dim\ge4$ | C 2 [P] |
| mld | ACC for smooth and fixed 3-folds (Kawakita), bounded families (Chen-Lin 2609.20515), toric (Ambro); LSC for hyperquotients (Nakamura-Shibata) | full LSC (Landi 2611.30971, withdrawn 2026-11-24) | ACC and LSC for 3-folds; $\mathrm{mld}\le\dim$ | C 3, D 8 [P] |
| Moduli | KSBA moduli (Kollár, CUP 2023); K-moduli are proper and projective (LXZ 2102.09405); YTD for log Fano pairs | second proof of properness (BLXZ 2510.06197); uniform cscK YTD (Trusiani 2605.30063) | the cscK YTD in its classical form; KSBA in char $p$ | C 4 [P] |
| Characteristic $p$ | 3-fold lc MMP for $p\ge5$; lc abundance for 3-folds, $p>42$ (BWX 2610.10439) | 3-fold abundance with $\nu=1$, $p>3$ (OpenAI 035) | 3-folds in char 2 and 3; 4-folds | B 1 [P] |
| Mixed characteristic | arithmetic 3-folds, residue char 0 or $>5$ (BMPSTWW, IHES 2023) | residue char 5 (Xie-Xue 2201.08208) | residue char 2 and 3 | B 2 [P] |
| Kähler | Kähler 3-folds complete (MMP, abundance, slc); big gklt Kähler MMP in all dimensions (Hacon-Xie 2607.24986) | termination with scaling for klt Kähler pairs (Hacon-Wang 2611.29683) | Kähler 4-folds; non-vanishing | B 3 [P] |
| Foliations | surfaces; rank 1 and rank 2 on 3-folds; algebraically integrable foliations in all dimensions (Liu-Meng-Xie; CHLMSSX) | abundance for algebraically integrable structures, $\dim\le3$ (Liu-Xu 2510.04419) | general foliations in $\dim\ge4$; the foliated MMP fails in char $p$ | B 4 [P] |
| Effective results | Fujita freeness, $n\le5$; Kawamata's effective non-vanishing for $\nu(D)\le2$ | linear Fujita bound $K+2nL$ free (Han 2609.01574); full Fujita (OpenAI 038) | Fujita freeness and very ampleness in general; effective non-vanishing for $\nu(D)=3$ | C 5, D 10, D 11 [P] |
| Disproved | effective non-vanishing for $\nu(D)\ge4$ (Ajit 2610.09270, read by Totaro); finite generation for generalized pairs (Liu-Wang 2608.03258) | | | D 11, A 0 [P] |

## 1.2 The core MMP in characteristic 0

1. **BCHM is the centre.** Birkar-Cascini-Hacon-McKernan (math/0610203, JAMS 23 (2010)) prove the existence of minimal models for klt pairs of log general type, the existence of klt flips, the finite generation of the log canonical ring, and that a Fano variety is a Mori dream space [P]. The proof is an induction on dimension through six statements, called A to F in report A §5: $F_{n-1}\Rightarrow A_n$, $E_{n-1}\Rightarrow B_n$, $A_n+B_n\Rightarrow C_n$, $D_{n-1}+B_n+C_n\Rightarrow D_n$, $C_n+D_n\Rightarrow E_n$, $C_n+D_n+E_n\Rightarrow F_n$ [P]. Its foundations are the cone theorem, Kawamata-Viehweg vanishing, Shokurov's non-vanishing and the extension theorems of Hacon-McKernan.
2. **Shorter routes exist.** Cascini-Lazić (1009.3188) and Corti-Lazić (1005.0614) prove finite generation without the MMP [P]. Lazić (2310.01097) and Yasuda (2603.13703) give algorithms for MMP steps [P]. These are candidate routes for a formal proof, because they replace geometric induction by a more combinatorial argument [U].
3. **Lc pairs.** Birkar and Hacon-Xu gave lc flips in 2011 [P]. Fujino's "Foundations of the MMP" (MSJ Memoirs 35, 2017) collects the lc cone and vanishing theory [S].
4. **Generalized pairs.** Birkar-Zhang (1410.0938) introduced generalized pairs $(X,B+M)$ with a nef part $M$ on a high model [P]. They are now the standard language for boundedness and for the canonical bundle formula. Flips exist for klt NQC generalized pairs (Hacon-Liu 2105.13590), and are claimed for all lc generalized pairs (Hu-Liu 2603.03817) [P]. Finite generation fails for generalized pairs (Liu-Wang 2608.03258, "mostly AI-generated, human-verified") [P].
5. **Termination.**
   - Refereed: T(3); terminal 4-folds (KMM), canonical 4-folds (Fujino), 4-folds with $\kappa\ge2$ (Birkar), pseudo-effective lc 4-folds (Moraga 1802.10202, Math. Z. 310 (2025); Chen-Tsakanikas 2011.02236 for NQC generalized pairs) [P][S].
   - Preprints: effective termination for general type in dimension at most 5, with explicit step bounds in dimension 4 (Han-Liu-Zhuang 2509.01501), using the uniform index bound of Han-Qi-Zhuang (2506.20183) [P]; full termination for big boundary in all dimensions (Hashizume 2609.33679) [P].
   - Han-Liu (2209.13122, Geom. Topol. 29 (2025)) give a proof of T(3) with no difficulty function, by ACC for mlds of enc 3-folds [P].
6. **Abundance.** Known in dimension at most 3, in the big case, and for $\nu=0$. In dimension 4 it is known for $\kappa>0$ (Kawamata, Fukuda) [S]. Liu-Xu (2505.05250) show that non-vanishing in dimension $d$ implies abundance for $\nu\le1$ in dimension $d$, and prove the smooth case in dimension at most 5 with $\kappa\ge0$ and $\nu\le1$ [P]. J. Liu (2610.35913) claims that non-vanishing for smooth varieties in dimension $d$ implies abundance for lc pairs in dimension at most $d$ [P].
7. **Non-vanishing** is the central open problem (D §5). Every conditional abundance result uses it. The hardest case is a smooth, non-uniruled 4-fold with $K_X$ pseudo-effective [U].

## 1.3 Fresh claims of 2026, not yet checked

These results appeared in 2025 and 2026, most of them in the last three months. None is refereed. The project treats each one as a claim with a date and a status. It never uses one as a hypothesis (06.6, 14.3) until the `reader` role and one expert have checked it. Route R1 (04.2) is the formal check of some of them in Lean, and route R2 (04.3) is the audit of the one claim that already has a Lean proof.

| Id | Claim | Source | What it claims | Status on 2026-11-26 |
|---|---|---|---|---|
| C1 | OpenAI 056 and AxiomMath/MMP | openai/math (2026-09-24); github.com/AxiomMath/MMP (2026-11-16) [P] | every MMP for a projective lc 4-fold with rational boundary terminates; Axiom formalized it in about 2.05 million lines of Lean | AI-written paper and code; no human review of the code [R] |
| C2 | Hashizume | 2609.33679 (v2 2026-10-13) [P] | full termination for klt pairs with $\Delta$ or $K+\Delta$ big, all $n$; finiteness of marked Mori fibre spaces; the strong Sarkisov program | drafts by ChatGPT and Codex, revised by the author [R] |
| C3 | OpenAI 034 | openai/math [P, catalogue] | log abundance in characteristic 0 for rational boundary, all $n$; canonical non-vanishing; 4-fold non-vanishing; effective Iitaka fibration; the index conjecture for slc log CY | "Contested" on one tracker (log Iitaka subadditivity) [S]; no Lean [P] |
| C4 | J. Liu | 2610.35913 (2026-10-07) [P] | non-vanishing for smooth varieties in dim $d$ implies abundance for lc pairs in dim $\le d$ | unrefereed |
| C5 | Hu-Liu | 2603.03817 [P] | flips exist for all lc generalized pairs; existence of minimal models is equivalent to termination with scaling | unrefereed |
| C6 | OpenAI 036 | openai/math [P] | generalized abundance (Lazić-Peternell) | unrefereed, no Lean |
| C7 | OpenAI 033 | openai/math [P] | the Iitaka conjecture $C_{n,m}$ in characteristic 0 | unrefereed, no Lean |
| C8 | OpenAI 038; Han | openai/math; 2609.01574 [P] | Fujita freeness for $m\ge n+1$ (OpenAI); a linear bound with $C_0\approx1.77629$ (Han) | both unrefereed; an earlier claim (Chan 2411.07129) has a gap found by Helmke [P] |
| C9 | OpenAI 035; BWX | openai/math; 2610.10439 [P] | 3-fold abundance with $\nu=1$ for $p>3$ (OpenAI); lc 3-fold abundance for $p>42$ (BWX, "very preliminary") | for $5\le p\le42$ only the AI manuscript covers the case |
| C10 | Hacon-Wang | 2611.29683 (2026-11-22) [P] | termination of klt flips with scaling for compact Kähler klt pairs; good minimal models, using two OpenAI manuscripts | unrefereed; its Cor. 1.2 rests on C3 |
| C11 | Hacon-Xie | 2607.24986 (v2 2026-11-22) [P] | the MMP for big gklt Kähler pairs in all dimensions; Tosatti's transcendental basepoint-free conjecture | unrefereed |
| C12 | Bie-Du-Yu | 2611.12786, 2611.18357, 2610.10537 [P] | $\mathrm{vol}\ge1/420$ for smooth 3-folds of general type; moduli of canonical 3-folds of volume $1/420$ (one component of dimension 33, two rigid points "Vega" and "Altair"); a sharp polynomial volume bound for $\epsilon$-lc Fanos | unrefereed; the moduli paper has code |
| C13 | BFMT; Hu-K. Liu-Shen | 2508.19215 (v2 2025-12-18); 2611.12744 [P] | the b-semiampleness conjecture of Prokhorov-Shokurov | strong human papers; referee status not checked |
| C14 | Ajit | 2610.09270 (v2 2026-10-14) [P] | counterexamples to the Ambro-Kawamata effective non-vanishing conjecture in dimension $\ge4$ | explicit and checkable; read by Totaro [R] |
| C15 | J. Liu | 2608.19301 [P] | a K-polystable smooth polarized 5-fold with no cscK metric, "obtained using generative AI" | unrefereed |
| C16 | Landi | 2611.30971 [P] | full LSC for mlds and $\mathrm{mld}\le\dim$ | withdrawn 2026-11-24: "Lemma 3.2 is false" |
| C17 | Liu-Wang | 2608.03258 [P] | a projective klt generalized pair whose generalized lc ring is not finitely generated | unrefereed; "mostly AI-generated, human-verified" |

Context of the OpenAI release (D §19) [P]:
- 722 manuscripts in 372 families were released on 2026-10-06. An unnamed internal model wrote them.
- About 42% of the results have Lean formalizations; none of the MMP families listed above has one.
- The README says: "Some of the unformalized results could have issues."
- On 2026-10-07, 3 papers were retracted and 14 revised. Six of the revised papers are on Kähler MMPs and abundance.
- Mathematicians reacted with doubt in the press [S]. No public check specific to birational geometry was found [S].

## 1.4 Positive and mixed characteristic

From report B §1 and §2.

1. **Four tools fail or weaken** in characteristic $p$: resolution of singularities (open in dimension $\ge4$), Kawamata-Viehweg vanishing (false in general), the existence of flips by the char 0 method, and generic smoothness [P].
2. **3-folds.** The lc MMP is complete for $p\ge5$ over perfect fields: Hacon-Xu, Cascini-Tanaka-Xu, Birkar, Birkar-Waldron, Hashizume-Nakamura-Tanaka for $p>5$, and Hacon-Witaszek (1911.12895) for $p=5$ [P]. For $p=2,3$ only the relative dlt MMP over $\mathbb{Q}$-factorial 3-folds is known (Hacon-Witaszek 1909.12872, with a v2 that removed Theorem 1.6) [P]. Totaro (2407.02608) gives terminal 3-folds that are not Cohen-Macaulay [P].
3. **Abundance for 3-folds.** Known for $p>3$ when $\nu\ne1$ (Zheng Xu 2307.03938, to appear in Compositio) [P]. BWX (2610.10439) prove lc abundance for $p>42$ [P]. For $5\le p\le42$ only OpenAI 035 covers $\nu=1$.
4. **4-folds.** Hacon-Witaszek (2009.02631) give contractions to $\mathbb{Q}$-factorial 4-folds and the semistable 4-fold MMP for $p>5$, partly conditional on log resolutions [P]. Waldron (2608.14236) proves a cone theorem for lc $\mathbb{Q}$-factorial 4-fold pairs for $p>5$, assuming the log resolution conjecture [P]. **This is a direct dependency on the sibling project singularity (spec 2161).**
5. **Mixed characteristic.** BMPSTWW (2012.15801, Publ. IHES 138 (2023)) give the MMP for arithmetic 3-folds with residue characteristics 0 or $>5$ [P]. Xie-Xue (2201.08208) treat residue characteristic 5 (preprint) [P]. Takamatsu-Yoshikawa (2012.07324) treat semistable families in residue characteristic 2 and 3 [P].
6. **Foliations fail.** Bernasconi (2309.13978) shows that the cone theorem, the basepoint-free theorem and the existence of Mori fibre spaces fail for 1-foliated surface pairs with canonical singularities in characteristic $p$ [P].

## 1.5 The analytic and Kähler MMP

1. The MMP for projective morphisms of complex analytic spaces is mature: Fujino (2201.11315, preprint), Das-Hacon-Păun (analytic flips, Adv. Math. 2024), Lyu-Murayama (2209.08732, 126 pp., excellent schemes, formal schemes, analytic germs, rigid and Berkovich spaces in equal char 0), Enokizono-Hashizume (2404.05126) for lc pairs, Landi (2611.15899) for slc pairs [P].
2. Kähler 3-folds are complete: MMP (Höring-Peternell, Invent. 2016; Das-Hacon), abundance (Campana-Höring-Peternell, Ann. ENS 2016), log abundance (Das-Ou), slc abundance (S. Das 2604.28085) [P][S].
3. Kähler in all dimensions: Hacon-Xie (C11) and Hacon-Wang (C10) [P]. Z. Jiang (2604.03879) gives Kähler abundance through the algebraic reduction in some 4-fold cases [P].

## 1.6 Foliations

1. The MMP holds for foliations on surfaces (McQuillan, Brunella), for rank 1 and rank 2 foliations on 3-folds (Cascini-Spicer, Spicer-Svaldi, and others) [S].
2. Algebraically integrable foliations, and the adjoint structures $tK_{\mathcal{F}}+(1-t)K_X$, have an MMP in every dimension (Liu-Meng-Xie, Compositio 161 (2025); CHLMSSX 2408.14258, 2504.10737) [P].
3. Abundance for klt algebraically integrable adjoint foliated structures holds in dimension $\le3$ (Liu-Xu 2510.04419, to appear in Math. Ann.) [P].
4. General foliations in dimension $\ge4$ have only partial results: a rank 1 cone theorem, uniqueness of rank 1 MMP outputs (2608.09663), and minimal models for smooth corank 1 foliations of general type (Cascini-Spicer 2610.16727) [P][S].
5. The survey of Cascini-Spicer (2604.09027) lists open questions Q2.3, Q3.11, Q3.23 and Q6.5. They are small targets of route R8 (04.9) [P].

## 1.7 Boundedness, complements and invariants of singularities

From report C §2 and §3 and report D §8, §9 and §12.

1. **BAB is a theorem** (Birkar, Ann. of Math.) [P]. Birkar's Fields Medal of 2018 cites it [S]. Bie-Du-Yu (2610.10537) give a sharp polynomial volume bound $\mathrm{Vol}(-K_X)\le C_n\epsilon^{-(2^n-n-1)}$ [P].
2. **Complements** are bounded (Birkar 1603.05765) [P]. OpenAI 066 claims bounded klt complements for Fano contractions and the Birkar-Shokurov Cartier conjecture [P, catalogue].
3. **ACC for lct** is a theorem (Hacon-McKernan-Xu 1208.4150) [P]. **Volumes** satisfy DCC, not ACC [P].
4. **mld.** Shokurov's ACC conjecture and Ambro's LSC conjecture imply T(n) (Shokurov 2004) [U]. ACC is open for 3-folds. Known cases: smooth 3-folds and any fixed 3-fold (Kawakita 2312.13599, 2412.03006), local volume bounded below (Han-Liu-Qi 2408.15090), bounded generalized sub-pairs in all dimensions (Chen-Lin 2609.20515), toric germs (Ambro) [P]. Nakamura-Shibata gave counterexamples to the PIA conjecture and to LSC in families (Duke 175 (2026)) [P]. Han-Qi-Zhuang (2506.20183) show that in a general type MMP mlds take finitely many values [P].
5. **Calabi-Yau.** Boundedness of CY 3-folds is open. Elliptic CY 3-folds are bounded (Filipazzi-Hacon-Svaldi, JEMS 27 (2025)), and so are many elliptic CY 4-folds (Filipazzi-Xu 2607.27048) [P]. The index conjecture is open in dimension $\ge4$ [S].
6. **Cone conjecture** (Kawamata-Morrison). It is "wide open" for CY varieties of dimension $>2$ (Lutz 2410.05949) [S]. The generalized cone conjecture is complete in dimension 2 (Lazić-Stenger-Xie 2608.26079, 2608.27001, 2610.10115) [P].
7. **Optimal constants.** Many extremal values are finite searches: the 1/1680 and 1/420 bounds, the baskets of terminal 3-folds, the minimal volumes of stable surfaces, the Fano index bound 66 (Jiang-Liu) [P][S]. These are the targets of the computation lab (13).

## 1.8 Moduli

1. **KSBA.** Kollár's "Families of Varieties of General Type" (CUP 2023) is the reference [S]. The moduli of stable pairs is projective in characteristic 0 [S]. Characteristic $p$ KSBA was not checked in this session [U].
2. **K-moduli of Fano varieties** are proper and projective (Liu-Xu-Zhuang 2102.09405, Ann. of Math.) [P]. BLXZ (2510.06197) give a purely birational second proof of properness [P]. Xu's book "K-stability of Fano Varieties" (CUP, New Mathematical Monographs 50, April 2025) is the reference [S].
3. **YTD.** The YTD conjecture for log Fano pairs is a theorem [P]. For cscK, see C15 and Trusiani (2605.30063) [P].

## 1.9 Effective results

1. **Fujita.** Freeness is known for $n\le5$ [S]. Han's linear bound and OpenAI 038 are in 1.3 (C8). Very ampleness is open [S].
2. **Effective non-vanishing** (Ambro-Kawamata). False in dimension $\ge4$ (C14). Ajit's first example is $X=E^4/\langle\rho\rangle$, with $E$ the Fermat cubic and $\rho$ of order 3. $X$ is terminal with 81 singular points of type $\frac13(1,1,1,1)$, $3K_X\sim0$, and an ample Cartier $D$ with $D^4=72$ and $h^0(mD)=3(m^4-1)$, so $H^0(D)=0$ [P]. Kawamata proved the conjecture for $\nu(D)\le2$. Only $\nu(D)=3$ is open [P].
3. **Iitaka $C_{n,m}$.** Ammar (2510.06412) proves the case $\alpha(Y)\ge m-2$ [P]. OpenAI 033 claims the full conjecture (C7).
4. **b-semiampleness.** Proved or claimed (C13). The effective form is open in relative dimension $\ge3$ [P].

## 1.10 ICM 2026 and meetings

| Item | Relevance | Source |
|---|---|---|
| Z. Zhuang, local volumes of klt singularities and K-stability (ICM 2026) | Volumes 4 and 14 | F §2 [S] |
| K. Fujita, criteria for K-stability of Fano manifolds (ICM 2026) | Volume 14 | F §2 [S] |
| M. Wemyss, the classification of 3-fold flops (ICM 2026) | Volume 8 | F §2 [S] |
| J. V. Pereira, foliations with numerically trivial canonical bundle (ICM 2026) | Volume 15 | F §2 [S] |
| J. Alper and D. Halpern-Leistner, the intrinsic approach to moduli (ICM 2026) | Volumes 13 and 14 | F §2 [S] |
| S. Zimmermann, algebraic groups of birational maps (ICM 2026) | Volume 10 | F §2 [S] |
| AMS Summer Research Institute in Algebraic Geometry, Fort Collins, 2025 | the current surveys; Cascini-Spicer is for its proceedings | F §2 [P] |

## 1.11 Lean and Mathlib

From report E §1 and G §4.

1. **The pin.** Lean v4.35.0 with Mathlib tag v4.35.0 (`56a005855ea17e0b0958f73ec801ae140b0a1679`) [P]. Master was at `348837d3aa` (v4.37.0-rc1) on 2026-11-25 [P]. In algebraic geometry the main change since the pin is the split of `OrderOfVanishing.lean` (#43273) [P].
2. **Mathlib has** schemes, separated, proper, smooth, flat, finite and étale morphisms, the valuative criterion, `RationalMap` and birational maps, relative normalization, Zariski's main theorem, `AlgebraicCycle` with `IsWeilDivisor` and `weilDivisors`, `ord` along codimension one points, `Proj` with properness over $\mathrm{Spec}\,A_0$, sheaves of modules, sheaf cohomology `H n` on a site through `Ext`, Čech complexes, derived categories, `CommRing.Pic`, and convex cones: `PointedCone`, `IsFaceOf`, `DualFG`, `IsSimplicial` [P].
3. **Mathlib lacks** Cartier divisors, the Picard group of a scheme, line bundles on schemes, ample and nef, intersection numbers, normal schemes as a class, blow-ups, finiteness of coherent cohomology, the cohomology of $\mathcal{O}(d)$ on $\mathbb{P}^n$, Serre duality, vanishing theorems, Riemann-Roch, Kähler manifolds and toric varieties [P, by absence].
4. **Open PRs that matter**: principal Weil divisors #38472, the sheaf of a Weil divisor #38953, $R_k$ #43440, conditional Riemann-Roch for curves #41621 (draft), the Picard group #44200, affine vanishing #36345, flasque vanishing #35790, the cohomology API #43392, polytopes #42647, conic Carathéodory #44900, the dual cone rework #37951, faces of sets #45046 [P].
5. **Kernel and checkers.** The trust tools of the sibling projects apply: `lean4checker`, `lake comparator` with lean4lean and nanoda, `formalization.yaml` with the Palomar schema v0.4 [P, 2161l 14].

## 1.12 Other Lean projects

| Project | Licence, pin | Content for the MMP | Use in this project | Source |
|---|---|---|---|---|
| AxiomMath/MMP | Apache-2.0; v4.35.0, Mathlib `56a005855e`, Stacks `c496df0d9b` | the MMP for lc pairs in dim $\le4$; 2,269 files; main theorem `MMP.Fourfold.Program.IsMaximal.isNefOnCurves_or_isMoriFibreSpace`; `n_ne_top_of_isAlgClosed`; `projectiveLowerLogMMP_three`; `rationalBirationalProgramProperty_two`; KV vanishing; the cone of curves as a Mathlib `PointedCone`; the attribute `@[mmp "label"]` | audit, bridge, port (05.2, 04.3) | E §2.1 [P][R] |
| AxiomMath/Stacks | Apache-2.0; v4.35.0 | StacksFrontier: 44,630 files in AlgebraicGeometry alone; Divisors, Intersection, Picard, Blowup, ResolutionOfSurfaces, Duality, Quot | read through the bridge only; port single statements | E §2.2 [P] |
| TauCeti | Apache-2.0; v4.37.0-rc1 | `InvertibleSheaf`, `IsAmple`, `intersectionNumber` by Euler characteristics, `IsNef`, Cartier divisors, rational polyhedra (32 files) | copy statement shapes; port small files | E §2.3 [P] |
| YaelDillies/toric | Apache-2.0; v4.37.0-rc1 | `class ToricVariety`, split tori; no fans | coordinate; the toric scheme dictionary later | E §3 [P] |
| tamnd/singularity-lean | the project's own; v4.35.0 | `IsSncDivisor`, `IsEmbeddedResolution`, `blowupChart`, divisorial valuations | the log resolution vocabulary, shared `Prop` | E §3 [P] |
| resolutionorg/hironaka | v4.35.0 | resolution in characteristic 0 (in progress) | read; bridge for resolution | E §3 [P] |
| formal-conjectures | Apache-2.0 | no MMP content; `ProjectiveSpace`, `VectorBundleData` | add MMP statements upstream (09.5) | E §0 [P] |

The reading of report E: AxiomMath/MMP plays the role that anthropics FLT plays for spec 2161l. It is too large to reprove and too new to trust. The audit of its definitions is the main way to turn its kernel-checked proof into mathematics that people accept.

## 1.13 AI systems

1. **AI-written mathematics reached the MMP in 2026.** The OpenAI release (1.3), Axiom's Lean MMP, and human preprints with AI drafts (Hashizume, Liu-Wang, J. Liu, Hacon-Wang) all appeared between August and November [P].
2. **The pace exceeds the referees.** Three claims of this autumn have already failed or changed: Landi's LSC (withdrawn), Chan's Fujita (gap), and the OpenAI retractions of 2026-10-07 [P].
3. **A Lean proof changes the question.** For C1 the question is no longer "is the paper right" but "do the Lean definitions mean the textbook notions" (D §22). This is a question of a few hundred definitions, not of two million lines. People can answer it.
4. **Tools for the project.** The sibling projects use one Go binary with model roles and a ledger. The roles stay. Two change: the `auditor` role (10.3) reads external Lean definitions against a textbook, and the `refuter` role tries to prove the negation or a trivialization of a definition.

## 1.14 Books and teaching

From reports F and G.

1. The core textbook is Kollár-Mori, "Birational Geometry of Algebraic Varieties" (Cambridge Tracts 134, 1998), with Kollár's free exercise set (0809.2579) [S][P].
2. No textbook covers BCHM from first principles. Students learn it from Corti (ed.), "Flips for 3-folds and 4-folds" (OUP 2007), Corti-Kaloghiros-Lazić (Bull. LMS 2011), Birkar's notes (1210.2670), Hacon-Kovács (Oberwolfach Seminars 41) and Fujino (MSJ Memoirs 35) [S].
3. The newer areas have new books: Kollár 2023 for KSBA, Xu 2025 for K-stability. Foliations, characteristic $p$ and boundedness have only surveys [S][P].
4. For the prerequisites the best modern spine is Vakil, "The Rising Sea" (Princeton 2025), with Hartshorne as the cited reference, Görtz-Wedhorn II (2023) for cohomology, Lazarsfeld I and II for positivity, and Debarre (2001) as the bridge to Kollár-Mori [S].
5. Expert advice agrees on three points: concrete examples before or with schemes, no attempt to learn all foundations before birational geometry, and learning in a group (G §7.1) [P].
6. The sister handbooks give the format: volumes as folders, front matter, a "Node · Lean" line under each result, a builder (`lhb`, `shb`) with checks (F §6.1) [P].

## 1.15 What this means for the project

1. **The first year is an audit and a toric proof, not a race.** AxiomMath/MMP already claims most of the low dimensional MMP. The project adds what that code lacks: faithful statements read by people, an audit of definitions, a second kernel, a bridge, and the toric MMP on Mathlib alone.
2. **The fresh claims are the frontier.** Hashizume, OpenAI 034, J. Liu, Ajit and BWX are the open problems of the field in the form "claim with a candidate proof". Route R1 picks the parts that Lean can check now.
3. **The finite computations are cheap and new.** Ajit's arithmetic, the baskets of the 1/420 bound, toric mlds and Kreuzer-Skarke data are finite and certifiable (13).
4. **The sibling project is a dependency.** Characteristic $p$ 4-folds need log resolutions, which is the open problem of spec 2161. The two projects share one hypothesis.
5. **The handbook fills a real gap.** No book covers BCHM, termination and abundance in one notation with full proofs, examples and exercises, and none starts from first algebra.

## 1.16 Items to recheck

The `reader` role takes these first. The full lists are at the end of each report.

1. AxiomMath/MMP: a clean build, `#print axioms` of the four main theorems, and the meaning of `Program.IsMaximal` (E §9.1, D §22.1).
2. The match of the StacksFrontier definitions with the Stacks Project and with KM98 (E §9.3).
3. The status of the OpenAI MMP families after 2026-10-12 (D §23.10).
4. The referee status of Hashizume, HLZ, HQZ, BFMT, Han and Moraga's journal data (D §23.8, A §11).
5. The exact hypothesis of Birkar 0804.4587, and whether T(4) and Birkar's reduction give termination for effective lc 5-folds (D §23.2).
6. The dimension in which the Kollár-Xu dual complex conjecture is known (D §23.1).
7. Whether Ammar's $C_{n,m}$ needs a non-uniruled Iitaka variety (D §23.4).
8. Which AI papers Hacon-Wang use (D §23.16).
9. KSBA in characteristic $p$ (C §10).
10. The ICM 2026 proceedings references (F §9).
