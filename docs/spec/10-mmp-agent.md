# 10. tamnd/mmp-agent: `mmp`

`mmp` is one Go binary. It does for this project what `sing` does for singularity and `lgl` does for langlands:
- it indexes the Lean code and computes the status of the map;
- it runs the trust checks;
- it runs the audit steps of route R2;
- it builds the site;
- it runs the agent roles that write statements, proofs, ports, examples and text;
- it runs the lab and the claim checks of route R1.

The code has the shape of singularity-agent: `cmd/`, `index/`, `trust/`, `audit/`, `site/`, `agent/`, `llm/`, `prompts/`, `lab/`. The packages `index`, `trust` and `site` are shared with singularity-agent and langlands-agent through a common Go module. The package `audit` is new.

The name `mmp` is the name of the subject, short and free as a command [U]. Q-18 (16) records the alternatives (`minmod`, `mori`).

## 10.1 Commands

```
mmp help | version
mmp index      -lean ../mmp-lean -out records/index.json            # Lean env → declarations, uses, sorry, axioms
mmp status     -content ../mmp                                      # map + index → records/status.json; counts of 06.2 and 07.15
mmp levels                                                          # 02.3 levels report → records/levels.json (12.2)
mmp trust      [-quick] -lean ../mmp-lean                           # 14: axioms, replay, comparator → records/trust.json
mmp fidelity   -node MM... | -all                                   # 06.3: run F1 to F5 for a node → records/fidelity.json
mmp audit run  A1..A8 | status | finding add                        # route R2 (04.3) → audit/axiom-mmp/
mmp audit defs -source ../MMP                                       # A4: the definition index → audit/axiom-mmp/definitions.yaml
mmp paper add  <arXiv id | DOI> | list | show <id>
mmp claim add  <arXiv id | URL> | list | show <id>                  # route R1: a fresh claim record (07.13)
mmp claim plan <id>                                                 # the self-contained parts, their statements, cost
mmp corpus     [-count] [-tier T5]                                  # 07: rows, uses, priorities
mmp port add   [-plan] <repo> <commit> <paths> | list | diff <source>   # 05.4; -plan measures the import closure
mmp port check                                                      # licence headers, provenance lines, manifest
mmp node new | check | graph [-route R3] [-tier T5] [-reductions] [-dot]
mmp queue      [-role prover] [-n 20]                               # the work queue, with the reason for each rank
mmp agent run  <role> [-node MM...] [-budget 5]                     # one run of a role; writes a run record and a branch
mmp agent report -week 2026-W52                                     # the weekly report (10.8)
mmp lab run    <spec> | list | show <run>                           # 13
mmp site build -content ../mmp -lean ../mmp-lean -handbook ../mmp-handbook/build -out public
mmp site check -dir public | serve -dir public
```

The exit codes are those of singularity-agent:
- 0: success;
- 1: a check failed;
- 2: a usage error;
- 3: not written yet. The message names the milestone.

## 10.2 Lean access

`mmp` talks to Lean in four ways, from cheap to expensive:

1. **Index.** One Lean program, run with `lake env lean --run`, imports `MinimalModel`. For each constant it writes:
   - the type;
   - the module;
   - the constants it uses;
   - whether it depends on `sorryAx`.

   This is `sing index`, adapted. The same program runs on `MinimalModelBridge` for the bridge nodes.
2. **Check a file.** `lake env lean <file>` with a JSON message log, for the edit and check loop of a role. A role always works in a fresh worktree of `tamnd/mmp-lean`, so a run cannot break `main`.
3. **Interactive.** A long-lived Lean REPL (the `repl` of leanprover-community, or Pantograph) for the prover role, so that a proof can be tried tactic by tactic against goal states. The REPL runs in a sandbox with no network and a read-only Mathlib.
4. **External builds.** For the audit and for ports, `mmp` builds a pinned external repository in its own sandbox and extracts its statements with `lean4export`. The copies in `bridge/MinimalModelBridge/External/` come from that output. For AxiomMath/MMP the build is cached by commit, since it takes hours.

## 10.3 The roles

Each role has three parts:
- a prompt in `prompts/<role>.md`, with front matter `role` and `version`;
- a Go driver in `agent/<role>.go`;
- a test with a fake model.

| Role | Input | Output | Checked by |
|---|---|---|---|
| `reader` | a paper or claim record and its text | the list of its numbered results with page and number; proposed nodes and `uses` edges; for a claim, the self-contained parts and their dependencies | a person accepts each node |
| `stater` | a node | the Lean statement in `Statements/` or in a module, with a docstring | build; F1, F2 of 06.3 |
| `prover` | a `stated` node whose uses are `proved` or `proved-mod` | a proof, or a decomposition into new lemma nodes with statements | build; `mmp index` shows no `sorry` |
| `planner` | a route and its nodes | the next nodes to state; a decomposition of a hard node into steps; a short note on why | a person, for any change of `routes.yaml` or `targets.yaml` |
| `refuter` | a statement, a conjecture or a step of a fresh claim | a Lean proof of the negation, a counterexample from the lab, or a trivial proof (F3, F4) | build; lab record |
| `explorer` | a question of a route (for example "is the mld of every toric enc 4-fold germ in this finite set") | a lab spec and its run; a conjecture node when the data suggests one | lab record; a person for a new conjecture node |
| `porter` | a file of a ported source, or a failing build after a bump | the file at the project pin, with its provenance line; the bridge to the project statement | build; `mmp port check` |
| `auditor` | an AxiomMath/MMP definition or theorem and its source reference (KM98, BCHM, a Stacks tag) | a draft reading report for A5 and A6: the Lean definition, the textbook definition, the differences, a positive instance to try, a trivial proof to try | two people sign each report (04.3) |
| `explainer` | a declaration or a node | a docstring, the L2 text of a node, the round-trip English of F5 | a person |
| `writer` | a handbook chapter brief | a chapter section, with examples and exercises (11.3) | a person; the handbook check |
| `linker` | a node | its Math 2.0 node, its Stacks tags, its database objects (13.2) and its references | `mmp site check` |

The research happens in three roles:
- **`planner`.** It reads the route documents (04), the status of the map, the lab results and the claim records, and it proposes the next steps. Its proposals are cheap to make and expensive to follow, so a person approves each change of a route.
- **`reader` on claims.** For route R1 the hard step is the choice of a self-contained part of a long preprint. That part must be small enough to formalize and central enough to matter. The `reader` proposes and a person decides.
- **`auditor`.** A 2-million-line library cannot be read by people line by line. The auditor drafts the comparison of each of the 300 to 600 definitions of A4 with its textbook source, and ranks them by risk (06.5). People read the top of the list in full and sample the rest. The auditor never signs.

## 10.4 The queue

The work queue has every node that a role can act on. The rank of a node is

$$
\text{rank} = \frac{w_{\text{route}} \cdot (1 + \text{unblocks}) \cdot (1 + \text{level bonus})}{1 + \text{attempts}} \cdot \text{age factor}
$$

- `unblocks` is the number of nodes that wait only on this node.
- `attempts` counts the failed runs.
- `level bonus` is 1 for a node on the path to a top theorem of the current milestone (15) and 0 otherwise.
- Library nodes (tiers T1 to T7) have the weight of the milestone that needs them. Route nodes have the weight of their route (04.1). Audit items have the weight of R2.

`mmp queue` prints the rank and the reason, so a person can see why the agent works on something. The weights are in `blueprint/routes.yaml`, and people set them.

## 10.5 The loop of one run

1. Take the top item of the queue for the role, or the node given with `-node`.
2. Make a worktree and a branch `agent/<role>/<tag>-<run>`.
3. Build the context:
   - the node, and its uses with their statements and docstrings;
   - the papers and the pages of the source;
   - nearby Lean declarations, found by name and by type, in the project, in Mathlib, in the ported sources and (for `auditor` and `porter`) in AxiomMath/MMP;
   - the earlier failed attempts, with their error messages.
4. Call the model. For `prover`, iterate: propose a proof, check it in the REPL, read the errors, repair. Stop at the step limit or the budget limit.
5. Check the result with the checks of the role (10.3).
6. Write a run record. On success, open a pull request with the record in its body.

## 10.6 Models, budgets and the ledger

`agent.yaml` in `tamnd/mmp` sets the models and the budget:

```yaml
models:
  default: claude-sonnet-5-5
  prover: claude-opus-5-5
  planner: claude-opus-5-5
  refuter: claude-opus-5-5
  reader: claude-opus-5-5     # claim reading needs the strongest model
  auditor: claude-opus-5-5    # definition comparison is reading, not search
  linker: claude-haiku-5-5
budget:
  day: 200      # dollars
  run: 20
  role:
    prover: 95
    auditor: 25
    porter: 20
    refuter: 25   # includes the F4 triviality attacks
    reader: 15
  route:          # share of the research part of the budget; 04.1
    R1: 0.20
    R2: 0.15
    R3: 0.15
    R4: 0.10
    R5: 0.10
    R6: 0.10
    R7: 0.05
    R8: 0.05
    R9: 0.05
    Lab: 0.05
machine:
  bridge_runner: 64GB      # the bridge build of 09.4; about 6 hours cold, under 1 hour cached [U]
  lab_cores: 32            # 13.4
```

The rules are those of singularity-agent:
- With no `agent.yaml` the budget is zero and no call goes out.
- Every call goes into `agent/ledger.jsonl` with the run, the role, the model, the prompt version, the tokens and the cost.
- The model ids are configuration, not code. A new model is a change of `agent.yaml`, tested by the evaluation of 10.9.

In the first year, about half of the budget goes to the library (tiers T1 to T5 and the ports), a quarter to the audit and the toric route, and a quarter to the other routes. The share of the routes grows as the library is finished. The audit has a fixed share until A8 closes (15, S3).

## 10.7 Untrusted text

Paper text, claim text, web pages, external Lean code and lab output are data, not instructions.
- A role puts them in the prompt inside a marked block. The prompt says that instructions in the block are ignored.
- A role never runs a command or fetches a URL that comes from such text.
- An external Lean repository, including AxiomMath/MMP, is built only in a sandbox with no network and no secrets. Lean code can run arbitrary programs at elaboration time.
- The lab runs in a container with no network (13).

## 10.8 The weekly report

`mmp agent report` writes `reports/2026-Wnn.md` in `tamnd/mmp`. The report has:
- the nodes that changed status, by tier and by route;
- the pull requests opened and merged;
- the spend by role and by route;
- the audit steps done and the findings, by severity;
- the lab runs;
- the claim checks: the parts done, the gaps found and the letters sent;
- the refuted conjectures;
- the five largest open nodes of each route, with what blocks them.

The site shows the reports as the timeline (12).

## 10.9 Evaluation of the agent

A fixed set of 200 tasks lives in `eval/tasks/`. Every task has a known answer.
- At S0 the tasks come from outside the project:
  - lemmas of Mathlib's `AlgebraicGeometry` and `Analysis/Convex` folders, with their proofs removed;
  - lemmas of singularity-lean and TauCeti;
  - small lemmas of AxiomMath/MMP with their proofs removed (a known answer exists, and the license allows it).
- From S2 on, tasks also come from the project's own history.

Each model or prompt change runs the set and reports the pass rate and the cost. A change that lowers the pass rate by more than 5 points is not merged. The set grows by 10 tasks each month from the merged pull requests.

A second set, `eval/statements/`, tests the `stater` role. It has 50 informal statements with reviewed Lean statements, and 50 subtly wrong Lean statements that the battery must reject. Examples of wrong statements:
- termination with "some program" in place of "every program" (risk 1);
- a flip without the small condition (risk 2);
- klt defined with discrepancy $> -1$ over exceptional divisors only, which gives plt (risk 5);
- abundance with Iitaka dimension in place of numerical dimension in the hypothesis (risk 4).

A third set, `eval/audit/`, tests the `auditor` role. It has 30 definitions with a planted difference from the textbook (a missing properness, a wrong sign, a dropped normality), and 30 faithful ones. The auditor must flag the first and pass the second.
