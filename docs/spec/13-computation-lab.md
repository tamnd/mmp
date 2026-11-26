# 13. The computation lab

In birational geometry, computation and classification have often come before the theory:
- Reid's lists of terminal singularities and baskets, and the plurigenus formula that made them a tool;
- the 95 families of terminal Fano 3-fold hypersurfaces in weighted projective space (Reid, Iano-Fletcher);
- the Graded Ring Database of Brown, Kasprzyk and others;
- the classification of toric Fano varieties (Batyrev, Kreuzer-Skarke, Kasprzyk, Øbro);
- the 1/1680 volume bound of J. A. Chen and M. Chen, which is a finite search over baskets after the theory.

A large part of the MMP is also convex geometry over $\mathbb{Z}^n$: toric varieties, toric mlds and toric flips. There a computer does not only give evidence. It can give a complete proof of a finite statement.

The lab has four uses:
- **Certified examples.** It gives the fidelity battery positive instances (06.3, F2) for the statements, mostly from toric and weighted examples.
- **Tests.** It tests the explicit numbers and identities of fresh claims (route R1) and of conjectures on the routes, before anyone spends months on a proof.
- **Searches.** It searches finite sets for counterexamples and for the extremal cases of a conjecture, for example the toric enc 4-fold germs of Target T (04.12).
- **Handbook data.** It gives the handbook its worked examples and the notebooks of the exercises marked (M) (11.6).

Its results are data, not proofs. A result enters the map only as a node of kind `example`, `counterexample`, `check` or `conjecture`. A result becomes a theorem only when Lean checks a certificate (13.5).

## 13.1 Tools

| Tool | Use | Note |
|---|---|---|
| Normaliz | Hilbert bases of cones, lattice points of polytopes, Ehrhart series; the core of the toric experiments | GPL |
| polymake | polytopes and fans, secondary fans, Gale duality | GPL |
| TOPCOM | triangulations of point sets, flips of triangulations | GPL; the toric flips of Volume 3 |
| PALP | reflexive polytopes and their normal forms | GPL; the Kreuzer-Skarke data |
| Macaulay2 | ideals, cohomology of sheaves, `NormalToricVarieties`, multiplier ideals of monomial ideals, $F$-singularities (`TestIdeals`) | GPL |
| Singular | singularities, resolution (`resolve`), Milnor and Tjurina numbers, normal forms of ADE germs | GPL |
| SageMath | glue; toric varieties; lattices; the Vinberg algorithm through its interfaces [U] | GPL |
| FLINT | exact arithmetic over $\mathbb{Z}$, $\mathbb{Q}$ and $\mathbb{F}_p$ for the inner loops | LGPL |
| Magma | cross-checks only, where the project has a licence; never a required tool | proprietary; a result that only Magma reproduces is marked so |
| `mmp-lab` (Rust) | the inner loops: basket enumeration and plurigenus inequalities; the enumeration of simplicial cones by index and their mlds; the run of the toric MMP with scaling on random fans | written by the project, in `mmp-agent/lab/` |
| Lean | checks a certificate (13.5) | |

## 13.2 Databases

The `linker` role (10.3) links each node to the objects of these databases. Each link records the database, the label of the object, the version of the data and its licence. The licence of each data set is checked before the first link [U].

| Database | Objects | Size (to recheck) | Used by |
|---|---|---|---|
| Graded Ring Database (Brown, Kasprzyk and others) | Hilbert series and baskets of $\mathbb{Q}$-Fano 3-folds and of 3-folds of general type; toric Fano 3-folds | 39,550 baskets (07, T6-07) [S]; other counts [U] | E1, E5 |
| Kasprzyk's toric Fano lists | terminal toric Fano 3-folds (634) and canonical toric Fano 3-folds (674,688) [U] | as stated | E2, E5, E9 |
| Kreuzer-Skarke | reflexive polytopes: 4,319 in dimension 3 and 473,800,776 in dimension 4 [U] | as stated | E6, E9 |
| Smooth toric Fano varieties (Batyrev, Sato, Kreuzer-Nill, Øbro) | 18 in dimension 3, 124 in dimension 4, 866 in dimension 5, 7,622 in dimension 6 [U] | as stated | E9; examples for Volume 3 |
| Fanography | the 105 families of smooth Fano 3-folds of Mori-Mukai and Iskovskikh, with their invariants [U] | 105 | E5; examples for Volumes 7 and 14 |
| Iano-Fletcher's lists | well-formed quasi-smooth weighted hypersurfaces and complete intersections, including the 95 families of terminal Fano 3-fold hypersurfaces | as stated [S] | E4, E5 |
| The LMFDB | only for the elliptic curves of the running examples ($E \times E$, elliptic surfaces) | small | handbook examples |
| Math 2.0 | the cross-project node map | as stated | every node |

The lab never writes into these databases. It records a disagreement with a database in its run record, and the owner writes to the maintainers.

## 13.3 Specs and runs

A lab job is a spec file in `tamnd/mmp/lab/specs/<name>.yaml`:

```yaml
name: toric-enc-mld-4fold-index-le-12
question: For every simplicial 4-dimensional cone sigma with primitive generators, Q-Gorenstein index r <= 12 and an exceptional non-canonical (enc) toric germ structure, list mld(X_sigma, 0), the set of toric valuations that compute it, and every germ that violates Han-Liu Conj. 1.9(2').
tool: mmp-lab
inputs:
  dim: 4
  index: [1, 12]
  cone_class: simplicial
  normal_form: hermite        # one cone per GL(4, Z) orbit
outputs: [list of cones in normal form, mld, minimizers, the violating germs if any, a certificate per cone]
node: MMXCD16PTN           # the toric case of S52, Target T
```

`mmp lab run` runs it in a container with pinned images and no network (10.7). It writes `lab/runs/<id>/` with:
- the spec hash;
- the image digests;
- the seed, when the run is random;
- the wall time and the core hours;
- the outputs and the certificates;
- a short summary.

A run is reproducible from its record. A run that changes a published number of the handbook or of the site makes the builder fail until a person accepts the new number.

## 13.4 The first experiments

| Id | Question | Route | Why it matters |
|---|---|---|---|
| E1 | Baskets and plurigenera of 3-folds of general type: enumerate the baskets allowed by Reid's plurigenus formula and the Chen-Chen inequalities; reproduce $\mathrm{vol} \ge 1/1680$ with its extremal basket; check the basket search of Bie-Du-Yu for $\mathrm{vol} \ge 1/420$ on smooth 3-folds (2611.12786), with their ancillary code read as data | R1 (O-R1-2) | the cheapest test of a 118-page claim; a certificate that Lean can check (13.5) |
| E2 | Toric mlds and enc germs: enumerate simplicial (and then all) toric germs of dimension 3 and 4 by index; compute the mld and its minimizers; test Han-Liu Conj. 1.9(2') on the toric enc 4-fold germs (the spec above); test Ambro's LSC on toric families | R3, R4 (Target T) | a classification or a counterexample before the proof of Target T; F2 instances for `ACCMld` and `LSCMld` |
| E3 | The arithmetic of Ajit's counterexamples to effective nonvanishing (2610.09270, v2): the intersection numbers, the $h^0$ values by Riemann-Roch or by monomial count, and the singularities of each example | R1 (S57) | the first node of route R1; a certificate for the refutation of the effective statement |
| E4 | Ajit's questions (O-R6-2): search the well-formed quasi-smooth weighted hypersurfaces and complete intersections of dimension 3 for a terminal $X$ with ample $D$, $D - K_X$ ample and $H^0(X, D) = 0$; record the near misses | R6 | a cheap search for the backup targets of 04.12 |
| E5 | Fano and general type volumes: $(-K)^3$ over the Graded Ring Database and the toric lists; check $(-K)^3 \ge 1/330$ for terminal weak $\mathbb{Q}$-Fano 3-folds (Chen-Chen, Jiang) on the data; list the cases with the smallest volumes; test the sharp Fano bound of Bie-Du-Yu where it is explicit (O-R6-10) | R6 | the data behind O-R6-10; examples for Volume 12 |
| E6 | The cone conjecture for one deformation class of Calabi-Yau 3-folds (O-R6-7): compute the nef cone and the movable cone from the lattice data, run the Vinberg algorithm on the relevant hyperbolic lattice, and test Lutz's invariance on examples from the Kreuzer-Skarke data; the same for K3 surfaces as a control | R6 | the search step of O-R6-7 |
| E7 | Characteristic $p$: Fedder's criterion for $F$-purity of hypersurface germs and of the quotient germs $\frac1n(1, q)$ for small $p$; LSC of mlds for hyperquotients in characteristic $p$ (O-R7-5) on families; the discrepancies of wild $\mathbb{Z}/p$ quotients by the Yasuda $v$-function [U for the exact form used] | R7 | data for O-R7-5; examples for Volume 11 |
| E8 | Effective termination bounds: evaluate the explicit bounds of Han-Liu-Zhuang (2509.01501) in dimension at most 4 and compare them with the lengths of the toric MMP runs of E9 and with the 3-fold examples of the handbook | R4 | a test of how far the bounds are from the truth; data for O-R4-1 |
| E9 | Toric MMP runs: random projective simplicial toric varieties of dimension 3 and 4 from the toric lists and from random fans; run the MMP with scaling; record the steps, the flip types, the lengths and the end products; run the same inputs through the Lean toric code when it is proved; compare with the steps of the 3-fold MMP algorithm of Yasuda (2603.13703) on the examples where both apply [U] | R3, library | F2 instances for S39 `ToricMMP`; the pictures of 12.4; examples for Volumes 3 and 9 |
| E10 | The explicit identities and numbers of each new claim of route R1 (07.13), where they can be computed | R1 | the cheapest test of a fresh claim |

So route R1 uses E1, E3 and E10; R3 uses E2 and E9; R4 uses E2 and E8; R6 uses E4, E5 and E6; R7 uses E7 (04.11).

## 13.5 Certificates: from computation to Lean

A computation that finds a specific object, a specific number or a finite list can be checked in Lean when it comes with a certificate. A certificate reduces the claim to a finite check plus a theorem that the project has proved or stated as a named hypothesis (09.2).

- **Toric mld.**
  - For a toric germ $X_\sigma$ with $K$ $\mathbb{Q}$-Cartier, let $\psi$ be the linear function with $\psi(v_i) = 1$ on the primitive generators $v_i$. The log discrepancy of the toric valuation of a lattice point $v$ of the interior of $\sigma$ is $\psi(v)$. The mld at the closed orbit is the minimum of $\psi$ over the interior lattice points.
  - The certificate gives a minimizer $v$ and the finite list of lattice points of the bounded region $\{u \in \sigma : \psi(u) < \psi(v)\}$, which has no interior point.
  - Lean checks the list by enumeration (`decide`) on the toric code of route R3. The reduction from all valuations to toric valuations is a theorem of R3 (07, T5-08), proved or a named hypothesis.
  - So each germ of E2 becomes a proved Lean fact, and a violating germ for Target T would be a proved counterexample.
- **Basket search.**
  - Reid's plurigenus formula and the Chen-Chen inequalities are stated as named hypotheses (`ReidPlurigenus`, and one hypothesis per cited inequality).
  - The certificate is the finite list of candidate baskets, each with the inequality that excludes it or the volume that it gives.
  - Lean checks the arithmetic with `norm_num` and `decide`. The result is `proved-mod` the named hypotheses, which the site shows (14.3).
- **Weighted hypersurfaces.**
  - Well-formedness and quasi-smoothness are conditions on the weights and the degree (Iano-Fletcher), stated as hypotheses.
  - The terminal condition for cyclic quotient points is Reid's terminal lemma (Volume 4), and $h^0(\mathcal{O}(d))$ is a count of monomials.
  - Lean checks all three by `decide` for one example.
- **$F$-purity.** Fedder's criterion says that a hypersurface $f$ in a regular local ring of characteristic $p$ is $F$-pure if and only if $f^{p-1} \notin \mathfrak{m}^{[p]}$. With the criterion as a named hypothesis, the check is a polynomial computation over $\mathbb{F}_p$, by `decide` for small $p$.
- **Toric MMP runs.** A run of E9 is a list of fans. When the toric cone, contraction and flip theorems of route R3 are proved, each step is checked by the Lean toric code, and the run becomes a proved example of S39.
- **Lattice computations.** A Vinberg run gives the roots and the Gram matrix of the reflection group. Lean checks the finite combinatorial conditions of Vinberg's criterion for that matrix, with the criterion as a named hypothesis.

So a counterexample from the lab becomes a Lean theorem in `MinimalModel.Examples` with status `proved` or `proved-mod`, and it can refute a node. A positive certificate is an F2 instance. The `refuter` role writes these theorems from the lab outputs, and the `explorer` role writes the specs (10.3).

## 13.6 Machine time

| Experiment | Estimate | Machine |
|---|---|---|
| E1 | under 100 core hours [U] | the lab machine |
| E2 in dimension 3, and in dimension 4 to index 12 | 500 to 5,000 core hours [U]; the count of cones grows fast with the index | the lab machine; larger index on rented time, after a measurement |
| E3, E4, E5, E7, E10 | under 50 core hours each [U] | the lab machine |
| E6 | 100 to 1,000 core hours per deformation class [U] | the lab machine |
| E8, E9 | about 200 core hours for 10,000 runs [U] | the lab machine |
| Certificates in Lean | the CI of `tamnd/mmp-lean`; a certificate that takes more than 10 minutes to check is split | CI |

The lab machine has 32 cores (`lab_cores` in `agent.yaml`, 10.6), rented by the month. The bridge runner of 09.4 is a different machine. Each spec gives a core hour limit, and `mmp lab run` stops at the limit. The first measurement of E2 at index 6 sets the plan for index 12 (Q-22).

## 13.7 What the lab does not do

- It does not decide that a statement is true. A conjecture with a million supporting examples has status `open`.
- It does not decide that a fresh claim is false. A numerical mismatch is a question for the authors (14.4). It becomes a Lean counterexample only through a certificate.
- It does not run code from a claim in the open. The ancillary code of a preprint (for example Bie-Du-Yu) is data. It runs only in the container with no network, and its output is checked by the project's own code or by a certificate.
- It does not copy database data into the Lean tree. Data enters Lean only as a certificate for a specific node, with the database label and the run id.
