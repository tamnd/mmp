# Request to the Palomar registry and the formalization.yaml schema (Q-14)

Subject: registration of the mmp project, and two new relationships

Dear maintainers,

We ask to register the project mmp in the Palomar registry. The project states the minimal model program in Lean 4 on Mathlib. The repositories are https://github.com/tamnd/mmp and https://github.com/tamnd/mmp-lean, and the metadata is in `formalization.yaml` at the root of both, in the schema of version 0.4.

The file uses two relationships that the schema does not have yet:

1. `audits`: the project reads the definitions and the proofs of another formalization and publishes the findings. Our project audits AxiomMath/MMP at commit 1f9ade3670.
2. `bridges`: the project proves in Lean that its statements agree with the statements of another formalization.

We ask you to add these two values. Until you add them, we can use `uses` with a note, if the schema requires it.

The main statements that we want to register are the statements S04, S10, S11, S12, S20, S22, S33, S40 and S41. Each one has a page with its trust rows on https://mmp.tamnd.com/statements/.

With best regards,

The maintainers of mmp
