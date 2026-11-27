# 2026-11-27-e2-simplicial-mld-4-65e39813

For each simplicial toric 4-fold germ C^4/G, with G = N/Z^4 abelian of order r <= 6 and the rays primitive, what are the mld at the fixed point, the mld of the germ, the terminal, canonical and Gorenstein germs and the enc germs, do the isolated cyclic germs agree with the family cyclic of dimension 4, and are the germs with a zero coordinate the 3-fold germs of e2-simplicial-mld-3 times a line?

Result: agrees: in 81 simplicial toric 4-fold germs with r <= 6, the isolated cyclic germs with r <= 6 are those of the family cyclic, the germs with a zero coordinate are the 3-fold germs of the family simplicial times a line, and each index has a terminal germ.

## What the run does

The run lists each simplicial toric 4-fold germ with 2 <= r <= 6, once up to isomorphism, as the family simplicial does in dimension 3. The germ is the cone spanned by e_1, ..., e_4 in a lattice N with Z^4 ⊆ N ⊂ Q^4, so it is a finite subgroup G = N/Z^4 of (Q/Z)^4, and r is the order of G. It is not the Gorenstein index, which is the column gorenstein_index of germs.json. The e_i are primitive exactly when no nonzero element of G is on one coordinate, and two germs are isomorphic exactly when their groups differ by a permutation of the coordinates. The run lists the Hermite normal forms of the duals, the sublattices of Z^4 of index r, keeps those with primitive rays, and keeps the smallest normal form of the 24 permutations of the coordinates.

An element g of G is written (g_1, ..., g_4) with 0 <= g_i < r, for g_i / r, and its age is (g_1 + ... + g_4) / r. The mld at the torus-fixed point is the minimum of 4 and of age(g) + #{i : g_i = 0} over the nonzero g, with the minimizers g + (the zero coordinates of g). The mld of the germ, over all exceptional divisors, is the minimum of 2 and of the ages: e_i + e_j is a divisor of log discrepancy 2. Terminal and canonical are the ages more than 1 and at least 1 (Reid-Tai). The divisors of log discrepancy at most 1 are the primitive box points of age at most 1; enc and enc_hl are as in dimension 3. A germ is Gorenstein when each age is an integer.

## The checks

- The family cyclic. The 20 isolated cyclic germs with r <= 6 are compared with a run of the family cyclic in dimension 4, germ for germ: the weights, the mld, a minimizer, terminal, canonical and the divisors of log discrepancy at most 1. 0 differ.
- The 3-fold germs times a line. A germ with a coordinate that is 0 on G is X times a line, for the 3-fold germ X of the other three coordinates, and each 3-fold germ gives one such 4-fold germ. The 32 germs with r <= 6 and a zero coordinate are compared with the family simplicial of dimension 3, germ for germ: each 3-fold germ is found once, the mld at the fixed point is that of X plus 1, and the mld of the germ, terminal, canonical, the divisors and the group are those of X. 0 differ.
- Each index has a terminal germ, 1/r(1, -1, 1, -1), whose ages are all 2. 0 indices have none.

The cases by hand, computed by the closure of the generators and found once in the enumeration:

| germ | by hand | the run | found once |
|---|---|---|---|
| 1/2(1,1,1,1) | mld 2/1 at [[1 1 1 1]], germ mld 2/1, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [2] | the same | yes |
| 1/5(1,2,3,4) | mld 2/1 at [[1 2 3 4] [2 4 1 3] [3 1 4 2] [4 3 2 1]], germ mld 2/1, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [5] | the same | yes |
| 1/5(1,1,1,1) | mld 4/5 at [[1 1 1 1]], germ mld 4/5, not canonical, not terminal, divisors 1 (1 over the point), enc, enc_hl, group [5] | the same | yes |
| 1/4(1,1,1,1) | mld 1/1 at [[1 1 1 1]], germ mld 1/1, canonical, not terminal, divisors 1 (1 over the point), enc, not enc_hl, group [4] | the same | yes |
| 1/3(1,1,1,0) | mld 2/1 at [[1 1 1 3]], germ mld 1/1, canonical, not terminal, divisors 1 (0 over the point), enc, not enc_hl, group [3] | the same | yes |
| (Z/2)^2 | mld 2/1 at [[2 2 2 2]], germ mld 1/1, canonical, not terminal, divisors 2 (0 over the point), not enc, not enc_hl, group [2 2] | the same | yes |

## The counts

The column line counts the germs with a zero coordinate, the 3-fold germs times a line.

| r | germs | cyclic | isolated | terminal | canonical | gorenstein | enc | enc_hl | line |
|---|---|---|---|---|---|---|---|---|---|
| all | 81 | 78 | 20 | 30 | 63 | 27 | 29 | 13 | 32 |
| 2 | 3 | 3 | 1 | 2 | 3 | 2 | 1 | 0 | 2 |
| 3 | 7 | 7 | 3 | 4 | 6 | 3 | 2 | 1 | 4 |
| 4 | 16 | 13 | 3 | 5 | 14 | 7 | 7 | 2 | 7 |
| 5 | 18 | 18 | 10 | 10 | 13 | 5 | 5 | 4 | 8 |
| 6 | 37 | 37 | 3 | 9 | 27 | 10 | 14 | 6 | 11 |

germs.json lists the 81 germs with r <= 6, one on each line. indices.json has the counts of each index.

The germs by Gorenstein index: 1: 27, 2: 11, 3: 18, 4: 4, 5: 13, 6: 8.

## The values

The mlds at the fixed point below 1: 3 distinct values, the smallest 2/3, 4/5, 5/6.

The mlds of the germs that are enc_hl: 8 distinct values, the smallest 1/3, 2/5, 1/2, 3/5, 2/3, 3/4, 4/5, 5/6.

## The terminal germs not of type 1/r(a, -a, b, -b)

An isolated cyclic germ 1/r(a, -a, b, -b) with a and b units is terminal, because each age is 2. 24 terminal germs are not of this type. They are data, not mismatches.
- r = 2, gens [[0 1 1 1]], weights [0 1 1 1]: mld 5/2 at [[2 1 1 1]], germ mld 3/2, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [2]
- r = 3, gens [[0 2 2 1]], weights [0 1 1 2]: mld 7/3 at [[3 1 1 2]], germ mld 4/3, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [3]
- r = 3, gens [[2 2 2 1]], weights [1 1 1 2]: mld 5/3 at [[1 1 1 2]], germ mld 5/3, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [3]
- r = 3, gens [[1 1 1 1]], weights [1 1 1 1]: mld 4/3 at [[1 1 1 1]], germ mld 4/3, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [3]
- r = 4, gens [[0 3 3 1]], weights [0 1 1 3]: mld 9/4 at [[4 1 1 3]], germ mld 5/4, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [4]
- r = 4, gens [[3 3 3 1]], weights [1 1 1 3]: mld 3/2 at [[1 1 1 3]], germ mld 3/2, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [4]
- r = 4, gens [[3 3 2 1]], weights [1 1 2 3]: mld 7/4 at [[1 1 2 3]], germ mld 3/2, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [4]
- r = 4, gens [[2 1 1 1]], weights [1 1 1 2]: mld 5/4 at [[2 1 1 1]], germ mld 5/4, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [4]
- r = 5, gens [[0 4 4 1]], weights [0 1 1 4]: mld 11/5 at [[5 1 1 4]], germ mld 6/5, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [5]
- r = 5, gens [[0 4 3 1]], weights [0 1 2 3]: mld 11/5 at [[5 3 1 2]], germ mld 6/5, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [5]
- r = 5, gens [[4 4 4 1]], weights [1 1 1 4]: mld 7/5 at [[1 1 1 4]], germ mld 7/5, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [5]
- r = 5, gens [[4 4 3 1]], weights [1 1 2 4]: mld 8/5 at [[1 1 2 4]], germ mld 8/5, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [5]
- r = 5, gens [[4 4 2 1]], weights [1 1 3 4]: mld 8/5 at [[2 2 1 3]], germ mld 8/5, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [5]
- r = 5, gens [[4 3 3 1]], weights [1 1 2 3]: mld 7/5 at [[3 1 1 2]], germ mld 7/5, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [5]
- r = 5, gens [[3 3 1 1]], weights [1 1 2 2]: mld 6/5 at [[1 1 2 2]], germ mld 6/5, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [5]
- r = 5, gens [[3 1 1 1]], weights [1 1 1 3]: mld 6/5 at [[3 1 1 1]], germ mld 6/5, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [5]
- r = 6, gens [[0 5 5 1]], weights [0 1 1 5]: mld 13/6 at [[6 1 1 5]], germ mld 7/6, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [6]
- r = 6, gens [[5 5 5 1]], weights [1 1 1 5]: mld 4/3 at [[1 1 1 5]], germ mld 4/3, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [6]
- r = 6, gens [[5 5 4 1]], weights [1 1 2 5]: mld 3/2 at [[1 1 2 5]], germ mld 3/2, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [6]
- r = 6, gens [[5 5 3 1]], weights [1 1 3 5]: mld 5/3 at [[1 1 3 5]], germ mld 4/3, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [6]
- r = 6, gens [[5 5 2 1]], weights [1 1 4 5]: mld 5/3 at [[2 2 2 4]], germ mld 3/2, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [6]
- r = 6, gens [[5 4 3 1]], weights [1 2 3 5]: mld 11/6 at [[1 2 3 5]], germ mld 4/3, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [6]
- r = 6, gens [[4 1 1 1]], weights [1 1 1 4]: mld 7/6 at [[4 1 1 1]], germ mld 7/6, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [6]
- r = 6, gens [[3 2 1 1]], weights [1 1 2 3]: mld 7/6 at [[3 2 1 1]], germ mld 7/6, canonical, terminal, divisors 0 (0 over the point), not enc, not enc_hl, group [6]

## Notes

E2 in dimension 4 to index 6 for milestone S3, over all simplicial toric germs, cyclic or not, isolated or not, up to the permutations of the coordinates. As in dimension 3, r is the order of G and not the Gorenstein index; germs.json gives the Gorenstein index of each germ. The run is the measurement of Q-22. It took well under a second, and the work grows like r^4. Measured on a loaded 10-core arm64 laptop, index 12 took 0.03 s, index 100 7.2 s, index 150 47 s and index 200 136 s. So index 12 is far inside the 5,000 core hours of Q-22, and the plan for index 12 is in spec 13.6. It has no Lean certificate yet (13.4).

## What the run does not do

- It is a search, not a proof. Only a certificate that Lean checks makes a theorem (spec 13.4).
- It covers the simplicial germs of dimension 4 only, not the germs that are not simplicial.
- It counts the toric divisors. That the toric divisors compute the mld of a toric germ is a theorem of route R3 (spec 13.5), not a part of the run.
- It runs in the mmp binary, not in a container with pinned images, and it uses no network and no other tool. The record gives the commit of mmp, so the outputs are reproducible.
