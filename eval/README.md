# The eval sets

These are the eval sets of spec 10.9. A change to a model or to a prompt of an agent runs the sets and reports the pass rate and the cost. A drop of more than 5 points blocks the merge.

`scripts/eval.py` checks, elaborates and scores the sets. Its help gives the details.

## eval/tasks: 200 Lean tasks

Each task is a theorem with its statement and its proof. The proof is the known answer. The runner gets the statement and the file around it, and it must give a proof that elaborates.

The tasks come from these pinned commits:

| Source | Commit | Tasks | From |
|---|---|---|---|
| Mathlib, `Mathlib/AlgebraicGeometry` | v4.35.0, `56a0058` | 120 | S0 |
| Mathlib, `Mathlib/Analysis/Convex` | v4.35.0, `56a0058` | 50 | S0 |
| mmp-lean, the history of the project | `1f87642` | 30 | S2 |

A task is a theorem or lemma that is not private, has a statement of 30 to 600 characters and a proof of at most 8 lines, and has no `sorry`. Its proof is one term or one `by` block after the `:=` of the statement, so a declaration by pattern matching, with `|` cases, is not a task. A file whose lines before a task do not elaborate on their own is not a source: `Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean` fails at its line 321 when it is cut there. The run of the workflow `eval` of mmp-lean found three such tasks, and T004, T040 and T167 are the next declarations of the order that pass the rules. The selection takes the declarations in the order of the SHA-256 of their names, with at most 2 tasks from one file of Mathlib and 3 from one file of mmp-lean. Spec 10.9 also names singularity-lean, TauCeti and AxiomMath/MMP as sources at S0. Their tasks come with a later revision of the set, at commits that build with Lean 4.35.0.

The fields are:
- `id`, `source`, `repo`, `commit`, `file`, `line`, `end`, `name`, `license`;
- `from`: the milestone of the source, S0 or S2;
- `statement`: the text of lines `line` to `end` up to `:=`;
- `answer`: the proof after `:=`.

To check a candidate proof, take the file at the pinned commit, keep its lines before `line`, and add the statement, `:=` and the candidate. Then run `lake env lean` on the file in mmp-lean, whose Mathlib is the same pinned commit. The candidate passes if there is no error and no `sorry`.

## eval/statements: 50 statements, faithful and planted

Each item is a pinned statement of the theorem class of `MinimalModel/Statements/` in mmp-lean (spec 06), the S-numbered statements of the map. It has three texts:
- `informal`: the docstring of the statement, which gives the source and the informal statement;
- `faithful`: the reviewed Lean statement;
- `planted`: the same statement with one subtle change that makes it wrong.

The `defect` field says what the change is. The changes are the kind that spec 10.9 lists: some program in place of every program, a flip without small, a hypothesis dropped, `<` in place of `≤`, klt in place of lc, or a quantifier moved.

The runner sees the informal statement and one Lean text, and answers `faithful` or `wrong`. So the set has 100 questions, 50 of each answer.

## eval/audit: 60 definitions

Each item is a definition of `MinimalModel/Statements/` in mmp-lean with its reference text, the docstring. 30 of the definitions have a planted difference, with a `defect` field, and 30 are the reviewed definition as it is. The runner sees the reference and the Lean text and answers `faithful` or `planted`, as an auditor does in A1 and A2 (spec 10).

The definitions of the audit set and the statements of the statement set do not overlap.

## Elaboration

The planted texts are wrong, but they are well typed. The workflow `eval` of mmp-lean runs `scripts/eval.py elab` on each answer, each faithful and planted statement and each definition. So a runner cannot find a planted text by a type error.

## Scoring

A runner writes one line of JSON per question, with an optional cost in US dollars:

```
{"id": "T001", "pass": true, "cost": 0.04}
{"id": "S001.faithful", "verdict": "faithful", "cost": 0.01}
{"id": "S001.planted", "verdict": "wrong", "cost": 0.01}
{"id": "A001", "verdict": "planted", "cost": 0.02}
```

`scripts/eval.py score answers.jsonl` prints the pass rate of each set and the total cost.

## Runs

`mmp agent eval` of mmp-agent asks a runner each question of `eval/statements` and `eval/audit`, and writes the result to `records/eval/DATE-LABEL.json` with the answers in a `.jsonl` next to it. The record gives the runner, the model of each role, the prompt version, the pass rate of each set and the cost from the ledger. With `-baseline RECORD`, the run fails if a set drops by more than 5 points, the gate of spec 10.9.

| Record | Runner | Statements | Audit | Cost |
|---|---|---|---|---|
| `2026-11-26-baseline-faithful` | `constant:faithful`, no model | 50/100 | 30/60 | $0 |

The constant baseline is the floor: a runner that always answers `faithful` gets half of each set. A model run comes when an agent runner is in place.
