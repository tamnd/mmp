---
title: About
description: Who runs mmp, how the work is done, and how the project uses AI tools.
lead: The project is run by its owner, Tam Nguyen Duc. It uses AI tools for much of the work, and it says so.
---
## How the work is done

A person sets the goals and reviews the results. A program, `mmp`, checks the map and builds this site. AI tools write drafts of the Lean code, of the handbook and of the records. An agent proposes each change as a pull request, and a person merges it.

Lean checks the proofs, so a proof does not depend on who wrote it. A statement and a text do depend on who wrote them. A Lean statement can be wrong in a way that Lean does not see, and a text can misstate a result. So each statement and each text needs a human review before the project calls it checked.

## The repositories

| Repository | Content |
|---|---|
| [tamnd/mmp](https://github.com/tamnd/mmp) | the map, the paper records, the claim records, the audit records, the trust records, the lab and the pages of this site |
| [tamnd/mmp-lean](https://github.com/tamnd/mmp-lean) | the Lean package `MinimalModel` and the bridge package `MinimalModelBridge` |
| [tamnd/mmp-agent](https://github.com/tamnd/mmp-agent) | `mmp`, which checks the map, runs the agent roles and the lab, and builds the site |
| [tamnd/mmp-handbook](https://github.com/tamnd/mmp-handbook) | The Minimal Model Program Handbook, in PDF and EPUB volumes |

The project follows the shape of its sister projects, riemann, singularity and langlands. The four sites look like one family.

## External code

AxiomMath/MMP is a Lean library by Axiom, under the Apache-2.0 licence. The project audits it and proves bridge theorems from it. It does not copy it, and it does not keep a fork with fixes. Each result that comes from AxiomMath/MMP says so on its page, with the state of the audit.

## Claims

The project does not claim a proof of an open conjecture. It is at milestone S0, and nothing is proved in Lean yet. It calls a node proved only when the Lean build has the proof with the standard axioms. For an open conjecture it also needs the checks of the [trust page](/trust/) and the reading of two outside experts.

## Contact

Use the issues of [tamnd/mmp](https://github.com/tamnd/mmp/issues). Experts who want to review a statement or a definition of AxiomMath/MMP are very welcome.
