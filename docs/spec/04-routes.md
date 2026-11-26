# 04. The open targets and the routes

The MMP has many open problems, and they share their formal infrastructure. Here a **route** is a cluster of open targets that use the same definitions, the same library tiers of document 07, and the same kind of proof. Work on a route builds that infrastructure, and the infrastructure makes the next target of the route cheaper. The sources are in documents 01 and 03 and in the research reports A to D. Claims marked [U] are the project's own guesses.

**The honest view.** Nobody can prove "all of the open MMP" on a schedule. Termination in dimension 5 and abundance in dimension 4 have resisted experts for decades. Most targets below are rated 4 or 5, which means that experts have no strategy or only a partial one. The project does not promise a date for any of them. The weights of 4.1 buy information: which infrastructure is cheap, which claims survive a formal check, and where a small new result is within reach. Level G5 of document 02 is one named open target of this document proved in Lean and accepted by experts. Level G6 is a central conjecture, and it is not a plan.

The year 2026 changes one thing. For some central targets a candidate proof already exists: an unrefereed paper, an AI manuscript, or a Lean proof that no human has read. For those targets the project's work is to check, not to discover. Routes R1 and R2 are this work.

**Each route section gives:**
- the idea;
- what is known;
- the open targets, named `O-Rk-n`, with a difficulty from 1 to 5 (report D §1.3: 1 is within reach of current methods or only needs a check, 5 has no plausible strategy);
- the first nodes that the project can state now (map nodes in `blueprint/nodes/`, 08.2, named here by slug; the map gives each an id `MM` plus 8 base-32 characters);
- the key obstruction, for the formalization and for the mathematics;
- the first weight.

For targets in R1 and R2 a second number gives the cost of the formal check, on the same 1 to 5 scale. That cost is a different question from the difficulty of the mathematics.

## 4.1 Summary

| Route | Cluster | Known up to (2026-11-26) | Key obstruction | First weight |
|---|---|---|---|---|
| R1 | formal checks of fresh claims | the claims of 01.3 exist as preprints and AI manuscripts; one has a Lean proof | the claims rest on foundations that are not in Lean; a check must find a self-contained part | 0.20 |
| R2 | audit and bridge of AxiomMath/MMP | a kernel-checked lc MMP in dim $\le4$, not read by people | 2 million lines; the question is the meaning of a few hundred definitions | 0.15 |
| R3 | the toric MMP and toric invariants | the toric MMP on paper (Reid 1983); toric mld ACC (Ambro) | fans are absent from Lean; the scheme dictionary is large | 0.15 |
| R4 | termination through ACC and LSC | T(3); ACC for mld of smooth and fixed 3-folds; Shokurov's reduction on paper | ACC for mlds is open for 3-folds | 0.10 |
| R5 | abundance and non-vanishing | $\dim\le3$; big; $\nu=0$; 4-folds with $\kappa>0$; conditional results | non-vanishing has no strategy in dim 4 | 0.10 |
| R6 | boundedness, CY, the cone conjecture, effective results | BAB; ACC for lct; Fujita for $n\le5$; Ajit's counterexamples | CY 3-folds; very ampleness | 0.10 |
| R7 | characteristic $p$ and mixed characteristic | 3-fold MMP for $p\ge5$; lc 3-fold abundance for $p>42$; arithmetic 3-folds | resolution in dim $\ge4$; small primes | 0.05 |
| R8 | foliations | surfaces; 3-folds; algebraically integrable in all dims | general foliations in dim $\ge4$ | 0.05 |
| R9 | Kähler and analytic | Kähler 3-folds; big gklt Kähler in all dims (claimed) | currents and Kähler classes are absent from Lean | 0.05 |
| Lab | computation lab (4.11, document 13) | basket tables, toric data, Kreuzer-Skarke, Magma and Macaulay2 | data is not proof | 0.05 |

The weights set the share of the research budget of the agent (10.6) for the first year. Library work for levels G1 to G3 is outside this budget. The weights change at each milestone report (document 15), from proved, refuted and stalled nodes. The weights are higher where a route has a cheap first node that also serves G2 or G3 (R2, R3), or where the information value is high and the check is cheap (R1).

## 4.2 R1: formal checks of fresh claims

**Idea.** In 2026 strong results appear faster than referees read them, and some come from AI systems with no human author (01.3). A formal check of a self-contained part is new evidence that no referee can give. The route does not try to formalize a whole paper. For each claim it does four things:
1. it writes a claim record (07.13) with the date and the status;
2. it states the main theorem in Lean as a `def ... : Prop` with status `claimed`;
3. it maps the dependencies, and marks the ones that are themselves unrefereed;
4. it picks the smallest part that is new, self-contained and checkable: a finite computation, a combinatorial lemma, a numerical inequality, or an implication between named hypotheses.

**What is known.** The claims of 01.3 [P]. The table gives the targets of this route.

| Id | Claim | The part to check | Math | Formal check |
|---|---|---|---|---|
| O-R1-1 | Ajit 2610.09270: effective non-vanishing fails in dim $\ge4$ | the full first example: the action on $E^4$ for the Fermat cubic $E$, the 81 fixed points of type $\frac13(1,1,1,1)$, $3K_X\sim0$, $D^4=72$, $h^0(mD)=3(m^4-1)$, so $H^0(D)=0$ | 1 (a check) | 2: finite arithmetic over $\mathbb{F}_3^4$ and $\mathbb{Z}[\omega]$, plus Riemann-Roch on an abelian 4-fold as a named hypothesis |
| O-R1-2 | Bie-Du-Yu 2611.12786: $\mathrm{vol}\ge1/420$ for smooth 3-folds of general type | the basket search and the inequalities, as a certificate (E1 of 13) | 1 | 2: a decidable search checked by a Lean checker of the certificate |
| O-R1-3 | Han 2609.01574: $K+2nL$ is free | the real analysis and the multiplicity inequality behind $C_0\approx1.77629$ (target #7 of D §20) | 2 | 2 |
| O-R1-4 | J. Liu 2610.35913: non-vanishing for smooth varieties implies abundance | the reduction as an implication between named `Prop`s, with each cited input a hypothesis; then the steps that use only the MMP with scaling | 3 | 4 |
| O-R1-5 | Hashizume 2609.33679: every MMP terminates for big boundary | the combinatorial core: the finiteness of the set of models met by an MMP, given the HQZ index bound and BCHM finiteness of models as hypotheses | 4 if open | 4 |
| O-R1-6 | OpenAI 034: log abundance in all dimensions | the dependency map, with the log Iitaka subadditivity step isolated; the disputed step as a named `Prop` and a search for a counterexample to it in toric and abelian cases | 5 if open | 5 for the proof; 2 for the map |
| O-R1-7 | Liu-Wang 2608.03258: finite generation fails for generalized pairs | the explicit example and the computation of the generalized lc ring | 2 | 3 |
| O-R1-8 | Hu-Liu 2603.03817: lc generalized flips exist | the statement and the equivalence "minimal models iff termination with scaling" as a reduction node | 3 | 4 |
| O-R1-9 | OpenAI 035 and BWX 2610.10439: 3-fold abundance in char $p$ | a human audit of OpenAI 035 against Z. Xu 2307.03938 (target #21) | 1 to 2 | not formal in year 1 |
| O-R1-10 | HLZ 2509.01501: explicit step bounds for general type 4-folds | the bound as a computable function and a certificate on examples; target #22 (dim 5 bounds) is a research extension | 2 | 2 |
| O-R1-11 | Hacon-Wang 2611.29683 | a citation audit: which statements of which AI manuscripts it uses, and whether each is a claim or a theorem | 1 | 1 |
| O-R1-12 | Landi 2611.30971 (withdrawn) | the false Lemma 3.2 as a Lean refutation, if the counterexample is finite | 1 | 2 |

**First nodes.**
- `claim-ajit-env`: the effective non-vanishing conjecture as a `Prop`, and its negation in dim 4 as a statement with status `claimed`.
- `ajit-fermat-quotient`: the finite data of the first example: the group, the fixed points, the local types.
- `ajit-h0-formula`: $h^0(mD)=3(m^4-1)$ from the invariant part of $H^0$ on $E^4$.
- `claim-bdy-420`, `claim-hashizume-term`, `claim-openai-034`, `claim-jliu-nv-ab`: claim records with `claimed` statements.
- `red-jliu`: the J. Liu reduction as an implication between `Prop`s.

**Key obstruction.** For the formalization: most claims sit on foundations that Lean does not have, so the check reaches only an edge of the claim. For the mathematics: a check of a part is not a check of the claim. The record must say exactly which part was checked (14.3).

**First weight: 0.20.** It is the highest weight because the information per dollar is high. A refuted lemma is news, and a checked lemma is a strong signal to the experts. Most of the cost is the reader and stater roles (10.3), not the prover. O-R1-1 is the first target because it is a disproof that is finite, new and certain.

## 4.3 R2: the audit and bridge of AxiomMath/MMP

**Idea.** AxiomMath/MMP is a Lean proof of the lc MMP in dimension at most 4 (01.12). The Lean kernel already checked the inferences. What no one has checked is whether the statements mean what the textbooks mean. If they do, then termination of every MMP for projective lc 4-folds with rational boundary is a theorem, and an open problem of forty years is closed. The proof is Axiom's and OpenAI's; the audit is the project's. The route is an audit in eight steps, then a bridge.

**What is known.** From E §2.1 and D §22.1 [P][R]:
- commit `1f9ade3670`, created 2026-11-16, Apache-2.0, Lean v4.35.0, Mathlib `56a005855e`, AxiomMath/Stacks at `c496df0d9b`;
- 2,269 files, about 2.05 million lines, universe `Scheme.{0}`, attribute `@[mmp "label"]` for the blueprint;
- main theorems `MMP.Fourfold.Program.IsMaximal.isNefOnCurves_or_isMoriFibreSpace`, `MMP.Fourfold.Program.isContinuableRay`, `MMP.Fourfold.Program.n_ne_top_of_isAlgClosed`, `MMP.Fourfold.projectiveLowerLogMMP_three`;
- hypotheses: $k$ algebraically closed of characteristic 0, $X$ projective, integral and normal, rational boundary; no $\mathbb{Q}$-factoriality, no pseudo-effectivity;
- other results: Kawamata-Viehweg vanishing (`subsingleton_derivedCohomologyOverField_divisorialSheaf_neg`), the surface program (`rationalBirationalProgramProperty_two`), the relative cone theorem for klt pairs (`IsKltPair.exists_relativeClosedConeOfCurves_eq_add_hull`);
- the cone of curves is a Mathlib `PointedCone`; `QDivisor := PrimeDivisor X →₀ ℚ`;
- the README says no human has reviewed the code, and abundance is out of scope.

**The audit steps.** Each step has an exit record in `audit/axiom-mmp/` of `tamnd/mmp` (08.1).

| Step | Work | Exit |
|---|---|---|
| A1 | a clean build at `1f9ade3670` on a large machine; record time, memory, `lake-manifest.json` and the hash of every `.olean` | build log and hashes |
| A2 | `#print axioms` on the four main theorems and the three other results; the expected set is `propext`, `Classical.choice`, `Quot.sound` | axiom report |
| A3 | replay in `lean4checker`; then the comparator with lean4lean and nanoda as a second and third kernel (14.1, Q3) | replay logs |
| A4 | the definition index: every `def`, `structure`, `class` and `instance` in the transitive closure of the statements (not the proofs) of the main theorems, with file and line; an estimate is 300 to 600 items [U] | `definitions.yaml` |
| A5 | the reading: each item of A4 against KM98, BCHM and the Stacks Project, by two people (F6). The first items are variety, normal, prime divisor, $\mathbb{Q}$-divisor, $K_X$, discrepancy, lc, nef on curves, the cone of curves, extremal ray, contraction, flip, divisorial contraction, Mori fibre space, `Program`, `IsMaximal` | one record per definition: faithful, faithful with a note, or unfaithful |
| A6 | the meaning of the main statements: that `n_ne_top` says every program terminates, not that one does; that `IsMaximal` cannot hold for a program that stops early; that no hypothesis is vacuous. The triviality attack (F4): try to prove each main statement from `False`-like assumptions or empty types. The positive instance (F2): build a program for $\mathrm{Bl}_p\mathbb{P}^2\times\mathbb{P}^2$ or a toric 4-fold, if the API allows | a statement report |
| A7 | the Stacks layer: the list of AxiomMath/Stacks results used by the main theorems whose statements differ from the Stacks Project text, and a reading of each | a Stacks report |
| A8 | the bridge: the project's statements S20 to S24 (06.2) proved from the AxiomMath/MMP theorems in `MinimalModelBridge` (09.4); a letter to Axiom, 30 days, then a public report (14.4) | bridge build and the report |

**Open targets.**

| Id | Target | Math | Formal check |
|---|---|---|---|
| O-R2-1 | T(4) for projective lc 4-folds with rational boundary, through A1 to A8 | 1 if the audit passes; the open problem otherwise | 3: the reading is the cost |
| O-R2-2 | the surface and 3-fold programs of AxiomMath/MMP bridged to S10 to S19 | 1 | 2 |
| O-R2-3 | the port of the AxiomMath KV vanishing statement to the project's vocabulary, as a theorem in the bridge and a hypothesis in the main library | 1 | 2 |
| O-R2-4 | real boundary: does the AxiomMath proof extend from $\mathbb{Q}$ to $\mathbb{R}$ coefficients? | 2 to 3 [U] | 4 |
| O-R2-5 | T(4) for klt Kähler 4-folds (OpenAI 056 Kähler part) | 4 | 5 |

**First nodes.** `axiom-t4-statement` (the AxiomMath statement, copied as text with its source), `t4-lc-rational` (the project's statement S22), `bridge-t4` (the bridge theorem).

**Key obstruction.** For the formalization: the size. The audit reads statements, not proofs, but the statement closure still reaches deep into AxiomMath/Stacks. For the mathematics: a definition can be "almost" right, for example a cone of curves built from integral curves over the wrong field, or a program that allows non-$\mathbb{Q}$-factorial steps that KM98 excludes. An almost right definition needs an expert judgment, not a Lean check.

**First weight: 0.15.** It is the route with the best chance of a G4 result in the first year.

## 4.4 R3: the toric MMP

**Idea.** The toric MMP (03.13) is the whole program in a world where every step is convex geometry over $\mathbb{Q}$. It is the first full proof of the project on Mathlib alone, it is not a copy of AI-written code, and it gives the test instances for every abstract statement. It also reaches an open problem: ACC for mlds in toric and hyperquotient germs of dimension 4 in the form Han-Liu need.

**What is known.** The toric cone theorem, contractions and flips (Reid 1983), the toric MMP (Matsuki 2002, Fujino-Sato 2004), toric mld ACC (Ambro) [U][S]. In Lean: Mathlib `PointedCone`, faces (`IsFaceOf`), duals (`DualFG`), simplicial cones; no fans anywhere (01.12).

**The steps.**
1. `MinimalModel/Toric/Fan.lean`: fans as finite sets of rational polyhedral `PointedCone`s closed under faces and meeting in faces; simplicial and complete fans; the support.
2. Torus-invariant divisors, the $\mathbb{Q}$-Cartier condition, $K=-\sum D_\rho$; wall relations and intersection numbers.
3. The toric cone theorem: $NE$ is generated by wall classes.
4. Contractions of extremal rays as operations on fans, with their type.
5. Flips as the other subdivision.
6. Termination of toric flips (with the recheck of its scope, Q-12).
7. Toric log discrepancies and mlds; the toric MMP as a theorem: every toric MMP ends at a minimal model or a Mori fibre space.
8. Toric ACC for mlds (Ambro) and toric LSC.
9. The scheme dictionary: $X_\Sigma$ as a Mathlib `Scheme`, and the comparison of the combinatorial notions with the general ones of 06.1 (S6 work, 15).

**Open targets.**

| Id | Target | Math | Source |
|---|---|---|---|
| O-R3-1 | the toric MMP in Lean (steps 1 to 7) | 1 (known) | Reid, Fujino-Sato |
| O-R3-2 | toric ACC and LSC for mlds in Lean (step 8) | 1 (known) | Ambro |
| O-R3-3 | Han-Liu Conj. 1.9(2') for enc 4-fold pairs that are toric | 2 [U] (open) | D §20 #15; Han-Liu 2209.13122 |
| O-R3-4 | the same for hyperquotient germs | 3 [U] (open) | Nakamura-Shibata 2606.24592 |
| O-R3-5 | toric dual complexes are spheres or balls (a Lean proof of a known case of Kollár-Xu) | 2 | D §16 |
| O-R3-6 | Mori dream spaces: the toric case as the first instance of S37 | 1 | Hu-Keel |

**First nodes.** `toric-fan`, `toric-wall-relation`, `toric-cone-theorem`, `toric-flip`, `toric-termination`, `toric-mld`.

**Key obstruction.** For the formalization: Mathlib's cone API is new and changes (the dual cone rework, PR #37951); the scheme dictionary is the expensive part. For the mathematics: none for O-R3-1 and O-R3-2. For O-R3-3 the enc condition and the 4-dimensional cones need a classification that may be large.

**First weight: 0.15.**

## 4.5 R4: termination through ACC and LSC

**Idea.** Shokurov's reduction (03.7) turns termination into two statements about one invariant. Han-Liu give a sharper reduction through enc mlds (03.11). Both reductions are abstract. The route proves the reductions in Lean, then works on the inputs in the cases where they are within reach.

**What is known.** ACC for mlds of smooth 3-folds and of any fixed 3-fold (Kawakita), of bounded families in all dimensions (Chen-Lin 2609.20515), with local volume bounded below (Han-Liu-Qi), and toric (Ambro) [P][S]. LSC for hyperquotients (Nakamura-Shibata) [P]. HQZ: mlds in a general type MMP take finitely many values [P].

**Open targets.**

| Id | Target | Math | Source |
|---|---|---|---|
| O-R4-1 | the abstract Shokurov lemma in Lean: over an axiomatic flip sequence with an invariant in an ACC set that is LSC and strictly improves, the sequence is finite | 1 | D §20 #27 |
| O-R4-2 | the Han-Liu reduction in Lean, over named hypotheses | 2 | Han-Liu |
| O-R4-3 | ACC for mlds on 3-folds | 3 | D §8.1 |
| O-R4-4 | ACC for mlds on 4-folds | 4 | D §8.1 |
| O-R4-5 | LSC for mlds in dim $\ge4$ | 4 | D §8.2 |
| O-R4-6 | $\mathrm{mld}\le\dim$ (Shokurov) | 4 | D §8.3 |
| O-R4-7 | ACC on a fixed 4-fold with DCC boundary, after checking what Chen-Lin cover | 2 | D §20 #16 |
| O-R4-8 | Han-Liu Conj. 7.5 for $N=1$ in dim 4 | 2 | D §20 #14 |
| O-R4-9 | special termination in dim 5 with $\lfloor B\rfloor$ irreducible (Liu-Xu Conj. 1.7) | 2 | D §20 #12 |
| O-R4-10 | T(5) for effective lc pairs, from T(4) and Birkar's reduction (after the recheck of D §23.2) | 3 if the reduction applies [U] | D §2 |

**First nodes.** `shokurov-abstract`, `red-shokurov`, `red-han-liu`, `acc-mld-statement`, `lsc-mld-statement`.

**Key obstruction.** For the formalization: mlds need all divisorial valuations, so the general statement needs valuations of function fields (Mathlib has `Valuation` but not the divisorial ones of a variety). For the mathematics: ACC for 3-fold mlds is open after thirty years.

**First weight: 0.10.** O-R4-1 is cheap and is reused by R1 (O-R1-5) and R3.

## 4.6 R5: abundance and non-vanishing

**Idea.** Every conditional abundance result goes through non-vanishing (03.11). The route states the conditional results as reductions, proves the known cases that the handbook needs, and tests the disputed step of OpenAI 034.

**What is known.** 01.2 item 6 and 03.8.

**Open targets.**

| Id | Target | Math | Source |
|---|---|---|---|
| O-R5-1 | non-vanishing in dim 4 (smooth, non-uniruled, $K_X$ pseudo-effective) | 4 | D §5 |
| O-R5-2 | abundance for 4-folds with $\kappa=0$ | 4 | D §4.1 |
| O-R5-3 | log abundance in all dimensions | 5 (claimed by OpenAI 034) | D §4.1 |
| O-R5-4 | generalized abundance (Lazić-Peternell) | 4 | D §4.3 |
| O-R5-5 | generalized abundance in dim 3 with $\nu=0$ | 2 | D §20 #24 |
| O-R5-6 | Iitaka $C_{n,m}$; remove the non-uniruled hypothesis of Ammar, or reach $\alpha(Y)\ge m-3$ | 4; 2 | D §7, §20 #20 |
| O-R5-7 | effective b-semiampleness in relative dimension 3 with bounded $b_2$ | 3 | D §6.2, §20 #18 |
| O-R5-8 | Liu-Xu $\nu\le1$ results in the relative lc case | 1 | D §20 #13 |
| O-R5-9 | finite generation by Cascini-Lazić in Lean, as an alternative to S31 | 3 (known; formal size) | 03.6 |

**First nodes.** `nonvanishing-statement`, `abundance-statement`, `red-liu-xu`, `red-birkar-nv-mm`, `red-lazic-meng`.

**Key obstruction.** For the formalization: Iitaka and numerical dimensions need section rings and asymptotic growth; Mathlib has graded rings but not $h^0$ growth. For the mathematics: no one has a strategy for O-R5-1.

**First weight: 0.10.**

## 4.7 R6: boundedness, Calabi-Yau, the cone conjecture and effective results

**Idea.** Many targets of this cluster reduce to a finite search, a lattice computation or a numerical inequality. These are the targets where a computer and a small new idea can give a new result.

**Open targets.**

| Id | Target | Math | Source |
|---|---|---|---|
| O-R6-1 | effective non-vanishing for $\nu(D)=3$, first for klt 3-folds with $D$ big | 2 | D §11, §20 #4 |
| O-R6-2 | Ajit's questions: a terminal $X$ with ample $D$, $D-K_X$ ample, $H^0(D)=0$ and $R(X,D)$ with rational singularities; a klt Fano with nef Cartier $D$ and $H^0(D)=0$; $H^0(kD)=0$ for $1\le k<N$ | 2 each | D §20 #1 to #3 |
| O-R6-3 | Han's questions Q5.10 and Q5.11; a better constant $C_0$ | 2; 1 | D §20 #5 to #7 |
| O-R6-4 | Fujita freeness in general | 3 | D §10 |
| O-R6-5 | Fujita very ampleness | 4 | D §10 |
| O-R6-6 | the index conjecture for klt log CY in dim 4 | 3 | D §12.2 |
| O-R6-7 | the cone conjecture for one deformation class of CY 3-folds, with Lutz's invariance and a Vinberg search | 2 to 3 | D §13, §20 #25 |
| O-R6-8 | the cone conjecture for CY 3-folds | 5 | D §13 |
| O-R6-9 | boundedness of CY 3-folds | 5 | D §12.1 |
| O-R6-10 | the sharp Fano volume bound of Bie-Du-Yu in Lean for a fixed small dimension | 2 | C12 |

**First nodes.** `env-statement` (effective non-vanishing), `fujita-free-statement`, `index-conj-statement`, `cone-conj-statement`, `bab-statement`.

**Key obstruction.** For the formalization: CY geometry needs Hodge theory for most statements; the project states them on named hypotheses. For the mathematics: CY 3-folds are the hard core of classification.

**First weight: 0.10.**

## 4.8 R7: characteristic $p$ and mixed characteristic

**Idea.** The 3-fold MMP in characteristic $p\ge5$ is complete, and abundance is close. The open parts are small primes, 4-folds and moduli. The 4-folds need log resolutions, which are open in characteristic $p$ and are the subject of spec 2161. **The two projects share one hypothesis**, `HasLogResolution` (06.1), and one record in both maps.

**Open targets.**

| Id | Target | Math | Source |
|---|---|---|---|
| O-R7-1 | 3-fold abundance with $\nu=1$ for $5\le p\le42$: a human audit of OpenAI 035 (same as O-R1-9) | 2 | D §4.2, §20 #21 |
| O-R7-2 | the 3-fold MMP in characteristic 2 and 3 | 4 | B §1 |
| O-R7-3 | the 4-fold MMP for $p>5$, conditional on log resolutions (Waldron 2608.14236, Hacon-Witaszek) stated as a reduction | 3 | B §1 |
| O-R7-4 | ACC for lct for 4-folds in char $p$ | 4 | D §9 |
| O-R7-5 | LSC of mlds for hyperquotients in char $p$ | 2 | D §20 #17 |
| O-R7-6 | the arithmetic 3-fold MMP in residue characteristics 2 and 3 | 4 | B §2 |
| O-R7-7 | KSBA moduli in char $p$ | [U] | C §10 |

**First nodes.** `has-log-resolution` (shared with spec 2161), `charp-3fold-mmp-statement`, `red-waldron`.

**Key obstruction.** For the formalization: Frobenius singularities and Witt vectors are partial in Mathlib. For the mathematics: no resolution in dim $\ge4$, and no vanishing.

**First weight: 0.05.**

## 4.9 R8: foliations

**Idea.** The Cascini-Spicer survey (2604.09027) lists precise open questions. Some are about surfaces and are small.

**Open targets.**

| Id | Target | Math | Source |
|---|---|---|---|
| O-R8-1 | do the notions of foliation singularity agree on normal surfaces? (Q2.3) | 1 | D §20 #8 |
| O-R8-2 | is the lc locus of a foliation Zariski open? (Q3.11) | 2 | D §20 #9 |
| O-R8-3 | canonical foliation singularities are non-dicritical, rank 2 on 3-folds (Q3.23) | 2 | D §20 #10 |
| O-R8-4 | Q6.5 for algebraically integrable foliations | 2 | D §20 #11 |
| O-R8-5 | the MMP for general foliations in dim $\ge4$ | 5 | D §17 |

**First nodes.** `foliation-def`, `foliation-canonical-class`, `cs-q23-statement`.

**Key obstruction.** For the formalization: foliations need the tangent sheaf and saturation. For the mathematics: no cone theorem in general rank.

**First weight: 0.05.**

## 4.10 R9: Kähler and analytic

**Idea.** The Kähler MMP is moving fast (C10, C11). The route checks the dependencies of the new claims and states the Kähler program as a separate family.

**Open targets.**

| Id | Target | Math | Source |
|---|---|---|---|
| O-R9-1 | the citation audit of Hacon-Wang (same as O-R1-11) | 1 | 01.3 |
| O-R9-2 | the Kähler MMP in dim 4 | 4 | B §3 |
| O-R9-3 | b-semiampleness for Kähler morphisms of relative dimension 1 | 2 | D §20 #19 |
| O-R9-4 | non-vanishing for compact Kähler manifolds | 5 | B §3 |

**First nodes.** `kahler-pair-def`, `kahler-mmp-statement`.

**Key obstruction.** For the formalization: Kähler manifolds are absent from Mathlib. For the mathematics: currents replace curves.

**First weight: 0.05.**

## 4.11 The lab

The computation lab (13) runs experiments E1 to E10. Its results become certificates that Lean checks, or data that guides a route. The lab serves R1 (E1, E3, E10), R3 (E2, E9), R4 (E2, E8), R6 (E4, E5, E6) and R7 (E7). Its weight is 0.05 of the research budget, plus the machine time of 13.4.

## 4.12 Target T

Target T is the one open target that the project names for level G5. It must be open, small enough for one paper, checkable in Lean, and on a route that the project builds anyway.

**Target T: O-R3-3**, Han-Liu Conj. 1.9(2') for enc 4-fold pairs that are toric. Reasons:
1. It is open, and report D rates it at the small end of its scale (D §20 #15).
2. It is convex geometry over $\mathbb{Z}^4$, on the infrastructure of R3.
3. It is on the reduction graph: the full conjecture in dim 4 gives T(4) for lc flips (03.11). A toric case gives a human proof of a piece of T(4) that does not depend on AI code.
4. The lab can search the cones first (E2, 13) and produce candidate counterexamples or a classification before a proof.

**Backups.** O-R6-2 (Ajit's questions, with the lab) and O-R8-1 (a surface question). The choice is reviewed at S3 (15).
