# 08. Architecture

The project has four repositories and one site. It follows the shape of the singularity project (spec 2161) and of the langlands project (spec 2161l). Each has a main repository with the map and the records, a Lean repository, an agent repository with the toolchain, and a handbook repository.

The Lean package is in its own repository from the start, `tamnd/mmp-lean`, as in langlands. The map, the records and the pages are in `tamnd/mmp`. One new part has no model in the sibling projects: the audit of AxiomMath/MMP (route R2, 04.3). Its records live in `tamnd/mmp/audit/axiom-mmp/`, and its Lean code lives in the bridge package of `tamnd/mmp-lean`.

## 8.1 The repositories

| Repository | Holds | Language | Licence |
|---|---|---|---|
| `tamnd/mmp` | the blueprint (the map of statements and their dependencies); the paper records and the claim records (07.14); the trust and fidelity records; the audit records of route R2; the lab specs and runs; the pages of the site; the deploy workflow | Markdown, YAML, JSON | prose CC BY-SA 4.0; data Apache-2.0 |
| `tamnd/mmp-lean` | the Lean package `MinimalModel`, with the ported sources under `MinimalModel/Ported/` (05.4); the bridge package `MinimalModelBridge` in `bridge/` (09.4) | Lean 4 | Apache-2.0 (as Mathlib, AxiomMath/MMP and every ported source) |
| `tamnd/mmp-agent` | `mmp`, the toolchain: index the Lean code, check the trust rows, run the audit steps, run the agent roles, run the lab, build and check the site | Go | MIT, as singularity-agent |
| `tamnd/mmp-handbook` | The Minimal Model Program Handbook: the prerequisites P0 to P8 and the subject in Volumes 0 to 17, as PDF, EPUB and HTML; `mhb`, the builder | Markdown, LaTeX, Python | prose CC BY-SA 4.0; builder MIT |

The site is https://mmp.tamnd.com.
- `mmp site build` writes it from `tamnd/mmp`, from the index of `tamnd/mmp-lean` and from the release files of the handbook.
- The workflow `deploy` of `tamnd/mmp` deploys it to the Cloudflare Worker `mmp`. The Worker serves static files only (12).

The bridge package `MinimalModelBridge` is in `tamnd/mmp-lean/bridge/`.
- It has its own `lakefile` and `lake-manifest.json`. It depends on `MinimalModel` by path and on AxiomMath/MMP at `1f9ade3670`, which brings AxiomMath/Stacks at `c496df0d9b`.
- Both packages are at the same Lean and Mathlib pin (05.1), so a bump of one is a bump of both (09.3).
- `MinimalModel` never imports it. A release of `MinimalModel` does not need the Axiom build. Its CI runs on a large machine, once a day and on each change to `bridge/` (09.7).

The repositories are created only after the owner approves this spec (00, decision 12).

## 8.2 The boxes

```
              literature (arXiv, journals, books, Lean repos, AI releases)
                          │ ingest (mmp paper add, mmp claim add, mmp port add)
                          ▼
 ┌──────────────────────── tamnd/mmp ────────────────────────────────┐
 │  papers/  claims/ ──►  blueprint/  ◄──── index ──── tamnd/mmp-lean
 │  (records)             (the map:                    MinimalModel/
 │                         nodes + edges)               Statements/ Ported/
 │      ▲                   ▲   │                       Toric/ Surface/ Pairs/
 │      │                   │   ▼                       Reductions/ Fidelity/
 │  records/  ◄─────────────┴── mmp index / trust /     bridge/MinimalModelBridge
 │  (trust, fidelity, status, runs)   fidelity             │  ▲
 │  audit/axiom-mmp/ ◄──── mmp audit A1..A8 ───────────────┘  │ AxiomMath/MMP
 │  lab/ (specs, runs, certificates) ──── certificates ──────►│ @1f9ade3670
 │  site/ (pages)                                             │
 └──────┬────────────────────────▲───────────────────────────────┘
        │ mmp site build          │ pull requests from agent roles
        ▼                         │
 mmp.tamnd.com            tamnd/mmp-agent (mmp: roles, audit, lab, site)
        ▲                         │
        │ release files           ▼
 tamnd/mmp-handbook ◄── chapters (writer role + people)
```

## 8.3 The central object: the map

The *map* is a directed acyclic graph.
- Its nodes are mathematical statements and definitions. Its edges are "uses".
- It is the blueprint of the project, and every other part reads it.
- It also holds the open conjectures, the reductions between them and the routes, so it is the plan too. The reduction graph of 03.11 is a subgraph of the map.

A node is one YAML file in `blueprint/nodes/`. Its name is a stable tag: `MM` and 8 characters of base 32, as in Math 2.0.

```yaml
tag: MM3K7Q2NTB
slug: toric-cone-theorem   # the working name of 04 and 07; mmp node new keeps it
kind: theorem              # definition | theorem | lemma | conjecture | reduction | example | counterexample | check | claim
title: The cone theorem for projective simplicial toric varieties
statement: |
  Let $X_\Sigma$ be a projective simplicial toric variety. Then $\overline{NE}(X_\Sigma)$ is the
  convex cone spanned by the classes of the torus-invariant curves $V(\tau)$, $\tau$ a wall of $\Sigma$.
  In particular it is rational polyhedral.
sources:
  - paper: T5-04
    loc: "Fujino-Sato 2004, Theorem 1.2; Reid 1983, Section 1"   # the reader role checks the numbers
  - port: yaeldillies-toric
    loc: "none; the fan files are new"
uses: [MM8XQ2V0CD, MM4N7Y1KTE]
lean:
  statement: MinimalModel.Toric.ConeTheorem
  proof: MinimalModel.Toric.coneTheorem    # absent while open
tier: T5
route: [R3]
level: [G1, G2]
handbook: "Vol. 3, Ch. 3"
status: computed           # never written by hand; see below
external:                  # the same statement elsewhere (06.4)
  - { repo: AxiomMath/MMP, decl: IsKltPair.exists_relativeClosedConeOfCurves_eq_add_hull, bridge: MinimalModelBridge.Toric.cone }
math2: null                # the Math 2.0 node, when there is one
```

Documents 04, 06 and 07 refer to nodes by working names such as `toric-cone-theorem`. `mmp node new` assigns the tag and keeps the working name as `slug`, so both resolve on the site.

`mmp index` computes the status from the Lean environment and the records. It is never written by hand.

| Status | Meaning |
|---|---|
| `unstated` | the node has no Lean statement yet; `needs` lists the missing vocabulary (06.2.2, G1b) |
| `stated` | the Lean statement exists and builds |
| `faithful` | the statement passed the fidelity battery (06.3) for its class |
| `proved` | a Lean proof in `MinimalModel` exists, depends on the three standard axioms only, and every node it uses is `proved` |
| `proved-mod` | a Lean proof exists that takes named nodes as hypotheses (a published theorem that is not yet formalized); the site lists them |
| `proved-ext` | a proof exists only in the bridge, from an external library; the site shows the source, the commit and the audit status (14.2) |
| `open` | the statement is an open conjecture; no proof is claimed |
| `claimed` | the statement is a fresh claim (route R1, 07.13); it is not a hypothesis of any node |
| `refuted` | a Lean proof of the negation exists |

`proved-ext` is new in this project. It is for S22 and the other statements that only AxiomMath/MMP proves. It becomes `proved` only if the proof is ported into `MinimalModel`, which is not planned (05.2). The audit verdict is shown next to it, and the levels report (12.2) counts it apart.

The differences from a classical blueprint (Massot's `leanblueprint`, used by Imperial FLT, and the Verso blueprint of 2026):
- the nodes are data, not LaTeX;
- the status is computed;
- the map includes the open conjectures, the reductions and the routes;
- external proofs are first-class, with their audit status.

## 8.4 The six flows

1. **Ingest.**
   - `mmp paper add <arXiv id | DOI>` writes `papers/<id>.yaml`. It has the metadata, the arXiv version, the licence class and a list of the numbered results of the paper.
   - The `reader` role (10.3) proposes a node for each result that the project needs, with its uses. A person accepts or edits.
2. **Port.**
   - `mmp port add <repo> <commit> <paths>` copies Lean files from a licensed source into `MinimalModel/Ported/<source>/`. It keeps the licence header, adds a provenance line and records the commit in `manifests/ported.yaml` (05.4).
   - The `porter` role makes the files build at the pin. It also writes the bridge to the project's statements.
3. **Formalize.**
   - The `stater` role writes the Lean statement of a node, and the fidelity battery runs.
   - The `prover` role works on the proof, and `mmp index` computes the status.
   - Each step is a pull request to `tamnd/mmp-lean` with a matching change to `tamnd/mmp`, built by CI.
4. **Audit.**
   - `mmp audit run A<k>` runs one step of 04.3 on AxiomMath/MMP at the pinned commit and writes `audit/axiom-mmp/A<k>.json` (machine steps) or `A<k>.md` (reading steps).
   - The `auditor` role (10.3) drafts the reading reports of A5 and A6. People sign them.
   - A finding becomes an `audit/axiom-mmp/findings/<n>.yaml` with a severity (14.5). A finding of severity 1 or 2 stops any public statement about S22 until the authors have had 30 days (14.4).
5. **Check claims and explore.**
   - `mmp claim add <arXiv id | URL>` writes `claims/<id>.yaml` for a fresh claim (route R1). The `reader` and `stater` roles pick a self-contained part of it, and the `prover` and `refuter` roles work on it.
   - The `explorer` role runs the lab (13): baskets and plurigenera, toric mld and enc cones, weighted hypersurfaces, the arithmetic of counterexamples.
   - A result is a `lab/runs/<id>/` record. When it matters, it also becomes a new node of kind `example`, `counterexample`, `check` or `conjecture`.
6. **Explain.**
   - The `writer` role and people write the handbook chapters from the map and the Lean code.
   - The `explainer` role writes docstrings and the L2 text of each node on the site.

## 8.5 Cross-cutting decisions

- **Lean is the source of truth for status.** No status, count or claim on the site or in the handbook is written by hand. Each comes from a record that a tool wrote (the rule of riemann, singularity and langlands).
- **Pinned everything.**
  - Lean and Mathlib are pinned in `lean-toolchain` and `lake-manifest.json`.
  - AxiomMath/MMP and AxiomMath/Stacks are pinned by commit in the bridge manifest. A new Axiom commit is a new audit run, not a silent update (04.3).
  - Each ported source is pinned by commit.
  - Each paper record pins the version it read (the arXiv version number).
- **Port, do not depend.**
  - Large Lean projects are not Lake dependencies of `MinimalModel`. TauCeti and YaelDillies/toric are at v4.37.0-rc1, formal-conjectures at v4.33.1. AxiomMath/MMP is about 2.05 million lines and Stacks is about 700 MB of source.
  - Their size would make the build cost of the project their cost.
  - A port takes only the files that a node needs (05.4). AxiomMath/MMP is the one exception, and only inside the bridge.
- **The audit is independent.** The people who sign the audit reading (A5) do not write the bridge proofs, and the bridge proofs do not change the audited code. A defect is reported, not fixed in a fork (14.4).
- **One writing style.**
  - Plain technical English (ASD-STE100): no em dash and no en dash, no "we" in the content of the site and the handbook, math in `$...$`. The style script of singularity is reused.
  - Names of theorems with several authors use a hyphen (Kawamata-Viehweg, Birkar-Cascini-Hacon-McKernan, Hacon-McKernan-Xu).
- **People decide.**
  - The agent proposes pull requests, and a person merges.
  - Statements of open conjectures and their changes need two people (06.3, F6).
  - A page about a fresh claim or about an audit finding needs the owner and a letter to the authors (14.4).
- **Budgets are explicit.** Every model call is in a ledger with its cost, under a daily and a per-run budget in `agent.yaml`. The rule is the one of singularity-agent: no file, no budget, no calls.
