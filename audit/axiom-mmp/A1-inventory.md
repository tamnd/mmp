# A1: inventory of AxiomMath/MMP at 1f9ade3670

Step A1 of spec 04.3 is a clean build at the pinned commit on a large machine. It records the time, the memory, `lake-manifest.json` and the hash of every `.olean`. This file is the first part of the step: the inventory of the source. The build is not done yet. The state of the step in `records/audit.json` is `in progress`.

## What was done on 2026-11-26

- A shallow fetch of https://github.com/AxiomMath/MMP at the commit `1f9ade367087ec711a2ce1382bad279a5a0284c3`. The commit date is 2026-11-16T13:42:13-05:00.
- A count of the files and lines with `git ls-files` and `wc -l`.
- A text scan of all `.lean` files for the words that can hide an unchecked proof.
- A read of `lean-toolchain`, `lakefile.toml` and `lake-manifest.json`.

No step ran Lean. The numbers come from the source text only.

## What is not done

- The clean build. A cold build takes about 6 hours on the bridge runner of spec 09.4 [U]. The machine of this run did not have the disk space for the Mathlib cache and the build.
- The time and the memory of the build.
- The hash of every `.olean`.

Step A1 is done when the build log and the hashes are in this directory.

## The build in CI

The workflow `audit-build` of this repository does the build on the standard runners of GitHub, which have 4 cores and 16 GB of memory, with 16 GB of swap added. The large runner of spec 09.4 is not set up. One job of a standard runner stops after 6 hours, so the workflow builds for at most 120 minutes, saves the partial build in the cache, and starts the next run. The segments are short because two runs of 290 minutes lost the runner, most likely for memory, and with it the build of the segment. The build step also raises the OOM score of the build, so that the kernel kills a lean process rather than the runner agent, and a segment whose lean process was killed counts as unfinished, not as a build error. A third run, of 120 minutes, still lost the runner after 53 minutes, so the build now runs in a systemd scope whose memory is limited to the memory of the machine less 2 GB, with at most 4 GB of swap. Inside the scope the kernel kills a lean process before the machine thrashes, and the runner agent outside it keeps its memory. The scope has `OOMPolicy=continue`, because with the default policy the first kill stopped the whole scope: segments 2 and 3 ended after 341 and 424 seconds with no time record. Each segment records the kernel messages about killed processes in `oom.txt`. Lake does not build a module again when its trace is the same, so the runs add up to one clean build. Each run uploads its time, its peak memory and its log as the artifact `audit-segment-N`. The run that finishes the build uploads the artifact `audit-records`: `lake-manifest.json`, the hash of every `.olean` under `.lake`, the sizes of the builds, and the output of A2 and A4. The time of the build is the sum of the times of the runs, and the memory is the largest peak of one run.

## Source hashes

| Item | Value |
|---|---|
| commit | `1f9ade367087ec711a2ce1382bad279a5a0284c3` |
| git tree hash | `c6878868a0fde59a0b369d068a0ff29635d38a1b` |
| sha256 of `git ls-files -s` | `53ef8f857dd15f90f8b5965ac2d612e2bc70bf05bdaa2cb8b70f421f187e568f` |
| licence | Apache-2.0 |

## Pins

| Package | Version |
|---|---|
| Lean toolchain | `leanprover/lean4:v4.35.0` |
| mathlib | `56a005855ea17e0b0958f73ec801ae140b0a1679` |
| Stacks (AxiomMath/Stacks) | `c496df0d9beea9deaeabcea8492605f9a0a2313b` |
| plausible | `dfa4f381` |
| LeanSearchClient | `d6b4c7be` |
| importGraph | `a41f0e9a` |
| proofwidgets | `df72b022` |
| aesop | `4a174c49` |
| Qq | `dce0ad79` |
| batteries | `66e46918` |
| Cli | `c24fe607` (v4.35.0) |

The build command in the README is `lake exe cache get` and then `lake build`.

## Size

| Item | Count |
|---|---|
| tracked files | 2,276 |
| `.lean` files | 2,269 |
| lines in `.lean` files | 2,054,277 |
| lines in all tracked files | 2,054,717 |
| uses of the attribute `@[mmp ` | 3,723 |
| `theorem` or `lemma` declarations (regex count) | about 67,859 |
| `def`, `abbrev`, `structure`, `class`, `instance` or `inductive` declarations (regex count) | about 11,011 |

The declaration counts come from a regular expression on the source. They are not exact. Step A4 makes the exact index from the build.

Files under `MMP/`, by top-level directory:

| Directory | `.lean` files |
|---|---|
| AlgebraicGeometry | 1,930 |
| AlgebraicTopology | 194 |
| RingTheory | 45 |
| Analysis | 40 |
| Topology | 31 |
| Algebra | 10 |
| Geometry | 8 |
| Combinatorics | 5 |
| LinearAlgebra | 2 |
| FieldTheory | 1 |
| CategoryTheory | 1 |

`MMP/Attr.lean` is the one file at the top of `MMP/`. `MMP.lean` at the root of the repository is the last file. The sum is 2,269.

## Text scan

The scan looks for words that can hide a proof that the kernel does not check. A text scan does not replace step A2: a macro or an imported file can add an axiom that no word shows.

| Pattern | Hits |
|---|---|
| `sorry` | 0 |
| `axiom` declarations | 0 |
| `native_decide` | 0 |
| `opaque` | 0 |
| `implemented_by` or `extern` | 0 |
| `unsafe` | 0 |
| `partial def` | 0 |
| `skipKernelTC` | 0 |
| `ofReduceBool` or `trustCompiler` | 0 |
| the word `admit` | 22, all in comments or docstrings; none is a tactic |

Other features for the later steps:

- `import Lean`: 1 file, `MMP/Attr.lean`. It defines the attribute `@[mmp "label"]` with an environment extension.
- `elab`: 1.
- `macro`: 6.
- `set_option maxHeartbeats`: 4. None sets the value 0.

## Main declarations

The names come from the source text. The namespace is the last open `namespace` before the line.

| Declaration | File and line |
|---|---|
| `MMP.Fourfold.Program.IsMaximal.isNefOnCurves_or_isMoriFibreSpace` | `MMP/AlgebraicGeometry/MMP/Fourfold/AlgClosed/ProgramEndpoints.lean:278` |
| `MMP.Fourfold.Program.isContinuableRay` | `MMP/AlgebraicGeometry/MMP/Fourfold/AlgClosed/RayContinuable.lean:241` |
| `MMP.Fourfold.Program.n_ne_top_of_isAlgClosed` | `MMP/AlgebraicGeometry/MMP/Fourfold/AlgClosed/Termination.lean:63` |
| `MMP.Fourfold.projectiveLowerLogMMP_three` | `MMP/AlgebraicGeometry/MMP/Threefold/LogMMP.lean:1618` |
| `MMP.Mori.subsingleton_derivedCohomologyOverField_divisorialSheaf_neg` | `MMP/AlgebraicGeometry/Vanishing/KawamataViehweg.lean:190` |
| `MMP.Fourfold.rationalBirationalProgramProperty_two` | `MMP/AlgebraicGeometry/MMP/Surface/RationalBirationalProgram.lean:945` |
| `MMP.Mori.IsKltPair.exists_relativeClosedConeOfCurves_eq_add_hull` | `MMP/AlgebraicGeometry/MMP/ConeTheorem/RelativeConeTheorem.lean:164` |

The file `DltRelativeConeTheorem.lean` has a version for dlt pairs at line 245.

## The README

The README of the repository says these things:

- The code has no `sorry`, no `native_decide` and no added axiom.
- `#print axioms` gives `propext`, `Classical.choice` and `Quot.sound`.
- The code "has not yet been reviewed by humans".

The text scan agrees with the first item. Step A2 checks the second item. The audit as a whole is the answer to the third item.
