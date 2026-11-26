---
title: The papers
description: The corpus of papers and books on the minimal model program that mmp reads, states, ports, bridges or proves, sorted by tier.
lead: Each paper record says why a node of the map needs the paper, what exists in Lean, and how the project uses it.
---
## The corpus

The corpus is the set of papers and books on a path from Mathlib to a top theorem of the project or to a node of a route. It is not all of algebraic geometry. A paper enters the corpus when a node needs it, and the record says which node asked for it. The first list in spec 07 of the project has rows in twelve tiers, T0 to T11, and a watch list of fresh claims. Each record is a YAML file in `papers/` of [tamnd/mmp](https://github.com/tamnd/mmp), and the record pins the version that the project read.

The tiers go from the references (T0) and the schemes and divisors (T1) to the other settings (T11): characteristic $p$, Kähler spaces and foliations. The [map](/map/) lists the tiers.

## The fields of a record

The tag says how well the project knows the bibliographic facts of the record. It does not say whether the theorem is true. P marks a primary source that the project read. S marks a secondary source. U marks a fact that is not verified yet. Each S and U record is a task for the `reader` role before a node depends on it. At milestone S0 nobody has read a source for the project yet, so each record has the tag of its row in spec 07 and no read version.

The use is the plan of the project for the paper:

| Use | Meaning |
|---|---|
| reuse | use the result of Mathlib as it is |
| prove | a full formal proof |
| port | a proof ported from a Lean source with a licence that permits it, then checked |
| bridge | an equivalence with a statement of AxiomMath/MMP, proved in `MinimalModelBridge` |
| state | a Lean statement, used as a named hypothesis of `proved-mod` nodes until it is proved |
| ex | certified examples from the computation lab |
| read | a source of ideas, definitions and text for the handbook, with no theorem on the map |

## Lean elsewhere

A record lists the Lean code that exists elsewhere for its results. AxiomMath/MMP at commit `1f9ade3670` is the largest source. The project audits it and bridges to it. It does not copy it. The [audit page](/audit/) shows the state of the audit.

## Fresh claims

A fresh claim of 2025 or 2026 that experts have not accepted yet has a claim record in `claims/` of [tamnd/mmp](https://github.com/tamnd/mmp). A claim is never a hypothesis of another node. A paper record of a claim has the expert status `claimed`. It changes only after experts accept the paper.
