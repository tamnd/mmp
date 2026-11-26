# 03. The minimal model program, mathematically

This document states the objects, the theorems and the conjectures of the minimal model program in the form that the project uses. It also says what is proved and what is open on 2026-11-26. Documents 04 (routes) and 06 (Lean statements) build on it. The sources are in document 01 and in the research reports A to D. Tags are those of document 01. Standard textbook facts (Kollár-Mori 1998, cited as KM98) carry no tag. The research reports mark KM98 numbers as [U], and the `reader` role checks them first (16, Q-11).

The program is not one statement. It is a network of theorems and conjectures in each dimension, joined by implications (3.11). Many choices in a statement are part of the work: the class of pair, $\mathbb{Q}$ or $\mathbb{R}$ coefficients, absolute or relative, the base field, $\mathbb{Q}$-factorial or not. Section 3.14 lists the consequences for the project.

## 3.1 Varieties, divisors and pairs

Throughout, $k$ is an algebraically closed field of characteristic 0, unless a section says otherwise. A **variety** is an integral separated scheme of finite type over $k$. The project fixes this definition in 06.1 and checks its choice against AxiomMath/MMP (04.3, step A5).

Let $X$ be a normal variety. A **prime divisor** is an integral closed subscheme of codimension 1. Its generic point $\eta_D$ has a local ring $\mathcal{O}_{X,\eta_D}$ that is a DVR, because $X$ is normal. The order of vanishing $\mathrm{ord}_D$ is its valuation.
- A **Weil divisor** is a finite formal sum $D=\sum a_iD_i$ with $a_i\in\mathbb{Z}$. A **$\mathbb{Q}$-divisor** or **$\mathbb{R}$-divisor** has $a_i\in\mathbb{Q}$ or $\mathbb{R}$. In Lean this is a finitely supported function $\mathrm{PrimeDivisor}(X)\to_0\mathbb{Q}$ (06.1).
- The **principal divisor** of $f\in K(X)^\times$ is $\mathrm{div}(f)=\sum_D\mathrm{ord}_D(f)D$. Two divisors are **linearly equivalent**, $D\sim D'$, if $D-D'$ is principal. $D\sim_\mathbb{Q}D'$ if $m(D-D')$ is principal for some $m>0$. $D\sim_\mathbb{R}D'$ if $D-D'$ is an $\mathbb{R}$-combination of principal divisors.
- $D$ is **Cartier** if it is locally principal. It is **$\mathbb{Q}$-Cartier** if $mD$ is Cartier for some $m>0$. It is **$\mathbb{R}$-Cartier** if it is an $\mathbb{R}$-combination of Cartier divisors. $X$ is **$\mathbb{Q}$-factorial** if every Weil divisor is $\mathbb{Q}$-Cartier.
- The **canonical divisor** $K_X$ is a Weil divisor with $\mathcal{O}_U(K_X)\cong\omega_U=\det\Omega_U$ on the smooth locus $U$. Because $X\setminus U$ has codimension at least 2, $K_X$ is well defined up to linear equivalence.

**Definition 3.1 (Pair).** A **pair** $(X,\Delta)$ is a normal variety $X$ and an effective $\mathbb{R}$-divisor $\Delta$ such that $K_X+\Delta$ is $\mathbb{R}$-Cartier. A **boundary** has coefficients in $[0,1]$. A **relative pair** over $U$ is a pair with a projective morphism $\pi:X\to U$.

**Definition 3.2 (Generalized pair, Birkar-Zhang 1410.0938).** A **generalized pair** $(X,B+M)$ over $U$ is a normal $X$, an effective $\mathbb{R}$-divisor $B$, a projective birational $\phi:X'\to X$ and a nef over $U$ $\mathbb{R}$-Cartier divisor $M'$ on $X'$ with $M=\phi_*M'$, such that $K_X+B+M$ is $\mathbb{R}$-Cartier [P]. It is **NQC** if $M'$ is a non-negative real combination of nef $\mathbb{Q}$-Cartier divisors [P].

## 3.2 Singularities

Let $(X,\Delta)$ be a pair and $f:Y\to X$ a proper birational morphism from a normal $Y$. Choose $K_Y$ with $f_*K_Y=K_X$. Then
$$K_Y+\Delta_Y=f^*(K_X+\Delta),\qquad f_*\Delta_Y=\Delta$$
defines $\Delta_Y$. For a prime divisor $E$ on $Y$, the **discrepancy** is $a(E,X,\Delta)=-\mathrm{mult}_E\Delta_Y$, and the **log discrepancy** is $A_{X,\Delta}(E)=1+a(E,X,\Delta)$. The value depends only on the divisorial valuation $\mathrm{ord}_E$ of $K(X)$, not on $Y$. The **centre** $c_X(E)$ is the closure of $f(E)$.

**Definition 3.3 (Classes).** $(X,\Delta)$ is
- **terminal** if $a(E)>0$ for all exceptional $E$;
- **canonical** if $a(E)\ge0$ for all exceptional $E$;
- **klt** if $a(E)>-1$ for all $E$ (exceptional or not), that is, $\lfloor\Delta\rfloor=0$ and $a(E)>-1$ for exceptional $E$;
- **plt** if $a(E)>-1$ for all exceptional $E$;
- **dlt** if the coefficients of $\Delta$ are in $[0,1]$ and there is an open $U\subseteq X$ such that $(U,\Delta|_U)$ is log smooth and $a(E)>-1$ for every $E$ with centre in $X\setminus U$;
- **lc** if $a(E)\ge-1$ for all $E$;
- **$\epsilon$-lc** if $A(E)\ge\epsilon$ for all $E$.

Terminal implies canonical implies klt implies plt implies dlt implies lc. If $\lfloor\Delta\rfloor=0$, klt, plt and dlt agree. A **non-klt centre** (lc centre) is the centre of an $E$ with $a(E)\le-1$.

**Log resolutions.** A **log resolution** of $(X,\Delta)$ is a projective birational $f:Y\to X$ with $Y$ smooth, $\mathrm{Exc}(f)$ a divisor, and $\mathrm{Exc}(f)\cup f^{-1}_*\mathrm{Supp}\,\Delta$ a simple normal crossing divisor. Hironaka (1964) proved existence in characteristic 0. With one log resolution, the classes are decided by finitely many coefficients: for example $(X,\Delta)$ is klt if and only if all coefficients of $\Delta_Y$ on one log resolution are $<1$ (KM98 2.32). **This finite test needs a log resolution, and it is the shared hypothesis with spec 2161** (06.1, `HasLogResolution`).

**Invariants.**
- The **minimal log discrepancy** at a point $x$ is $\mathrm{mld}(x;X,\Delta)=\inf\{A_{X,\Delta}(E):c_X(E)=\bar x\}$. For lc pairs $\mathrm{mld}\ge0$, and it is $-\infty$ otherwise. For a smooth point $x$ of $X$ of codimension $d$ with $\Delta=0$, $\mathrm{mld}=d$.
- The **log canonical threshold** of an effective $\mathbb{R}$-Cartier $D$ is $\mathrm{lct}(X,\Delta;D)=\sup\{t\ge0:(X,\Delta+tD)\text{ is lc}\}$.

**Example 3.4.** The cone over a rational normal curve of degree $m$ is $\frac1m(1,1)$. One blow-up gives a resolution with exceptional curve $E\cong\mathbb{P}^1$, $E^2=-m$, and $a(E)=-1+\frac2m$. So it is terminal never (surfaces with terminal singularities are smooth), canonical if $m\le2$, and klt for all $m$. The cone over a smooth plane cubic has $a(E)=-1$: it is lc and not klt. These are the running examples of Volume P6 and Volume 4 (11).

## 3.3 Positivity and the cone of curves

Let $X$ be proper over $k$ (or projective over $U$). For a Cartier divisor $D$ and an integral proper curve $C\subseteq X$, the **intersection number** is $D\cdot C=\deg_C(\mathcal{O}_X(D)|_C)$. It extends linearly to $\mathbb{R}$-Cartier divisors and to 1-cycles.
- $D\equiv D'$ (**numerical equivalence**) if $D\cdot C=D'\cdot C$ for all $C$. $N^1(X)=\{\mathbb{R}\text{-Cartier divisors}\}/\equiv$ and $N_1(X)=\{\text{1-cycles}\}/\equiv$ are dual finite dimensional real vector spaces. $\rho(X)=\dim N^1(X)$ is the **Picard number**. Finite dimension needs the theorem of the base (Néron-Severi), which is not in Mathlib (05.1).
- $\overline{NE}(X)\subseteq N_1(X)$ is the closure of the cone spanned by classes of curves. In Lean it is a `PointedCone ℝ (N₁ X)` (06.1).
- $D$ is **nef** if $D\cdot C\ge0$ for all $C$. $D$ is **ample** if some multiple is very ample. **Kleiman's criterion**: for projective $X$, $D$ is ample if and only if $D$ is positive on $\overline{NE}(X)\setminus\{0\}$.
- $\kappa(X,D)$, the **Iitaka dimension**, is the maximum of $\dim\phi_{|mD|}(X)$, or $-\infty$ if $|mD|=\emptyset$ for all $m>0$. $D$ is **big** if $\kappa(X,D)=\dim X$. $D$ is **pseudo-effective** if its class is a limit of classes of effective divisors. $D$ is **semiample** if $|mD|$ is base point free for some $m>0$.
- $\nu(X,D)$ is the **numerical dimension**: for nef $D$, the largest $d$ with $D^d\cdot H^{n-d}\ne0$. For pseudo-effective $D$ there are several versions; the project uses Nakayama's $\kappa_\sigma$ and states which one in each statement (06.5, risk 4).

Always $\kappa(X,D)\le\nu(X,D)$ for nef $D$. Semiample implies $\kappa=\nu$. For nef $K_X+\Delta$ of an lc pair, abundance (3.8) says the converse.

## 3.4 The foundational theorems

These are the theorems of KM98 Chapters 2 and 3 and of Fujino 0909.4445 for lc pairs. They are the first layer that the project must have (tier T2 of 07).

**Theorem 3.5 (Kawamata-Viehweg vanishing).** Let $(X,\Delta)$ be klt, $\pi:X\to U$ projective, $N$ a $\mathbb{Q}$-Cartier Weil divisor with $N\equiv_U K_X+\Delta+M$, $M$ $\pi$-nef and $\pi$-big. Then $R^i\pi_*\mathcal{O}_X(N)=0$ for $i>0$ (KM98 2.70). The proof uses Kodaira vanishing, which uses Hodge theory or a reduction to characteristic $p$ (Deligne-Illusie). For lc pairs the replacement is Kollár's injectivity and torsion-freeness, and Ambro's and Fujino's quasi-log theory.

**Theorem 3.6 (Cone theorem).** Let $(X,\Delta)$ be a projective klt pair (or lc, Fujino 2011). There are countably many rational curves $C_j$ with $0<-(K_X+\Delta)\cdot C_j\le2\dim X$ such that
$$\overline{NE}(X)=\overline{NE}(X)_{K_X+\Delta\ge0}+\sum_j\mathbb{R}_{\ge0}[C_j],$$
and for every ample $H$ and $\epsilon>0$ only finitely many $C_j$ are needed outside $\overline{NE}(X)_{K_X+\Delta+\epsilon H\ge0}$. The rays $R_j=\mathbb{R}_{\ge0}[C_j]$ are the **$(K_X+\Delta)$-negative extremal rays**.

**Theorem 3.7 (Contraction, rationality, base point free).** For each $(K_X+\Delta)$-negative extremal face $F$ there is a unique morphism $\mathrm{cont}_F:X\to Z$ onto a normal projective $Z$ with connected fibres ($\mathcal{O}_Z=(\mathrm{cont}_F)_*\mathcal{O}_X$) that contracts exactly the curves with class in $F$. A line bundle $L$ with $L\cdot F=0$ is a pullback from $Z$. The proof goes through the base point free theorem (nef $D$ with $aD-(K+\Delta)$ nef and big is semiample) and the rationality theorem (the nef threshold $r$ is rational with denominator at most $a(\dim X+1)$). Both rest on vanishing and Shokurov's non-vanishing.

**Bend and break.** Mori's theorem gives the rational curves of 3.6 for smooth $X$: through every point of a curve $C$ with $-K_X\cdot C>0$ there is a rational curve $L$ with $-K_X\cdot L\le\dim X+1$. The proof reduces to characteristic $p$ and uses Frobenius. Jovinelly-Lehmann-Riedl (2509.08065) give optimal bounds [P]. The rational curves are needed only for the length bound. The project's first cone theorem (toric, 3.13) does not need them.

## 3.5 Contractions, flips and the program

Let $(X,\Delta)$ be $\mathbb{Q}$-factorial klt and $R$ a $(K_X+\Delta)$-negative extremal ray, $f=\mathrm{cont}_R:X\to Z$. Then $\rho(X/Z)=1$ and $-(K_X+\Delta)$ is $f$-ample. There are three cases.
1. **Divisorial**: $\mathrm{Exc}(f)$ is a prime divisor. Then $Z$ is $\mathbb{Q}$-factorial and $(Z,f_*\Delta)$ is klt. Replace $X$ by $Z$.
2. **Small** (flipping): $\mathrm{Exc}(f)$ has codimension at least 2. Then $K_Z+f_*\Delta$ is not $\mathbb{R}$-Cartier. The program needs a **flip**: a small projective $f^+:X^+\to Z$ with $K_{X^+}+\Delta^+$ $f^+$-ample. If it exists, it is unique:
$$X^+=\mathrm{Proj}_Z\bigoplus_{m\ge0}f_*\mathcal{O}_X(\lfloor m(K_X+\Delta)\rfloor),$$
so existence is the finite generation of this $\mathcal{O}_Z$-algebra. Replace $X$ by $X^+$.
3. **Fibre type**: $\dim Z<\dim X$. Then $f$ is a **Mori fibre space**, and the program stops.

If $K_X+\Delta$ is nef, $X$ is a **minimal model**, and the program stops. A sequence of these steps is an **MMP**. Each step is $(K+\Delta)$-negative, so discrepancies do not decrease, and they increase for some divisor at each flip (KM98 3.38). Divisorial contractions lower $\rho$, so only finitely many occur. The open question is whether flips can go on for ever.

**MMP with scaling** (BCHM 3.10). Fix $C\ge0$ with $(X,\Delta+C)$ klt and $K_X+\Delta+C$ nef. At step $i$ let $\lambda_i=\inf\{t\ge0:K_{X_i}+\Delta_i+tC_i\text{ nef}\}$, and contract a ray $R$ with $(K_{X_i}+\Delta_i)\cdot R<0$ and $(K_{X_i}+\Delta_i+\lambda_iC_i)\cdot R=0$. Then $\lambda_i$ does not increase. This choice is the one that BCHM can prove terminates.

**Definition 3.8 (Models, BCHM 3.6).** Let $\phi:X\dashrightarrow Y$ be a birational contraction (no divisor on $Y$ is exceptional over $X$), $\Delta_Y=\phi_*\Delta$.
- **Weak lc model**: $K_Y+\Delta_Y$ nef and $a(F,X,\Delta)\le a(F,Y,\Delta_Y)$ for each $\phi$-exceptional $F$.
- **Log terminal model** (minimal model): a weak lc model, $Y$ $\mathbb{Q}$-factorial dlt, with strict inequality.
- **Good minimal model**: a minimal model with $K_Y+\Delta_Y$ semiample.
- **lc model**: a weak lc model with $K_Y+\Delta_Y$ ample. It is unique. If $K_X+\Delta$ is big, it is $\mathrm{Proj}\,R(X,K_X+\Delta)$.
- **Mori fibre space** output: $g:Y\to W$ with $\rho(Y/W)=1$, $\dim W<\dim Y$, $-(K_Y+\Delta_Y)$ $g$-ample, $\phi$ $(K+\Delta)$-negative.

**Example 3.9.**
- Blow up a point of $\mathbb{P}^2$: $X=\mathrm{Bl}_p\mathbb{P}^2=\mathbb{F}_1$. Its cone has two rays, the exceptional curve $E$ ($K\cdot E=-1$) and a fibre $F$ ($K\cdot F=-2$). Contracting $E$ gives $\mathbb{P}^2$, a Mori fibre space over a point. Contracting $F$ gives $\mathbb{F}_1\to\mathbb{P}^1$, a Mori fibre space over a curve. Two outputs from one start: this is the Sarkisov program (3.10).
- The Atiyah flop: the cone over $\mathbb{P}^1\times\mathbb{P}^1$ has two small resolutions, joined by a flop. Francia's flip is the first $K$-negative example in dimension 3. Both are toric, and they are the first test cases of R3 (04.4).

## 3.6 BCHM

**Theorem 3.10 (BCHM, math/0610203, Thm. 1.2) [P].** Let $\pi:X\to U$ be projective and $(X,\Delta)$ klt. Assume either $\Delta$ is $\pi$-big and $K_X+\Delta$ is $\pi$-pseudo-effective, or $K_X+\Delta$ is $\pi$-big. Then:
1. $(X,\Delta)$ has a log terminal model over $U$;
2. if $K_X+\Delta$ is $\pi$-big, it has an lc model over $U$;
3. if $K_X+\Delta$ is $\mathbb{Q}$-Cartier, $R(\pi,K_X+\Delta)=\bigoplus_m\pi_*\mathcal{O}_X(\lfloor m(K_X+\Delta)\rfloor)$ is finitely generated.

**Corollaries [P].**
- Klt flips exist in all dimensions (1.4.1).
- The MMP with scaling of an ample divisor terminates if $\Delta$ is big (1.4.2). If $K_X+\Delta$ is not pseudo-effective, it ends with a Mori fibre space (1.3.2). BCHM say that they do not prove termination of every sequence of flips.
- The canonical ring of a smooth projective variety is finitely generated (1.1.2, with Fujino-Mori). Siu gave an analytic proof (math/0610740) [P].
- A $\mathbb{Q}$-factorial variety of Fano type is a Mori dream space (1.3.1).

**The induction.** The proof is a simultaneous induction on $n=\dim X$ over six statements:
- $A_n$: pl flips exist;
- $B_n$: special finiteness of models near $\lfloor\Delta\rfloor$;
- $C_n$: log terminal models exist for klt $(X,\Delta)$ with $\Delta$ big and $K+\Delta\sim_\mathbb{R}D\ge0$;
- $D_n$: non-vanishing for klt $(X,\Delta)$ with $\Delta$ big and $K+\Delta$ pseudo-effective;
- $E_n$: finiteness of models over a rational polytope of boundaries;
- $F_n$: finite generation over Shokurov polytopes.

The arrows are $F_{n-1}\Rightarrow A_n$, $E_{n-1}\Rightarrow B_n$, $A_n+B_n\Rightarrow C_n$, $D_{n-1}+B_n+C_n\Rightarrow D_n$, $C_n+D_n\Rightarrow E_n$, $C_n+D_n+E_n\Rightarrow F_n$ [P]. The heavy inputs enter at two places: vanishing (3.5) and the extension theorems of Hacon-McKernan (after Siu and Kawamata). In Lean the induction is one theorem `bchm (n : ℕ) : A n ∧ B n ∧ C n ∧ D n ∧ E n ∧ F n` by strong induction, with vanishing and extension as named hypotheses in the first pass (06.2, statement S31).

**Other proofs.** Cascini-Lazić (1009.3188) and Corti-Lazić (1005.0614) prove finite generation without running an MMP, by induction and Diophantine approximation [P]. This proof is shorter on paper and is a candidate for the formal route (04.6, R5).

**Beyond klt.** Lc flips exist (Birkar 1104.4981, Hacon-Xu 1105.1169) [P]. Klt NQC generalized flips exist (Hacon-Liu 2105.13590) [P]. All lc generalized flips are claimed (Hu-Liu 2603.03817) [P]. Finite generation fails for generalized pairs (Liu-Wang 2608.03258) [P].

## 3.7 Termination

**Conjecture 3.11 (T(n)).** Let $(X,\Delta)$ be an lc pair of dimension $n$. There is no infinite sequence of $(K_X+\Delta)$-flips.

Known (01.2):
- $n\le3$: all lc pairs (Shokurov, Kawamata, KMM; Han-Liu 2209.13122 give a proof by ACC for 3-fold mlds) [P][U].
- $n=4$: terminal (KMM), canonical (Fujino), $\kappa\ge2$ (Birkar), pseudo-effective lc (Moraga, Chen-Tsakanikas) [P][S]. The full case is claimed by OpenAI 056 and formalized in AxiomMath/MMP (C1).
- With scaling and big boundary: BCHM 1.4.2 in all dimensions [P].
- Every MMP with big boundary or big $K+\Delta$: $n\le5$ (HLZ 2509.01501), all $n$ claimed (Hashizume 2609.33679) [P].

**Special termination.** Every MMP for a dlt pair is an isomorphism near $\lfloor\Delta\rfloor$ after finitely many steps. This follows from T(n-1) (Fujino for dlt, Lazić-Moraga-Tsakanikas 2007.06458 for lc) [P][U]. So T(n-1) reduces T(n) to flips that avoid the reduced boundary.

**The Shokurov reduction.** Let $\mathrm{mld}$ satisfy ACC (3.9) and LSC in dimension $n$. Then T(n) holds (Shokurov 2004) [U]. The idea is abstract: along a sequence of flips $X_i\dashrightarrow X_{i+1}$ the mlds of the flipping loci form a sequence in an ACC set that cannot decrease for ever. Target #27 of report D asks for this as a Lean lemma over an axiomatic flip sequence (04.5, O-R4-1).

**Effective termination.** HLZ give explicit bounds on the number of flips for general type 4-folds. Han-Qi-Zhuang (2506.20183) show that in a general type MMP the mlds take finitely many values [P].

## 3.8 Abundance and non-vanishing

**Conjecture 3.12 (Log abundance).** Let $(X,\Delta)$ be a projective lc pair with $K_X+\Delta$ nef. Then $K_X+\Delta$ is semiample.

**Conjecture 3.13 (Non-vanishing).** Let $(X,\Delta)$ be a projective lc pair with $K_X+\Delta$ pseudo-effective. Then $\kappa(X,K_X+\Delta)\ge0$.

**Conjecture 3.14 (Minimal models).** Every projective lc pair with $K_X+\Delta$ pseudo-effective has a minimal model. Birkar (0907.4170) shows that weak non-vanishing implies it [P].

Equivalences and reductions [P][U]:
- Abundance with the MMP is equivalent to: every lc pair has a good minimal model or a Mori fibre space (Gongyo-Lehmann, Lai, as cited by J. Liu).
- Non-vanishing reduces to smooth $X$ with $\Delta=0$ (Hashizume 1609.00121) [P]. So the core case is: a smooth projective non-uniruled $X$ has $\kappa(X)\ge0$.
- Non-vanishing in dimension $d$ implies abundance for $\nu\le1$ in dimension $d$ (Liu-Xu 2505.05250) [P].
- Kawamata: if $K_X$ is nef and $\kappa=\nu$, $K_X$ is semiample.

Known: $\dim\le3$ (Miyaoka, Kawamata, KMM); $K+\Delta$ big (BCHM with base point freeness); $\nu=0$ (Nakayama, Gongyo); 4-folds with $\kappa>0$ [S]. Open: 4-folds with $\kappa=0$ or $\kappa=-\infty$.

**Generalized abundance** (Lazić-Peternell). If $(X,\Delta)$ is klt, $K_X+\Delta$ pseudo-effective, $L$ nef and $K_X+\Delta+L$ nef, then $K_X+\Delta+L$ is numerically equivalent to a semiample divisor, in some versions with more hypotheses [P][U].

**The Iitaka conjecture $C_{n,m}$.** For an algebraic fibre space $f:X\to Y$ of smooth projective varieties with general fibre $F$, $\kappa(X)\ge\kappa(F)+\kappa(Y)$. It follows from a good minimal model of $F$ (Kawamata) [U].

## 3.9 Boundedness and invariants of singularities

**ACC.** A set $I\subseteq\mathbb{R}$ satisfies **ACC** (DCC) if it has no infinite strictly increasing (decreasing) sequence.

**Theorem 3.15 (ACC for lct, HMX 1208.4150) [P].** For fixed $n$ and DCC sets $I,J$, the set of $\mathrm{lct}(X,\Delta;M)$ with $\dim X=n$, coefficients of $\Delta$ in $I$ and of $M$ in $J$, satisfies ACC.

**Conjecture 3.16 (ACC for mld, Shokurov).** For fixed $n$ and a DCC set $I$, the set of $\mathrm{mld}(x;X,\Delta)$ with $\dim X=n$ and coefficients in $I$ satisfies ACC. Open in dimension 3.

**Conjecture 3.17 (LSC, Ambro).** $x\mapsto\mathrm{mld}(x;X,\Delta)$ is lower semicontinuous on the scheme points of $X$. Open in dimension $\ge4$ in general (Landi's claim of a full proof was withdrawn, C16).

**Conjecture 3.18 (Shokurov).** $\mathrm{mld}(x;X,\Delta)\le\dim X$, with equality only at smooth points with $\Delta=0$ near $x$.

**Theorem 3.19 (BAB, Birkar 1609.05543) [P].** For fixed $n$ and $\epsilon>0$, the $\epsilon$-lc Fano varieties of dimension $n$ form a bounded family. **Complements** are bounded (Birkar 1603.05765) [P].

**Calabi-Yau.** Boundedness of CY 3-folds (up to birational equivalence or deformation) is open. The **index conjecture** says the index of $K_X+\Delta$ for a klt log CY pair with coefficients in a fixed finite set is bounded; it is open in dimension $\ge4$ [S].

**Example 3.20 (Optimal constants).** A smooth projective 3-fold of general type has $\mathrm{vol}(K_X)\ge1/1680$ (J. A. Chen and M. Chen) [S]. Bie-Du-Yu claim $\mathrm{vol}\ge1/420$ for smooth 3-folds, and show where the minimum is reached (C12) [P]. The proofs reduce to a finite search over baskets of terminal singularities and Riemann-Roch. They are the lab experiments E1 and E2 (13).

## 3.10 Moduli, the Sarkisov program and the cone conjecture

- **KSBA moduli.** Stable pairs (slc, $K+\Delta$ ample) form a proper moduli space with projective coarse space in characteristic 0 (Kollár 2023) [S]. The MMP gives the stable limit: run the MMP on a semistable model and take the lc model.
- **K-moduli.** K-semistable Fano varieties of fixed dimension and volume form an Artin stack of finite type with a projective good moduli space that parametrizes the K-polystable ones (LXZ 2102.09405 and many papers before it) [P]. Boundedness (Jiang) uses BAB.
- **Sarkisov program.** Two Mori fibre spaces from one klt pair are joined by a finite chain of links of types I to IV (Hacon-McKernan 0905.0946) [P]. The **strong** form, with a decreasing Sarkisov degree, is known in dimension 4 (He 2311.08750) and claimed in all dimensions (Hashizume Cor. 1.7) [P].
- **Cone conjecture (Kawamata-Morrison).** For a klt CY pair, $\mathrm{Aut}(X)$ acts on the effective nef cone with a rational polyhedral fundamental domain, and the same for the movable cone and birational automorphisms. Known for surfaces (Totaro) and many classes. "Wide open" for CY 3-folds in general [S].
- **Mori dream spaces** (Hu-Keel): $X$ is a Mori dream space if and only if its Cox ring is finitely generated. On a Mori dream space every MMP of every divisor runs and terminates. Toric varieties are the first example (3.13).

## 3.11 The reduction graph

The graph has an arrow $A\to B$ when $A$ implies $B$ in the literature. It is the backbone of the map (08.2): each arrow becomes a node of kind `reduction` with its own statement, so that a proof of the arrow is a reusable result. The list follows report D §21. The tag after each arrow is the strength of the source.

| From | To | Source |
|---|---|---|
| ACC(mld, $n$) and LSC(mld, $n$) | T(n) | Shokurov 2004 [U] |
| ACC(enc mld) and T(terminal flips) | T(n) | Han-Liu 2209.13122 [P] |
| Han-Liu Conj. 1.9(2') in dim 4 | T(4) for lc flips | Han-Liu [P] |
| ACC(lct) and T(n-1) | T(n) for $\kappa(K+\Delta)\ge0$ | Birkar 2007 [S] |
| T(n-1) | special termination in dim $n$ | Fujino; LMT [P][U] |
| HQZ uniform index bound | T for general type, dim $\le5$ | HLZ [P] |
| HLZ (dim $\le5$) | T for big boundary, all $n$ | Hashizume [P] |
| Hashizume Thm. 1.1 and He (dim 4) | strong Sarkisov, all $n$ | Hashizume [P] |
| existence of minimal models | termination with scaling (and back), lc generalized pairs | Hu-Liu [S] |
| weak non-vanishing | existence of minimal models | Birkar 0907.4170 [P] |
| non-vanishing($d$) | abundance for $\nu\le1$ in dim $d$ | Liu-Xu [P] |
| non-vanishing for smooth $X$ in dim $d$ | abundance for lc pairs in dim $\le d$ | J. Liu 2610.35913 [P] |
| non-vanishing($n-1$) | non-vanishing for uniruled lc pairs in dim $n$ | Lazić-Meng [P] |
| good minimal model of $F$ | $C_{n,m}$ | Kawamata [U] |
| generalized abundance | log Iitaka | Fujino 1406.2759 [S] |
| b-semiampleness | adjunction to all lc centres, Shokurov GLC | BFMT [P] |
| relative cone conjecture and birational boundedness | boundedness of elliptic CY | FHS; Filipazzi-Xu [S][P] |
| T(n) and abundance(n) | MMP algorithms in dim $n$ (Yasuda type) | inferred from 2603.13703 [U] |

Three facts about the graph shape the routes of 04:
1. **Termination has three entrances**: ACC and LSC for mlds (R4), bigness (Hashizume, R1), and the 4-fold proof in Lean (R2).
2. **Abundance has one main entrance**: non-vanishing. Every conditional abundance result goes through it (R5).
3. **Many arrows are abstract.** The Shokurov reduction, Liu-Xu and Birkar's reduction are statements of the form "hypothesis in dim $d$ implies conclusion in dim $d$". They can be stated and some can be proved in Lean before the hypotheses are known (04.5, 06.2).

## 3.12 Other settings

**Characteristic $p$** (B §1). Four tools fail or weaken: resolution in dimension $\ge4$, Kawamata-Viehweg vanishing, the char 0 proof of flips, and generic smoothness. The replacements are Frobenius methods: $F$-singularities, $F$-splitting, and the Hacon-Xu construction of 3-fold flips via $S$-adjunction. The 3-fold lc MMP holds for $p\ge5$. Abundance for lc 3-folds holds for $p>42$ (BWX 2610.10439) [P]. The 4-fold MMP needs log resolutions, which are the subject of spec 2161 [P].

**Mixed characteristic** (B §2). The MMP holds for arithmetic 3-folds over excellent Dedekind bases with residue characteristics 0 or $>5$ (BMPSTWW, Publ. IHES 2023). Its tool is the perfectoid replacement of vanishing (André's flatness lemma, Bhatt's theorem on $R^+$) [P].

**Kähler** (B §3). Projectivity is replaced by compact Kähler classes, the cone of curves by the cone of positive closed currents, and ampleness by Kähler classes. Kähler 3-folds are complete. Big gklt pairs have an MMP in all dimensions (C11) [P].

**Foliations** (B §4). For a foliation $\mathcal{F}\subseteq T_X$, the canonical class $K_\mathcal{F}$ plays the role of $K_X$. The cone theorem holds for rank 1 and for algebraically integrable foliations. The MMP holds for surfaces, for 3-folds, and for algebraically integrable foliations in all dimensions [P]. In characteristic $p$ it fails (Bernasconi) [P].

## 3.13 The toric MMP

This section is the mathematics of route R3 (04.4), the project's first full proof. The sources are Reid, "Decomposition of toric morphisms" (1983), Matsuki's book (2002, Ch. 14), Fujino-Sato (Michigan Math. J. 2004), and Cox-Little-Schenck, "Toric Varieties" (2011, Ch. 15) [U, to check in S0].

Let $N\cong\mathbb{Z}^n$ and $\Sigma$ a fan in $N_\mathbb{R}$, $X_\Sigma$ its toric variety. Torus-invariant prime divisors $D_\rho$ correspond to rays $\rho$, with primitive generators $u_\rho$. Torus-invariant curves $C_\tau$ correspond to walls $\tau$ (cones of dimension $n-1$).

1. **Divisors.** A torus-invariant $\mathbb{Q}$-divisor $D=\sum a_\rho D_\rho$ is $\mathbb{Q}$-Cartier if for each maximal cone $\sigma$ there is $m_\sigma\in M_\mathbb{Q}$ with $\langle m_\sigma,u_\rho\rangle=-a_\rho$ for $\rho\in\sigma$. $X_\Sigma$ is $\mathbb{Q}$-factorial if and only if $\Sigma$ is simplicial. $K_X=-\sum_\rho D_\rho$.
2. **Intersection numbers.** For a wall $\tau=\sigma\cap\sigma'$ in a simplicial fan, $D\cdot C_\tau$ is computed from the linear relation among $u_\rho$ for $\rho\in\sigma\cup\sigma'$ (the **wall relation**). This is finite linear algebra over $\mathbb{Q}$.
3. **Cone theorem.** For complete simplicial $\Sigma$, $\overline{NE}(X_\Sigma)=NE(X_\Sigma)$ is the rational polyhedral cone generated by the classes $[C_\tau]$ of the walls (Reid) [U]. There is no need for bend and break or vanishing.
4. **Contractions.** An extremal ray $R$ gives a contraction to a toric variety $X_{\Sigma_R}$, where $\Sigma_R$ is obtained by removing the walls $\tau$ with $[C_\tau]\in R$. It is divisorial, small or of fibre type according to the signs in the wall relation (Reid) [U].
5. **Flips.** For a small contraction, the flip is the fan obtained by the other subdivision of the same cones (a bistellar operation). It always exists in the toric world, for any $\mathbb{Q}$-Cartier $D$ (Reid) [U].
6. **Termination.** Every sequence of toric $D$-flips for simplicial fans terminates [U; the argument and its exact scope are a recheck item, Q-12].
7. **Singularities.** For a $\mathbb{Q}$-Gorenstein cone $\sigma$ and $\Delta=\sum d_\rho D_\rho$, the log discrepancy of the divisor of a primitive $v\in\sigma^\circ\cap N$ is $\langle m_\sigma,v\rangle$, where $\langle m_\sigma,u_\rho\rangle=1-d_\rho$. So $\mathrm{mld}$ at the torus-fixed point is the minimum of a linear function over the lattice points of a cone: a finite computation. Ambro proved ACC for toric mlds [S].

**Why this route.** Every step is convex geometry over $\mathbb{Q}$ and $\mathbb{Z}^n$. Mathlib has `PointedCone`, faces, duals and simplicial cones (01.11). No Lean project has fans or a toric MMP (01.12). The toric world is also where every abstract statement of 06 gets its positive and negative instances (F2, F3 of 06.3). The link from fans to schemes ($X_\Sigma$ as a Mathlib `Scheme`) is a second step that needs Mathlib's `Spec` of semigroup algebras and gluing; it is 15k to 30k lines (E §7) and is milestone S6 work (15).

## 3.14 Consequences for the project

1. **Every statement names its hypotheses.** The class of pair, the coefficient field, absolute or relative, $\mathbb{Q}$-factorial or not, and the base field appear in the name or the signature (06.2). Most errors in this field come from a dropped hypothesis.
2. **Log resolutions are a hypothesis, not a theorem.** Discrepancies are defined by valuations, and the classes are tested on all divisorial valuations. The finite test on one log resolution is a theorem under `HasLogResolution`, shared with spec 2161.
3. **The finite dimension of $N^1$ is a hypothesis in the first pass.** The theorem of the base is far from Mathlib. Statements carry `FiniteDimensional ℝ (N¹ X)` until a proof exists, or they work on toric or surface instances where it is proved.
4. **The toric MMP comes first** because it needs neither vanishing nor resolution nor Néron-Severi (3.13).
5. **The reduction arrows are separate results.** They are proved once and reused by every route that passes through them (3.11).
6. **Other settings are separate families.** Characteristic $p$, mixed characteristic, Kähler and foliations get their own statements with their own vocabulary, not a parameter on the char 0 statements (06.2).
