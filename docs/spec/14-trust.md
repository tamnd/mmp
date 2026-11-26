# 14. Trust

The project will produce a large amount of Lean code, and much of it will be written by models. It will also lean on the largest machine-written proof in the field. AxiomMath/MMP is about 2.05 million lines from an AI system, and no person has reviewed it, by its own README (04.3). The claims of the project must survive a hostile referee. That referee asks two questions:
- whether the project's own proofs are right;
- whether the project has checked what it takes from others.

This document is the trust report that the site shows at `/trust/`, in the form used by singularity and langlands. It is a list of questions, how each one is checked, and the current answer. The answer of each row is one of these:
- **yes**;
- **no**;
- **open**: a person must decide;
- **not run**;
- **n/a**: the row does not apply to this theorem (for example Q9 for a proof in `MinimalModel`).

## 14.1 The questions

| Row | Question | Check | Where |
|---|---|---|---|
| Q0 | Is the source the one that the site describes? | the site build records the commit of `tamnd/mmp-lean`, of each port and of AxiomMath/MMP and AxiomMath/Stacks; `mmp site check` refuses a mismatch | CI |
| Q1 | Does it build? | `lake build` of `MinimalModel` (and of `MinimalModelBridge` for bridge theorems) at the pinned toolchain, from a clean cache, on a machine of the project | `trust` and `bridge` workflows (09.7) |
| Q2 | Which axioms do the top theorems use? | `#print axioms` and the constant walk of `mmp trust` for each `proved` and `proved-ext` node; each must use `propext`, `Classical.choice` and `Quot.sound` only | `trust` workflow |
| Q3 | Do two more kernels accept it? | `lean4checker --fresh` on the modules of the top theorems, then `lake comparator --paranoid`, which replays the export in the independent checkers lean4lean and nanoda | `trust` workflow, weekly; `bridge` workflow for AxiomMath/MMP (audit step A3) |
| Q4 | Do the proved theorems have the pinned statements? | `lake comparator` against `MinimalModel/Statements/`, with the hash manifest `manifests/statements.sha256` (09.6) | `trust` workflow |
| Q5 | Do the statements mean what the docstrings say? | the fidelity battery F1 to F7 of 06.3 | `records/fidelity.json` |
| Q6 | Which published theorems are still hypotheses? | the list of named hypotheses (09.2) used by each top theorem, each with its paper record and its expert status (07.14), shown as in 14.3 | `records/status.json` |
| Q7 | Has a person read the proof? | the handbook sections of the top theorems at status `reviewed`, with names (11.8) | handbook |
| Q8 | Has someone outside the project reproduced Q1 to Q4? | a link to an independent run | by hand |
| Q9 | For a `proved-ext` theorem: has the external library passed the audit at the pinned commit? | the audit steps A1 to A8 of 04.3 at that commit, with no open finding of severity 1 or 2 (14.5) | `audit/axiom-mmp/` |
| Q10 | For a check of a fresh claim: have the authors seen the result, and what did they answer? | the letter and the answer in the claim record (07.14) | `claims/` |

Q0 to Q4 are mechanical and run on every release. Q5 to Q10 need people. The site shows all eleven rows for each top theorem separately. The home page shows the rows of the statements of 06.2.

**Two more kernels.** The Lean kernel is the first check. Q3 asks for two more, written by other people in other code: lean4lean (in Lean) and nanoda (in Rust). The reason is not doubt about Lean in general. A model that searches for proofs searches for every path that the checker accepts. The run of kernel soundness bug reports in July and August 2026 (the "Summer of Soundness Bugs", spec 2161, 01) showed that such paths can exist [S]. A proof that three independent kernels accept, at a toolchain that has the known fixes, does not depend on one of those paths. For AxiomMath/MMP, Q3 is audit step A3, and it is the most expensive mechanical check of the project (09.4, 15).

**What the rows do not show.** Q0 to Q4 show that a statement has a proof. They do not show that the statement is the right one. That is Q5 for the project's statements and Q9 for an external library. Q9 is the reason route R2 exists.

## 14.2 The top theorems and their credit lines

The trust report covers these theorems. More are added as the map grows. Each has a credit line, which the site and the handbook print next to it.

| Theorem | Meaning | Status expected | Credit line | Milestone |
|---|---|---|---|---|
| `MinimalModel.Toric.coneTheorem` | the toric cone theorem | `proved` | the project | S2 |
| `MinimalModel.Toric.flipExists`, `MinimalModel.Toric.terminationOfFlips` | toric flips exist and terminate | `proved` | the project | S4 |
| `MinimalModel.Toric.mmp` (S39) | the toric MMP ends in a minimal model or a Mori fibre space | `proved` | the project | S4 |
| `MinimalModel.Surface.castelnuovo`, `MinimalModel.Surface.minimalModel` | the surface program, on Mathlib alone | `proved` or `proved-mod` | the project | S5 |
| `MinimalModel.shokurovLemma` (O-R4-1) | the abstract termination lemma over an ACC and LSC invariant | `proved` | the project | S3 |
| `MinimalModel.Reductions.hanLiu` (S29) | the Han-Liu reduction, over named hypotheses | `proved-mod` | the project, from Han-Liu (Geom. Topol. 29 (2025)) | S5 |
| `MinimalModelBridge.Surface.*`, `MinimalModelBridge.Threefold.*` (O-R2-2) | the surface and 3-fold programs, through the bridge | `proved-ext` | Axiom (Lean), on the classical literature; bridge and audit by the project | S3 |
| `MinimalModelBridge.Fourfold.terminationLc4Rational` (S22) | termination of every MMP for projective lc 4-folds with rational boundary | `claimed`, then `proved-ext` after the audit | proof by OpenAI (paper) and Axiom (Lean); audit by the project | S3 |
| `MinimalModelBridge.Vanishing.kawamataViehweg` (O-R2-3) | Kawamata-Viehweg vanishing, through the bridge; a named hypothesis in `MinimalModel` | `proved-ext` | Axiom (Lean); bridge by the project | S3 |
| the claim checks of route R1 | each check separately, with Q10 | per claim | "a Lean check of section X of [preprint] by the project" | from S1 |
| Target T (S52, the toric case) | Han-Liu Conj. 1.9(2') for toric enc 4-fold pairs (04.12) | `proved` or `refuted` | the project | S7 |
| the nodes of the open statements of 06.2 | the open conjectures | `open` | the authors of a proof, when there is one | S9 |

The credit line names who did what. It never gives the project credit for a proof it did not write. A bridge theorem is credited to the external authors with the words "bridge and audit by the project".

## 14.3 How hypotheses and external proofs are shown

A theorem with status `proved-mod` or `proved-ext` is not a theorem of Mathlib alone, and the reader must see that at once.

- **`proved-mod`.** The site and the handbook print the list of named hypotheses under the theorem. Each one has its paper, its expert status (07.14) and its own Q5 row. Example: "Lean proof, using the hypotheses `HasLogResolution` (Hironaka 1964; theorem in characteristic 0) and `KawamataViehwegVanishing` (Kawamata 1982, Viehweg 1982; theorem)." A theorem whose hypotheses include a statement that is open in the setting (for example `HasLogResolution` in characteristic $p$ and dimension at least 4) is shown as **conditional**, in words, in the first line.
- **`proved-ext`.** The site and the handbook print the source, the commit, the audit state and the open findings: "proved in AxiomMath/MMP at `1f9ade3670`; audit: A1 to A5 done, A6 in progress; findings: none open of severity 1 or 2".
- **No sums.** No page adds `proved`, `proved-mod` and `proved-ext` into one number (12.2).

## 14.4 Disclosure

- **Pull requests.** Every merged pull request that a role wrote has the role, the model and the run id in its body and as a commit trailer.
- **Handbook sections.** Every section names its drafter and its reviewers.
- **Public statement.** The README and the site say plainly four things:
  - much of the code and the text is written by models;
  - it is checked by Lean and by people;
  - which checks a given result has passed;
  - which results come from AxiomMath/MMP or from other external code, and in what state the audit of that code is.

  This follows the norms that the field wrote down in 2025 and 2026 (01): disclose how a result was made, keep it independently checkable, keep people responsible.

For a fresh claim (route R1) and for an audit finding (route R2) there is a second rule:
1. Before a page goes public, the project writes to the authors (for AxiomMath/MMP, to Axiom and, for S22, to the authors of the OpenAI paper). The letter has the Lean statement or the definition, the checks passed, and the gap, the difference or the confirmation.
2. The page waits 30 days or until they answer, whichever comes first.
3. A confirmation is published only with the authors' consent to be named.
4. A gap or a finding is published only as a neutral statement of what was found (12.6, rule 3).
5. For an audit finding of severity 1 or 2, no public statement about the affected theorem is made in the 30 days, in either direction (08.4).

A finding is reported, not fixed. The project does not keep a fork of AxiomMath/MMP with fixes. If Axiom fixes a defect, the fix is a new commit and a new audit run (08.5).

## 14.5 Audit findings and their severity

A finding of route R2 is a file `audit/axiom-mmp/findings/<n>.yaml`:

```yaml
id: 7
commit: 1f9ade3670
decl: MMP.IsLcPair                       # the Lean name in AxiomMath/MMP
file: MMP/Pair/Basic.lean                 # with the line, from the definition index of A4
step: A5
severity: 3
source: "KM98, Definition 2.34"           # the textbook text it is read against
summary: the definition quantifies over exceptional divisors of one log resolution only
effect: none on the main theorems, by the independence of the resolution, which AxiomMath/MMP proves as ...
readers: [reader-a, reader-b]             # the two people of A5
sent: null                                # date of the letter (14.4)
answer: null
state: draft                              # draft | sent | answered | closed
```

The example above is invented, to show the fields. It is not a finding.

| Severity | Meaning | Effect |
|---|---|---|
| 1 | a main theorem does not mean what it is said to mean: a definition is wrong in a way that changes the content (for example a program that may stop early satisfies `IsMaximal`, or lc admits non-normal $X$) | S22 stays `claimed`; Q9 is **no**; 30 days of silence; the report says what the theorem does prove |
| 2 | a main theorem is right in content but weaker or different in scope than said (for example an extra hypothesis, or a field restriction that the README does not state) | S22 can change only to a weaker statement that the bridge proves; 30 days of silence |
| 3 | a definition differs from the textbook, but the main theorems do not depend on the difference, and a Lean proof or an argument signed by two readers shows it | a note on the definition page; Q9 can be **yes** |
| 4 | a style or documentation issue (a wrong reference, a misleading name, a docstring that disagrees with the code) | a note; Q9 is not affected |

A severity is set by the two readers of A5 or A6 and confirmed by the owner. A change of severity is a new commit to the finding, with the reason. The `auditor` role may propose a finding, but it never sets a severity (10.3).

## 14.6 Registration

The project publishes `formalization.yaml` at the root of `tamnd/mmp`. It uses the schema of the Mathlib Initiative that hironaka and langlands use (version `v0.4`). The file lists each source with its relationship (`formalizes`, `uses`, `states`, `ports`, `bridges`, `audits`) and its author endorsement state. The relationships `bridges` and `audits` are new in this project. If the schema has no such values, the project asks the maintainers to add them, and it uses `uses` with a note until then (Q-14).

The project registers its main statements in the Palomar registry, and the trust rows of each registered statement link to the site. The file also lists these sources with their commit and licence:
- the statements that the project takes from other projects (06.4);
- the ported files (05.4);
- AxiomMath/MMP and AxiomMath/Stacks, with the audit state.

## 14.7 Threats and answers

| Threat | Answer |
|---|---|
| A wrong statement that is easy to prove: termination for "some program" in place of "every program", a flip without the small condition, klt over exceptional divisors only (06.5, risks 1, 2, 5) | the fidelity battery, F3 and F4 in particular, and the freeze of 06.3; the planted errors of the `eval/statements/` set (10.9) |
| A definition of AxiomMath/MMP that is almost right | the definition index of A4 and the two readings of A5; findings with severity (14.5); the positive instances of A6 |
| A main theorem of AxiomMath/MMP with a vacuous hypothesis | the triviality attack and the positive instance of A6 (F2, F4) |
| A kernel bug used by a generated proof (the soundness bug reports of July and August 2026, spec 2161, 01) [S] | Q3 with two more kernels; a pinned toolchain that has the fixes; the scan of 09.2 for escape hatches (`implemented_by`, `extern`, `native_decide`, unsafe code, `debug.skipKernelTC`); a weekly replay |
| A hidden axiom in a dependency, a port or AxiomMath/MMP | the constant walk of Q2 covers Mathlib, the ports and the external library, not only the project |
| Code that runs at build time in an external library | AxiomMath/MMP and every other external repository build only in a sandbox with no network and no secrets (10.7) |
| A ported file that changed meaning in the port | the bridge of 06.4 against the source statement; the provenance line and the `port-change` label of 09.2 |
| A port from a source without a licence | `mmp port check` refuses a source that is not in the allow list of `manifests/ported.yaml` |
| A change to a statement in a large pull request | the hash manifest of 09.6 and the `statement-change` label |
| A named hypothesis that is never discharged and is false | each hypothesis is a named statement with its own fidelity check and a source; each hypothesis shows the expert status of its source; a hypothesis that is open in its setting makes the theorem **conditional** (14.3) |
| A fresh claim used as if it were a theorem | `mmp index` fails when a `claimed` node is the hypothesis of another node (09.2) |
| A Lean check of an AI preprint read as proof that the preprint is right | the literature state and the Lean state are shown apart and never merged (11, 12.6); S22 keeps the literature state `claimed` until peer review |
| A public statement that harms an author or a company | the claim policy of 06.6; the 30-day rule of 14.4; neutral words (12.6) |
| An auditor that is not independent | the people who sign A5 do not write the bridge proofs; the bridge does not change the audited code (08.5) |
| A generated proof that nobody understands | Q7; the handbook is part of the trust, not decoration |
| Prompt injection from a paper, from external Lean code or from lab output | 10.7 |
| A model that reports success it did not reach | `mmp` runs the role checks of 10.3, not the model; the run record has the build log |
| A lab result read as a proof | only a certificate checked by Lean enters the map as a theorem (13.5) |
