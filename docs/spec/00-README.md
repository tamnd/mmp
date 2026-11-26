# Spec 2161mmp: the minimal model program

The minimal model program in Lean, in public: the statements, the known theory, the open parts as research bets, and a handbook that takes a student from first algebra to the 2026 frontier.

Written 2026-11-26. This is a research and design spec. It follows spec 2161 (singularity) and spec 2161l (Langlands) in its form and its tools. The research behind it is in `research/sources/` (reports A to G, about 530 KB, index in `research/00-index.md`).

## The project in one paragraph

Four repositories:
- `tamnd/mmp`: the map of nodes, the paper and claim records, the audit records, the lab specs, the trust records and the site sources;
- `tamnd/mmp-lean`: the Lean package `MinimalModel`;
- `tamnd/mmp-agent`: `mmp`, the toolchain and the model roles;
- `tamnd/mmp-handbook`: a textbook series in two parts, the prerequisites (Volumes P0 to P8) and the MMP (Volumes 0 to 17), as PDF and EPUB.

Together they work toward six levels of success (02.3):
- G1: state the program in Lean (60 statements, 06.2);
- G2: prove the toric MMP and the first surface results on Mathlib alone, and audit AxiomMath/MMP;
- G3: formalize the known theory of tiers T1 to T9 (07), and write the handbook;
- G4: check fresh claims, including the 4-fold termination proof of AxiomMath/MMP, and find new partial results;
- G5 and G6: the open conjectures themselves.

Everything is published at https://mmp.tamnd.com. The request was to solve all open problems of the MMP. No one can promise that. Termination and abundance have been open in dimension 4 and higher for forty years. The spec reads the request as three commitments: state all of it, prove what is known in an order that leads to the open parts, and work on the open parts in public with honest status (02.4).

## What changed in 2026

1. **An AI-written Lean MMP appeared ten days ago.**
   - AxiomMath/MMP (2026-11-16, Apache-2.0, Lean v4.35.0, about 2.05 million lines) claims the MMP for lc pairs in dimension at most 4, with no `sorry` and no added axiom.
   - No human has reviewed it. Its 4-fold termination step follows an unrefereed OpenAI manuscript.
   - The project treats it as anthropics FLT is treated in spec 2161l: a licensed source to audit, bridge and port, never to reprove (05.2).
2. **A kernel check moves the question to the definitions.** If the definitions of AxiomMath/MMP are faithful and two kernels accept it, termination for lc 4-folds with rational boundary is proved. Route R2 is this audit (04.3). It is the most likely way for the project to help close an open problem in its first year.
3. **Termination with a big boundary is claimed in all dimensions.** Hashizume (2609.33679) claims it, with drafts by ChatGPT and Codex. Han-Liu-Zhuang (2509.01501) proved dimension at most 5. Full termination is open from dimension 5.
4. **Abundance is still open in dimension 4.** The open cases are $\kappa=0$ and $\kappa=-\infty$. Non-vanishing is the central problem. OpenAI family 034 claims log abundance in all dimensions, with no Lean proof.
5. **One conjecture fell.** Ajit (2610.09270) disproved the Ambro-Kawamata effective non-vanishing conjecture in dimension at least 4. The counterexample is explicit and fits a Lean check (04.2, 13).
6. **Fresh claims arrive faster than people can check them.** OpenAI released 722 unrefereed manuscripts on 2026-10-06, more than a dozen of them in birational geometry. Many human preprints of 2026 also use AI drafts. Route R1 checks such claims in Lean (04.2).

## The documents

| Doc | Title | Read it for |
|---|---|---|
| [01](01-research-2026.md) | The state of the field, November 2026 | the sourced literature: what is proved, claimed and open; each setting; Lean; AI systems; books |
| [02](02-the-goal.md) | The goal | the levels G1 to G6, the meaning of "all", non-goals, what would show the plan is wrong |
| [03](03-the-program.md) | The minimal model program, mathematically | pairs, the cone theorem, flips, BCHM, termination, abundance, boundedness, moduli, other settings; the reduction graph |
| [04](04-routes.md) | The open targets and the routes | routes R1 to R9, their targets O-Rk-n, first nodes and weights; Target T |
| [05](05-the-base.md) | The base | Mathlib at the pin, AxiomMath/MMP and Stacks, TauCeti, the sibling projects, the porting rule, the first port |
| [06](06-lean-statements.md) | The Lean statements and how to trust them | the vocabulary, the 60 statements, the fidelity battery F1 to F7, the bridges, the risks, the claim policy |
| [07](07-corpus.md) | The corpus | the sources in tiers T0 to T11, the watch list, the paper and claim records |
| [08](08-architecture.md) | Architecture | the repositories, the map, the six flows |
| [09](09-mmp-lean.md) | `tamnd/mmp-lean` | layout, Lean rules, toolchain pin, the bridge package, CI, upstreaming |
| [10](10-mmp-agent.md) | `tamnd/mmp-agent` | `mmp`, the roles, the queue, the audit role, budgets, evaluation |
| [11](11-mmp-handbook.md) | The handbook | Volumes P0 to P8 and 0 to 17, the six-part section, exercises, `mhb` |
| [12](12-site.md) | The site | pages, doors (`/learn/`, `/teach/`, `/claims/`, `/audit/`), rules, the Worker |
| [13](13-computation-lab.md) | The computation lab | tools, specs, experiments E1 to E10, certificates |
| [14](14-trust.md) | Trust | rows Q0 to Q10, the top theorems, the audit of external Lean, threats, disclosure |
| [15](15-milestones.md) | Milestones | S0 (2026-12-20) to S9, exit criteria, risks |
| [16](16-open-questions.md) | Open questions | Q-01 to Q-24, and the questions for experts |
| [research/](research/00-index.md) | The research reports | A core MMP, B other settings, C boundedness and moduli, D open problems, E Lean, F curriculum, G prerequisites |

**Reading order.**
- Mathematicians: 03, 04, 01, 06, 07.
- Engineers: 02, 05, 08, 09, 10, 14, 15.
- Students and teachers: 11, 12, then 03.
- Everyone: 16.

## Decisions made in this spec

1. **Graded levels, not a promise.** The open conjectures are research bets with weights (02, 04). The project reports progress on each level separately.
2. **Audit, do not reprove.** AxiomMath/MMP is the largest Lean source in the field. The project audits its definitions, replays it in two kernels, and bridges its theorems to the project's statements in a separate package. It does not rewrite it (05.2, 04.3).
3. **The toric MMP is the first full proof.** It needs only convex geometry, it is new in Lean, and it is not a copy of AI-written code (04.4).
4. **Statements first, with their standard hypotheses visible.** Every MMP statement names its pair class (klt, lc, dlt), its coefficients ($\mathbb{Q}$ or $\mathbb{R}$), its base (absolute or over $U$) and its field. A statement with a hidden or missing hypothesis is a fidelity failure (06.5).
5. **The pin is Lean v4.35.0 with the Mathlib tag v4.35.0 (`56a005855e`),** the same pin as AxiomMath/MMP, singularity-lean and langlands-lean. Monthly bumps follow (09.3).
6. **The Lean root is `MinimalModel`, not `MMP`.** AxiomMath/MMP owns the module root `MMP`. Two roots with that name cannot share a workspace (09.1).
7. **Port, do not depend, in the main library.** The main library builds on Mathlib alone. The AxiomMath/MMP dependency lives only in the package `MinimalModelBridge` (09.4).
8. **Hypotheses, not axioms.** A published theorem that is not yet proved is a named `Prop` with its own fidelity check (09.2).
9. **Fresh claims are never hypotheses.** They have status `claimed` until experts accept the paper. A check is published only after a letter to the authors and 30 days (14.4). An AI manuscript is a claim, however strong its Lean code, until the audit of route R2 passes.
10. **One shared resolution hypothesis with spec 2161.** Discrepancies need log resolutions. In characteristic $p$ and in dimension at least 4 these are open, and they are the subject of the singularity project. The two projects share one `Prop` for them (04.8, 06.1).
11. **The handbook starts below the MMP.** It has nine prerequisite volumes (P0 to P8, about 4,050 pages) before the eighteen MMP volumes (about 6,220 pages). Each section of an MMP volume has six parts: Statement, Proof in words, Examples, Exercises, Lean, Notes and history (11).
12. **Style.** Text follows ASD-STE100: short sentences, no "we", no em or en dashes.

## The first four weeks (milestone S0, 2026-12-20)

1. Create the four repositories, after the owner confirms. Copy the skeletons of langlands, langlands-lean, langlands-agent and langlands-handbook, with the names of 08.1.
2. Write `MinimalModel/Statements/Basic.lean` (06.1) and the statements of the surface and toric families (06.2). Run F1 to F3.
3. Clone AxiomMath/MMP at `1f9ade3670` on a large machine. Run the first audit steps A1 to A4 of 04.3: a clean build, `#print axioms` on the four main theorems, `lean4checker`, and the definition index.
4. Start `MinimalModel/Toric/Fan.lean` on Mathlib `PointedCone` (04.4, step 1).
5. Copy the site skeleton from langlands-agent. Deploy `/program/`, `/statements/`, `/map/`, `/audit/` and `/trust/` to mmp.tamnd.com.
6. Send the letters:
   - to Axiom, with the audit plan and an offer to share findings first (Q-03);
   - to experts in three groups (Q-05);
   - to the singularity project, about the shared resolution `Prop` (Q-09).

   Register in Palomar (Q-14).
7. Start the `reader` role on the claim records of 01.3, beginning with Ajit 2610.09270 and Hashizume 2609.33679.
