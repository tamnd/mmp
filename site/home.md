---
title: The minimal model program in Lean
description: A public Lean project that states the minimal model program, proves its known parts, audits the Lean proof of AxiomMath/MMP and checks the fresh claims of 2026.
eyebrow: Open program
lead: Every variety should be birational to a minimal model or to a Mori fibre space. The minimal model program is the algorithm that should find this model, by a sequence of divisorial contractions and flips. The existence of flips, termination and abundance are the steps that are open in general.
doors:
  - title: I know the mathematics
    path: program/
    text: The program, what is known, the open targets and the routes.
  - title: I referee
    path: trust/
    text: The checks that a result must pass, and the state of each check.
  - title: I check AxiomMath/MMP
    path: audit/
    text: The audit of the Lean proof of the lc MMP in dimension at most 4, step by step.
  - title: I am a student
    path: learn/
    text: Reading paths through the handbook, from classical varieties to the open problems.
  - title: I know Lean
    path: code/
    text: The package MinimalModel, its statements, the bridge and how to contribute.
  - title: I am a program
    path: llms.txt
    text: A text map of the site, and the data in JSON at /api/.
---
This project states the minimal model program in Lean 4 with Mathlib. It proves the known parts in an order that leads to the open parts, and it records each step on a map of nodes. A tool computes the status of each node from the Lean build. A person does not set the status by hand.

The general conjectures of the program are open in dimension 4 and higher. No result on this site is a proof of one of them. When a node of an open conjecture changes status, the [trust page](/trust/) shows which checks passed.

AxiomMath/MMP is a Lean proof that every MMP for a projective lc 4-fold with rational boundary terminates. The Lean kernel checked its inferences. Nobody has checked yet that its definitions mean what the textbooks mean. The [audit page](/audit/) shows what the project has checked and what it has not checked.

The project is at milestone S0. The [statements page](/statements/) lists the 60 main statements, and the [map](/map/) shows the status of each node.

The project has four repositories. [tamnd/mmp](https://github.com/tamnd/mmp) has the map, the paper and claim records, the audit records and this site. [tamnd/mmp-lean](https://github.com/tamnd/mmp-lean) has the Lean code. [tamnd/mmp-agent](https://github.com/tamnd/mmp-agent) has the `mmp` command, which checks the map, runs the lab and builds the site. [tamnd/mmp-handbook](https://github.com/tamnd/mmp-handbook) has the handbook, a set of textbooks in PDF and EPUB volumes.
