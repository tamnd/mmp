---
title: The audit of AxiomMath/MMP
description: The audit of the Lean proof of the lc MMP in dimension at most 4 in AxiomMath/MMP at commit 1f9ade3670, in eight steps, with the state of each step.
lead: "AxiomMath/MMP is a Lean proof of the MMP for lc pairs in dimension at most 4. The Lean kernel checked its inferences. The audit asks a different question: do its statements mean what the textbooks mean?"
---
## Why an audit

AxiomMath/MMP states that every MMP for a projective lc 4-fold with rational boundary terminates. If its definitions mean what KM98 and BCHM mean, then termination in dimension 4 for these pairs is a theorem, and an open problem of forty years is closed. The proof is the work of Axiom and of the OpenAI paper of family 056. The audit is the work of this project. It is route R2 of spec 04.

The README of the repository says that the code "has not yet been reviewed by humans". A kernel check shows that each step follows from the one before. It does not show that a definition such as `IsMaximal` or "lc pair" is the textbook one. The audit reads the definitions against the textbooks, by two people for each item.

## The pinned source

| Item | Value |
|---|---|
| repository | [AxiomMath/MMP](https://github.com/AxiomMath/MMP) |
| commit | `1f9ade367087ec711a2ce1382bad279a5a0284c3`, of 2026-11-16 |
| licence | Apache-2.0 |
| toolchain | `leanprover/lean4:v4.35.0` |
| Mathlib | `56a005855ea17e0b0958f73ec801ae140b0a1679` |
| AxiomMath/Stacks | `c496df0d9beea9deaeabcea8492605f9a0a2313b` |

The main theorems are `MMP.Fourfold.Program.IsMaximal.isNefOnCurves_or_isMoriFibreSpace`, `MMP.Fourfold.Program.isContinuableRay`, `MMP.Fourfold.Program.n_ne_top_of_isAlgClosed` and `MMP.Fourfold.projectiveLowerLogMMP_three`. The audit also checks three other results: Kawamata-Viehweg vanishing, the surface program and the relative cone theorem for klt pairs.

## The steps

| Step | Work | Exit |
|---|---|---|
| A1 | a clean build at the pinned commit on a large machine; the time, the memory, `lake-manifest.json` and the hash of every `.olean` | the build log and the hashes |
| A2 | `#print axioms` on the four main theorems and the three other results; the expected set is `propext`, `Classical.choice` and `Quot.sound` | the axiom report |
| A3 | a replay in `lean4checker`, then in lean4lean and nanoda as a second and a third kernel | the replay logs |
| A4 | the definition index: each `def`, `structure`, `class` and `instance` that the statements of the main theorems use, with file and line | `definitions.yaml` |
| A5 | the reading: each item of A4 against KM98, BCHM and the Stacks Project, by two people | one record for each definition |
| A6 | the meaning of the main statements: that every program terminates, not only one; that `IsMaximal` cannot hold for a program that stops early; that no hypothesis is vacuous | a statement report |
| A7 | the Stacks layer: each AxiomMath/Stacks result that the main theorems use and whose statement differs from the Stacks Project text | a Stacks report |
| A8 | the bridge: the statements S20 to S24 of the project proved from the theorems of AxiomMath/MMP in `MinimalModelBridge`; a letter to Axiom, 30 days, then a public report | the bridge build and the report |

## Where the state is kept

The tables at the top of this page show the state of each step and the open findings. The site makes them from `records/audit.json` at each build, so they do not go out of date. The exit records are in `audit/axiom-mmp/` of [tamnd/mmp](https://github.com/tamnd/mmp), and the table links each one. The command `mmp audit step` changes the state of a step, and it refuses the state `done` for a step with no exit record. The trust row Q9 reads the same file.

## Findings and their severity

| Severity | Meaning | Effect |
|---|---|---|
| 1 | a main theorem does not mean what it is said to mean | S22 stays `claimed`; Q9 is no; 30 days of silence; the report says what the theorem does prove |
| 2 | a main theorem is right in content but weaker or different in scope than said | S22 can change only to a weaker statement that the bridge proves; 30 days of silence |
| 3 | a definition differs from the textbook, but the main theorems do not depend on the difference | a note on the definition page; Q9 can be yes |
| 4 | a style or documentation issue | a note; Q9 is not affected |

Two readers of A5 or A6 set a severity, and the owner confirms it. The project reports a finding. It does not fix it, and it does not keep a fork of AxiomMath/MMP. If Axiom fixes a defect, the fix is a new commit and a new audit run.

## What the audit does not do

The audit does not check the OpenAI paper of family 056 as a paper. It checks the Lean statements of AxiomMath/MMP against the textbook definitions. Until all eight steps are done with no open finding of severity 1 or 2, the node S22 keeps the status `claimed`, and the site does not call the statement proved.
