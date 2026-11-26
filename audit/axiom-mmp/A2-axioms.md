# A2: axioms of the main theorems of AxiomMath/MMP

Step A2 of spec 04.3 runs `#print axioms` on the four main theorems and the three other results. The expected set is `propext`, `Classical.choice` and `Quot.sound`. Its exit is an axiom report.

The step is not started. It needs the build of step A1, and that build is not done. The state of the step in `records/audit.json` is `not started`. This file is the plan.

## The plan

1. Use the build of step A1 at the commit `1f9ade367087ec711a2ce1382bad279a5a0284c3`, with the toolchain `leanprover/lean4:v4.35.0`.
2. The file `A2.lean` of this directory imports `MMP` and has one `#print axioms` line for each declaration of the table.
3. The workflow `audit-build` runs it with `lake env lean A2.lean` in the build of A1. The full output goes into the artifact `audit-records`, and then into `A2-axioms.log` in this directory.
4. Compare each list with the expected set.
5. Write `A2.json` with one row for each declaration: the name, the axioms, and the answer `yes` or `no`.

| Number | Declaration | Kind |
|---|---|---|
| 1 | `MMP.Fourfold.Program.IsMaximal.isNefOnCurves_or_isMoriFibreSpace` | main |
| 2 | `MMP.Fourfold.Program.isContinuableRay` | main |
| 3 | `MMP.Fourfold.Program.n_ne_top_of_isAlgClosed` | main |
| 4 | `MMP.Fourfold.projectiveLowerLogMMP_three` | main |
| 5 | `MMP.Mori.subsingleton_derivedCohomologyOverField_divisorialSheaf_neg` | other |
| 6 | `MMP.Fourfold.rationalBirationalProgramProperty_two` | other |
| 7 | `MMP.Mori.IsKltPair.exists_relativeClosedConeOfCurves_eq_add_hull` | other |

The names come from the source text (A1-inventory.md). If a name does not resolve in Lean, the report gives the name that Lean prints.

## What to look at

- An axiom outside the expected set is a finding of severity 1.
- `sorryAx` in a list is a finding of severity 1. The text scan of A1 found no `sorry`, so this is not expected.
- `Lean.ofReduceBool` or `Lean.trustCompiler` in a list is a finding of severity 1. The text scan found no `native_decide`.
- `MMP/Attr.lean` imports `Lean` and adds an environment extension for `@[mmp "label"]`. The attribute must not change a proof term. Step A2 records this and step A3 checks it in the replay.
- The 6 macros and the 1 `elab` must not add declarations that the scan does not see. Step A2 lists them with their files.

## Why the text scan is not enough

A text scan sees only the words of the source. An axiom can come from an imported package, such as Stacks or a Mathlib file, or from a macro. Only `#print axioms` on the built environment sees all of them. Step A3 then replays the environment in a second and a third kernel.
