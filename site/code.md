---
title: The code
description: The Lean package mmp-lean, its pinned toolchain, its layout, the bridge to AxiomMath/MMP and the rules for its code.
lead: The Lean code is in tamnd/mmp-lean. Its root namespace is MinimalModel. It builds with Lean v4.35.0 and Mathlib v4.35.0.
---
## Build

```sh
git clone https://github.com/tamnd/mmp-lean
cd mmp-lean
lake exe cache get
lake build
```

`lake exe cache get` downloads the compiled Mathlib. `lake build` builds the package `MinimalModel`. The bridge package in `bridge/` has its own lakefile and imports AxiomMath/MMP. Its build is large, so it runs on its own machine and is not part of the default build.

## The toolchain

The project starts on Lean `v4.35.0` with the Mathlib tag `v4.35.0`, at commit `56a005855ea17e0b0958f73ec801ae140b0a1679`. The pin is in `lean-toolchain` and `lake-manifest.json`. AxiomMath/MMP, AxiomMath/Stacks, singularity-lean and langlands-lean use the same pin, so the bridge and the main port sources build without change. The first toolchain bump, to `v4.36.0`, is planned for milestone S1, for `MinimalModel` and the bridge together.

## The root name

The root namespace is `MinimalModel`. The name `MMP` belongs to AxiomMath/MMP, and the bridge package imports both. A shared root would make every bridge file ambiguous.

## Layout

| Directory | Content |
|---|---|
| `MinimalModel/Statements/` | the pinned statements of the program; they import only Mathlib and `Basic.lean` |
| `MinimalModel/Statements/Hypotheses.lean` | named `Prop`s for the published theorems that are not in Lean yet |
| `MinimalModel/Ported/` | the ported sources, with their licence headers |
| `MinimalModel/Schemes/` | tier T1: normality, prime divisors, Weil and Cartier divisors, the canonical divisor |
| `MinimalModel/Positivity/` | tier T1: intersection data, $N^1$, cones, nef, ample, big, Iitaka dimension |
| `MinimalModel/Pairs/` | tier T4: discrepancies, klt, lc, dlt, mld, lct, log resolutions |
| `MinimalModel/Foundations/` | tier T2: the general theorems as statements and their consequences |
| `MinimalModel/Surface/` | tier T3: the intersection form, Castelnuovo, the surface program |
| `MinimalModel/Toric/` | tier T5 and route R3: fans, divisors, the cone theorem, contractions, flips, termination, mld |
| `MinimalModel/Reductions/` | tiers T8 and T9: implications between named `Prop`s |
| `MinimalModel/Routes/` | one folder for each route |
| `MinimalModel/Examples/` | worked examples and certificates from the lab, each a node |
| `MinimalModel/Fidelity/` | the files of the fidelity checks F2, F3 and F4, one for each statement |
| `MinimalModel/Bridge/` | the bridges from the statements of the project to Mathlib, formal-conjectures and the ports |
| `MinimalModel/WIP/` | work with `sorry`; `MinimalModel.lean` does not import it |
| `bridge/` | the package `MinimalModelBridge`, which imports AxiomMath/MMP and proves the statements of the project from its theorems |
| `manifests/` | `statements.sha256`, `external.sha256` and `ported.yaml` |

The [statements page](/statements/) lists the statement files and the statements that they will hold. The project is at milestone S0, so most of these directories do not exist yet.

## Rules

1. No `sorry` in the main tree. CI fails on `sorry`, `admit`, a new `axiom`, `opaque`, `native_decide`, `implemented_by` and `@[extern]` outside `WIP/`. A node with a proof that is not finished keeps the proof in `WIP/` and has the status `stated`.
2. Hypotheses, not axioms. A published theorem that is not formalized yet enters as a named `def ... : Prop` in `Statements/Hypotheses.lean`. It is a hypothesis of the theorems that use it. Their status is `proved-mod`, and the site lists the hypotheses.
3. A fresh claim is never a hypothesis of another node. `mmp index` fails if one is. S22 is `claimed` or `proved-ext`, so no node of `MinimalModel` uses it.
4. Statement files are small and have comments. Other files can be long.
5. The code follows the naming and the style guide of Mathlib, so that parts can go upstream.
6. A ported file keeps its licence header and gets a provenance line, `-- Ported from <repo>@<commit>:<path>`. A change to a ported file is a separate commit with the label `port-change`.
7. One universe. The statements are universe polymorphic. Only `bridge/` specializes to `Scheme.{0}`, because AxiomMath/MMP fixes that universe.

A change to a file in `MinimalModel/Statements/` must change its hash in `manifests/statements.sha256` in the same pull request. The pull request needs the label `statement-change` and two approvals.

## Contribute

Each pull request refers to a milestone issue of [tamnd/mmp](https://github.com/tamnd/mmp/issues). A proof must use the standard axioms only. An agent proposes a pull request, and a person merges it.
