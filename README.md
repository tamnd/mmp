# mmp

The minimal model program in Lean 4, in public.

The minimal model program (MMP) is a plan to classify algebraic varieties up to birational equivalence. It runs a sequence of divisorial contractions and flips until it reaches a minimal model or a Mori fibre space. Some parts are theorems: the cone and contraction theorems, the MMP in dimension at most 3, and the existence of flips and of minimal models for varieties of general type (BCHM). Termination of flips and abundance are open in dimension 4 and higher. This project states the program in Lean, proves the known parts in an order that leads to the open parts, and works on the open parts in the open.

The site is https://mmp.tamnd.com.

## The repositories

| Repository | Content |
|---|---|
| mmp (this repository) | the map of the program, the paper records, the claim records, the audit records, the lab specs, the trust records, the spec and the pages of the site |
| [mmp-lean](https://github.com/tamnd/mmp-lean) | the Lean package `MinimalModel`: the statements, the fidelity checks, the library, the bridge and the proofs |
| [mmp-agent](https://github.com/tamnd/mmp-agent) | `mmp`, the toolchain: it checks the map and the records, and it builds and checks the site |
| [mmp-handbook](https://github.com/tamnd/mmp-handbook) | a textbook series for students and mathematicians, as PDF and EPUB |

## Status

No open case of the program is proved here, in Lean or on paper. The site shows the status of each statement. A tool computes each status from the Lean build and the records. No status is written by hand.

Models write much of the code and the text. Lean and people check it. The site says which checks each result has passed, and which results come from AxiomMath/MMP or from other external code.

At this time the map has 60 statements. Fourteen are in Lean: 7 are `stated`, 6 are `open`, and S22 is `claimed`. Five other statements are `claimed`, and 41 are `unstated`.

AxiomMath/MMP claims a kernel-checked proof of the MMP for lc pairs in dimension at most 4. No person has read its definitions against the textbooks. The project audits it in eight steps, A1 to A8 (spec 04.3). Until the audit passes, its main theorem (S22) has the status `claimed`. Step A1 is in progress. Steps A2 to A8 are not started. The records are in `audit/axiom-mmp/` and `records/audit.json`.

The work goes in milestones. Each milestone has a tracking issue with the label `milestone`. The plan is in `docs/spec/15-milestones.md`.

| Milestone | Target | Goal | Release |
|---|---|---|---|
| S0 | 2026-12-20 | the repositories, the first statements, the site, the audit started | v0.1.0 |
| S1 | 2027-02-28 | the vocabulary, the audit index, the first claim check | v0.2.0 |
| S2 | 2027-04-30 | the toric cone theorem, most statements written | v0.3.0 |
| S3 | 2027-06-30 | the audit closes, the S22 decision | v0.4.0 |
| S4 | 2027-09-30 | the toric MMP | v0.5.0 |
| S5 | 2027-12-31 | the surface program on Mathlib, the Han-Liu reduction | v1.0.0 |
| S6 | 2028-04-30 | the scheme dictionary and the last statements | v1.1.0 |
| S7 | 2028-08-31 | the first research result | v1.2.0 |
| S8 | 2028-12-31 | the library and the claims | v1.3.0 |
| S9 | open | an open case | v2.0.0 |

The dates are targets. A patch release marks a set of merged pull requests inside a milestone. A minor or major release closes a milestone.

## Layout

| Path | Content |
|---|---|
| `docs/spec/` | the spec: the research of 2026, the goal, the program, the routes, the statements, the corpus, the architecture, the audit and the milestones |
| `docs/reviews/` | the reviews of parts of the spec, such as the review of Target T (04.12) for S3 |
| `blueprint/nodes/` | the map: one YAML file for each statement, with its sources, its uses and its Lean names |
| `blueprint/routes.yaml` | the research routes R1 to R9 of spec 04, with their weights |
| `blueprint/milestones.yaml` | the milestones S0 to S9, with their dates and releases |
| `papers/` | one record for each paper or book of the corpus (spec 07) |
| `claims/` | one record for each fresh claim of route R1 (spec 01.3) |
| `audit/axiom-mmp/` | the steps of the audit of AxiomMath/MMP (spec 04.3) |
| `records/` | the records that tools write: the Lean build, the trust report, the fidelity checks and the audit state |
| `lab/` | the specs and the runs of the computation lab (spec 13) |
| `site/` | the pages of the site |
| `reports/` | the milestone and weekly reports |

## Build the site

```sh
git clone https://github.com/tamnd/mmp-agent ../mmp-agent
(cd ../mmp-agent && go build -o bin/mmp ./cmd/mmp)
../mmp-agent/bin/mmp check -content .
../mmp-agent/bin/mmp site build -content . -out public
../mmp-agent/bin/mmp site serve -dir public
```

## Licence

The prose is licensed under CC BY-SA 4.0 and the data under Apache-2.0. See `LICENSES/`.
