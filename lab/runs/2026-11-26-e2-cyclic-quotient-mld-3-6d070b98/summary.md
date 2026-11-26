# 2026-11-26-e2-cyclic-quotient-mld-3-6d070b98

For each isolated cyclic quotient 3-fold germ 1/r(a, b, c) with r <= 40, is the germ terminal exactly when two weights add to 0 mod r (the terminal lemma), and is the mld of each terminal germ 1 + 1/r?

Result: agrees: in 1747 germs of dimension 3, a germ is terminal exactly when two weights add to 0 mod r, and each terminal germ has the mld 1 + 1/r.

## What the run does

The run lists each isolated cyclic quotient germ 1/r(a_1, ..., a_3) with 2 <= r <= 40, once up to the order of the weights and the choice of the generator of the group. The germ is the toric variety of the cone spanned by e_1, ..., e_n in the lattice Z^n + Z (a_1, ..., a_n)/r. Because the germ is isolated, each exceptional divisor of log discrepancy at most 1 comes from a point of the box, and the log discrepancy of the point of k is the age, the sum of the fractional parts of k a_i / r. So the mld at the origin is the smallest age, and the germ is terminal when each age is more than 1 and canonical when each age is at least 1 (the criterion of Reid and Tai).

The run checks two known results. The terminal lemma (Morrison-Stevens, White-Frumkin) says that the germ is terminal if and only if two of the weights add to 0 mod r. For a terminal germ 1/r(1, -1, a), the age of the k with k a = 1 mod r is 1 + 1/r, so the mld is 1 + 1/r.

## The counts by index

| r | germs | terminal | canonical | enc |
|---|---|---|---|---|
| 2 | 1 | 1 | 1 | 0 |
| 3 | 2 | 1 | 2 | 1 |
| 4 | 2 | 1 | 1 | 1 |
| 5 | 5 | 2 | 3 | 2 |
| 6 | 2 | 1 | 1 | 1 |
| 7 | 10 | 3 | 5 | 4 |
| 8 | 5 | 2 | 2 | 1 |
| 9 | 10 | 3 | 5 | 3 |
| 10 | 5 | 2 | 2 | 1 |
| 11 | 22 | 5 | 7 | 6 |
| 12 | 5 | 2 | 2 | 1 |
| 13 | 31 | 6 | 9 | 7 |
| 14 | 10 | 3 | 4 | 1 |
| 15 | 15 | 4 | 5 | 2 |
| 16 | 15 | 4 | 4 | 1 |
| 17 | 51 | 8 | 11 | 7 |
| 18 | 10 | 3 | 3 | 2 |
| 19 | 64 | 9 | 13 | 7 |
| 20 | 15 | 4 | 4 | 2 |
| 21 | 31 | 6 | 8 | 2 |
| 22 | 22 | 5 | 5 | 1 |
| 23 | 92 | 11 | 15 | 3 |
| 24 | 15 | 4 | 4 | 1 |
| 25 | 77 | 10 | 13 | 3 |
| 26 | 31 | 6 | 6 | 1 |
| 27 | 64 | 9 | 11 | 3 |
| 28 | 31 | 6 | 6 | 1 |
| 29 | 145 | 14 | 19 | 3 |
| 30 | 15 | 4 | 4 | 1 |
| 31 | 166 | 15 | 21 | 3 |
| 32 | 51 | 8 | 8 | 1 |
| 33 | 77 | 10 | 12 | 2 |
| 34 | 51 | 8 | 8 | 1 |
| 35 | 109 | 12 | 15 | 3 |
| 36 | 31 | 6 | 6 | 2 |
| 37 | 235 | 18 | 25 | 3 |
| 38 | 64 | 9 | 9 | 1 |
| 39 | 109 | 12 | 15 | 2 |
| 40 | 51 | 8 | 8 | 1 |

## The mlds below 1

The run found 344 distinct values: 3/40, 1/13, 3/38, 3/37, 1/12, 3/35, 3/34, 1/11, 3/32, 3/31, 1/10, 4/39, 3/29, 3/28, 4/37, 1/9, 4/35, 3/26, 3/25, 4/33, 1/8, 5/39, 4/31, 3/23, 5/38, 5/37, 3/22, 4/29, 1/7, 5/34, 4/27, 3/20, 5/33, 2/13, 5/32, 3/19, 4/25, 5/31, 6/37, 1/6, 6/35, 5/29, 4/23, 7/40, 3/17, 5/28, 7/39, 2/11, 7/38, 5/27, 3/16, 7/37, 4/21, 5/26, 6/31, 7/36, 1/5, 8/39, 7/34, 6/29, 4/19, 7/33, 3/14, 8/37, 5/23, 7/32, 2/9, 9/40, 7/31, 5/22, 8/35, 3/13, 4/17, 9/38, 5/21, 6/25, 7/29, 8/33, 9/37, 1/4, 10/39, 9/35, 8/31, 7/27, 6/23, 5/19, 9/34, 4/15, 7/26, 10/37, 3/11, 11/40, 8/29, 7/25, 9/32, 11/39, 2/7, 11/38, 9/31, 7/24, 5/17, 8/27, 11/37, 3/10, 10/33, 7/23, 11/36, 4/13, 9/29, 5/16, 11/35, 6/19, 7/22, 8/25, 9/28, 10/31, 11/34, 12/37, 13/40, 1/3, 13/38, 12/35, 11/32, 10/29, 9/26, 8/23, 7/20, 13/37, 6/17, 11/31, 5/14, 14/39, 9/25, 13/36, 4/11, 7/19, 10/27, 13/35, 3/8, 14/37, 11/29, 8/21, 13/34, 5/13, 12/31, 7/18, 9/23, 11/28, 13/33, 15/38, 2/5, 15/37, 13/32, 11/27, 9/22, 16/39, 7/17, 12/29, 5/12, 13/31, 8/19, 11/26, 14/33, 17/40, 3/7, 16/37, 10/23, 17/39, 7/16, 11/25, 15/34, 4/9, 17/38, 13/29, 14/31, 5/11, 16/35, 17/37, 6/13, 13/28, 7/15, 15/32, 8/17, 17/36, 9/19, 19/40, 10/21, 11/23, 12/25, 13/27, 14/29, 15/31, 16/33, 17/35, 18/37, 19/39, 1/2, 20/39, 19/37, 18/35, 17/33, 16/31, 15/29, 14/27, 13/25, 12/23, 11/21, 21/40, 10/19, 19/36, 9/17, 17/32, 15/28, 7/13, 20/37, 13/24, 19/35, 6/11, 17/31, 11/20, 16/29, 21/38, 5/9, 19/34, 14/25, 9/16, 22/39, 13/23, 21/37, 4/7, 23/40, 19/33, 15/26, 11/19, 18/31, 7/12, 17/29, 10/17, 23/39, 13/22, 16/27, 19/32, 22/37, 3/5, 23/38, 20/33, 17/28, 14/23, 19/31, 8/13, 21/34, 13/21, 18/29, 23/37, 5/8, 22/35, 17/27, 12/19, 19/30, 7/11, 23/36, 16/25, 25/39, 9/14, 20/31, 11/17, 24/37, 15/23, 17/26, 19/29, 21/32, 23/35, 25/38, 2/3, 27/40, 25/37, 23/34, 21/31, 19/28, 17/25, 15/22, 13/19, 24/35, 11/16, 20/29, 9/13, 25/36, 16/23, 23/33, 7/10, 26/37, 19/27, 12/17, 22/31, 27/38, 5/7, 28/39, 23/32, 18/25, 13/18, 21/29, 29/40, 8/11, 27/37, 19/26, 25/34, 14/19, 17/23, 20/27, 23/31, 26/35, 29/39, 3/4, 28/37, 25/33, 22/29, 19/25, 16/21, 13/17, 10/13, 27/35, 24/31, 7/9, 18/23, 15/19, 23/29, 4/5, 30/37, 22/27, 9/11, 14/17, 19/23, 24/29, 31/37, 26/31, 21/25, 16/19, 11/13, 6/7, 25/29, 20/23, 15/17, 10/11, 12/13.

## What the run does not do

- It is a search, not a proof. Only a certificate that Lean checks makes a theorem (spec 13.4).
- It covers only the isolated cyclic quotients, not every simplicial toric germ and not the germs that are not simplicial.
- It runs in the mmp binary, not in a container with pinned images, and it uses no network and no other tool. The record gives the commit of mmp, so the outputs are reproducible.
