---
title: The map
description: The nodes of the map of mmp, with their tier, their status and the Lean declarations that they name.
lead: The map has a node for each definition, theorem, conjecture and claim that the project uses. A tool computes the status of each node from the Lean build. A person does not set the status by hand.
---
## What a node is

The map is a directed graph with no cycles. Its nodes are mathematical statements and definitions. Its edges mean "uses". The map also holds the open conjectures, the fresh claims and the routes, so it is the plan of the project too.

A node is one YAML file in `blueprint/nodes/` of [tamnd/mmp](https://github.com/tamnd/mmp). Its tag is `MM` and 8 characters of base 32. A node has a kind, a title, a statement in words, its sources, the nodes that it uses, the names of its Lean statement and its Lean proof, a tier and its routes. A node of kind `claim` is a fresh claim. Only a check node can use it, and it is never a hypothesis of another node.

## The status of a node

| Status | Meaning |
|---|---|
| `unstated` | The node has no Lean statement yet. The node lists the vocabulary that is missing. |
| `stated` | The Lean statement exists and builds. |
| `defined` | The node is a definition, and it builds with no `sorry`. |
| `faithful` | The statement passed the fidelity checks of its class. |
| `proved` | A Lean proof in `MinimalModel` exists, it uses only the three standard axioms, and each node that it uses is `proved`. |
| `proved-mod` | A Lean proof exists that takes named nodes as hypotheses. Each hypothesis is a published theorem that is not formalized yet. |
| `proved-ext` | A proof exists only in the bridge, from an external library such as AxiomMath/MMP, and the audit of that library at the pinned commit has passed. |
| `open` | The statement is an open conjecture. No proof is claimed. |
| `claimed` | The statement is a fresh claim of 2025 or 2026. It is never a hypothesis of another node. |
| `refuted` | A Lean proof of the negation exists. |

A proof with `sorry` is never `proved`. A published theorem that is not formalized enters as a named hypothesis, never as an `axiom`. The site never adds `proved`, `proved-mod` and `proved-ext` into one number.

## The tiers

The tiers follow the corpus of spec 07. A tier uses only the tiers above it.

| Tier | Content |
|---|---|
| T0 | references |
| T1 | schemes, divisors and positivity |
| T2 | the foundational theorems: vanishing, cone and contraction |
| T3 | surfaces |
| T4 | singularities of pairs |
| T5 | toric geometry and the toric MMP |
| T6 | 3-folds |
| T7 | BCHM and the program in all dimensions |
| T8 | termination and its reductions |
| T9 | abundance and non-vanishing |
| T10 | boundedness, ACC, complements and moduli |
| T11 | other settings: characteristic $p$, mixed characteristic, Kähler spaces and foliations |

The 60 main statements of the program form one more group, S. The [statements page](/statements/) lists them by family.

## The state of the map

The project is at milestone S0. The map has a node for each of the 60 main statements. No node has a Lean declaration in the record of the build yet, so the status of each node is `unstated`. The table below shows the nodes as the records give them.
