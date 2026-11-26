---
title: Trust
description: The checks that each Lean result of mmp must pass before the project calls it proved, and the state of each check.
lead: A Lean proof is only as good as its statement and its build. These checks say what a reader can trust. A hostile referee must be able to repeat each one.
---
## The rows

Each row has one of four answers: yes, no, open (a person must decide), or not run. A row is "not run" until the trust workflow runs it on a machine of the project. The rows come from `records/trust.json`, which `mmp trust` writes. A person does not edit it.

| Row | Question | Check |
|---|---|---|
| Q0 | Is the source the one that the site describes? | The site build records the commit of mmp-lean, of each port, and of AxiomMath/MMP and AxiomMath/Stacks. The site check refuses a mismatch. |
| Q1 | Does it build? | `lake build` of `MinimalModel`, and of `MinimalModelBridge` for a bridge theorem, at the pinned toolchain, from a clean cache, on a machine of the project. |
| Q2 | Which axioms do the top theorems use? | `#print axioms` and a walk over the constants of each `proved` and `proved-ext` node. Each proof must use only `propext`, `Classical.choice` and `Quot.sound`. |
| Q3 | Do two more kernels accept it? | `lean4checker --fresh` on the modules of the top theorems, then `lake comparator --paranoid`, which replays the export in the independent checkers lean4lean and nanoda. |
| Q4 | Do the proved theorems have the pinned statements? | `lake comparator` against `MinimalModel/Statements/`, with the hash manifest `manifests/statements.sha256`. |
| Q5 | Do the statements mean what the docstrings say? | The fidelity battery F1 to F7. |
| Q6 | Which published theorems are still hypotheses? | The list of the named hypotheses of each top theorem, each with its paper record and the state of its acceptance by experts. |
| Q7 | Has a person read the proof? | The handbook sections of the top theorems at status reviewed, with the names of the reviewers. |
| Q8 | Has someone outside the project reproduced Q1 to Q4? | A link to an independent run. |
| Q9 | For a `proved-ext` theorem: has the external library passed the audit at the pinned commit? | The audit steps A1 to A8 at that commit, with no open finding of severity 1 or 2. The [audit page](/audit/) has the details. |
| Q10 | For a check of a fresh claim: have the authors seen the result, and what did they answer? | The letter and the answer in the claim record. |

Q0 to Q4 are mechanical and run at each release. Q5 to Q10 need people. The site shows the rows for each top theorem separately.

**Two more kernels.** The Lean kernel is the first check. Q3 asks for two more, written by other people in other code: lean4lean (in Lean) and nanoda (in Rust). A model that searches for proofs searches for every path that the checker accepts. A proof that three independent kernels accept does not depend on one such path.

**What the rows do not show.** Q0 to Q4 show that a statement has a proof. They do not show that the statement is the right one. That is Q5 for the statements of the project and Q9 for an external library.

## The fidelity battery

A statement is trusted only after it passes each check below. The results go to `records/fidelity.json`.

| Check | What it does |
|---|---|
| F1. Elaboration | The file builds with the pinned toolchain. It has no `sorry`, `axiom` or `opaque`. `#print axioms` of each statement shows at most the three standard axioms. |
| F2. Positive instances | Known cases follow from the statement, or the statement holds in a known case: the cone theorem on $\mathbb{P}^n$, $\mathbb{F}_n$ and $\mathrm{Bl}_p\mathbb{P}^2$; $\mathrm{mld}=n$ at a smooth point; Francia's toric flip. Each structure of hypotheses, such as `IntersectionData`, gets one instance, so its axioms are consistent. |
| F3. Negative instances | Wrong variants of the statement are proved false or trivial. For example, drop "every" and show that "some program terminates" holds for a trivial program, or drop the condition that a flip is small and build an infinite sequence of steps. |
| F4. Triviality attack | A strong prover gets a budget to prove the statement in a trivial way: with an empty type of programs, a vacuous `IsMaximal`, a cone of curves that is zero, or a quirk of universes. A success is a failed check. |
| F5. Round trip | An independent model translates the Lean statement to English without the docstring. A person compares the result with the docstring and with KM98 or the source paper. |
| F6. Human review | Two birational geometers sign that the Lean statement means what the docstring says. Their names and the dates go into the record. |
| F7. Pinning | The hash of the statement file is in `manifests/statements.sha256`, and `lake comparator` matches each proof to the pinned statement. |

A statement of class theorem or reduction counts for the level G1 after F1 to F5. A statement that a top theorem proves needs F6 too. A statement of class open, claimed or refuted needs all seven checks before any proof of it is announced. For F6 the two reviewers must come from two different research groups. A statement is frozen after F6. A change after F6 starts the battery again.

The audit of AxiomMath/MMP is the same battery on the statements of another library. It runs F1, F2, F3, F4 and F6 on the definitions and the main theorems of AxiomMath/MMP.

## The claim rule

The project does not say that it has proved an open case unless all of these hold: the proof builds; it uses only the three standard axioms; three kernels accept it; the statement passed F1 to F7; and at least two experts who are not paid by the project have read the written proof in the handbook. Before that, the site says which checks the result has passed.

A `proved-ext` node is shown as "proved in AxiomMath/MMP at the commit; audit: the state", never as "proved".

For a fresh claim of route R1 or an audit finding of route R2, the project says only what a Lean check found. It writes to the authors before any page about the check goes public. The page waits 30 days or until the authors answer, whichever comes first. The page uses neutral words. It never says that a paper or a library is wrong.

## Disclosure

Much of the code and the text of the project is written by AI models. Lean and people check it. Each merged pull request that an agent role wrote names the role, the model and the run. Each handbook section names its drafter and its reviewers. Each result that comes from AxiomMath/MMP or from other external code says so, with the state of its audit.
