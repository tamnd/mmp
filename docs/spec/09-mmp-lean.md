# 09. tamnd/mmp-lean: the Lean package

## 9.1 Layout and the root name

The root namespace is `MinimalModel`. The name `MMP` is taken by AxiomMath/MMP, and the bridge package imports both (00, decision 3). A shared root would make every bridge file ambiguous.

```
mmp-lean/
├── README.md  CHANGELOG.md  CONTRIBUTING.md  CITATION.cff  NOTICE  LICENSES/
├── lakefile.toml  lean-toolchain  lake-manifest.json
├── MinimalModel.lean                # imports every proved module
├── MinimalModel/
│   ├── Statements/                  # the pinned statements (06); comments; Mathlib + Basic only
│   │   ├── Basic.lean               # the vocabulary of 06.1: IsVariety, Divisor, Pair, IntersectionData, IsKlt, Flip, Program
│   │   ├── Hypotheses.lean          # named Props for unformalized inputs (9.2, rule 2)
│   │   ├── Foundations.lean         # family A: S01 to S09
│   │   ├── LowDim.lean              # family B: S10 to S18
│   │   ├── Termination.lean         # family C: S19 to S29
│   │   ├── Models.lean              # family D: S30 to S39
│   │   ├── Abundance.lean           # family E: S40 to S47
│   │   ├── Boundedness.lean         # family F: S48 to S55
│   │   ├── Effective.lean           # family G: S56, S57
│   │   └── OtherSettings.lean       # family H: S58 to S60
│   ├── Ported/                      # ported sources, licence headers kept (05.4)
│   │   ├── SingularityLean/  TauCeti/  FormalConjectures/  YaelDilliesToric/
│   ├── Schemes/                     # tier T1: normality, prime divisors, Weil and Cartier divisors, canonical divisor
│   ├── Positivity/                  # tier T1: IntersectionData, N¹, cones, nef, ample, big, Iitaka dimension
│   ├── Pairs/                       # tier T4: discrepancies, klt, lc, dlt, mld, lct, log resolutions
│   ├── Foundations/                 # tier T2: the general theorems as statements and their consequences
│   ├── Surface/                     # tier T3: intersection form, Castelnuovo, the surface program
│   ├── Toric/                       # tier T5: route R3, steps 1 to 9
│   │   ├── Fan.lean  Divisor.lean  Cone.lean  Contraction.lean  Flip.lean
│   │   ├── Termination.lean  Mld.lean  ACC.lean  Scheme.lean
│   ├── Reductions/                  # tiers T8 and T9: implications between named Props (S19, S28, S29, S44)
│   ├── Routes/                      # one folder per route of document 04
│   │   ├── R1Claims/  R3Toric/  R4Termination/  R5Abundance/  R6Boundedness/  ...
│   ├── Examples/                    # worked examples and lab certificates, each a node
│   ├── Fidelity/                    # the F2, F3 and F4 files of 06.3, one per statement
│   │   ├── Discrepancy.lean  Flip.lean  Program.lean  Cone.lean  ...
│   └── Bridge/                      # the project's statements ↔ Mathlib, ports, formal-conjectures (06.4)
├── MinimalModel/WIP/                # work with sorry; not imported by MinimalModel.lean
├── bridge/                          # the package MinimalModelBridge (9.4); own lakefile; imports MMP
│   ├── lakefile.toml  lake-manifest.json
│   └── MinimalModelBridge/
│       ├── Vocabulary.lean          # 06.1 ↔ MMP.Mori.* definitions
│       ├── Vanishing.lean  Cone.lean  Surface.lean  Threefold.lean  Fourfold.lean  Toric.lean
│       └── External/                # word-for-word copies of the Axiom statements, with the commit
├── Comparator/                      # the comparator config and the pinned statement list (9.6)
├── manifests/
│   ├── statements.sha256
│   ├── external.sha256              # the copies in bridge/External and Bridge/
│   └── ported.yaml                  # source, commit, licence, paths, date for each port
├── scripts/style.sh  scripts/forbidden.sh  scripts/axioms.lean
└── .github/workflows/  check.yml  build.yml  bridge.yml  bump.yml  trust.yml
```

The map, the records and the site live in `tamnd/mmp`:

```
mmp/
├── README.md  CHANGELOG.md  CONTRIBUTING.md  CITATION.cff  LICENSES/
├── blueprint/
│   ├── nodes/*.yaml                 # the map (08.3)
│   ├── routes.yaml                  # the routes of 04 and their nodes
│   ├── targets.yaml                 # the open targets O-Rk-n of 04
│   ├── reductions.yaml              # the reduction graph of 03.11
│   └── tiers.yaml                   # the tiers of 07
├── papers/*.yaml                    # one record per paper (07.14)
├── claims/*.yaml                    # one record per fresh claim (07.13)
├── audit/axiom-mmp/                 # route R2 (04.3)
│   ├── A1.json  A2.json  A3.json    # machine steps
│   ├── definitions.yaml             # A4: the definition index, 300 to 600 items
│   ├── A5-reading/  A6.md  A7.md  A8.md
│   └── findings/*.yaml              # with severity (14.5)
├── lab/                             # computation specs, runs and certificates (13)
├── records/                         # written by mmp; never edited by hand
│   ├── status.json  trust.json  fidelity.json  axioms.json  index.json  levels.json  runs.jsonl
├── site/                            # pages that are not generated: home, about, trust, program, learn, teach
├── formalization.yaml               # Palomar registration, schema v0.4 (14.6)
├── agent.yaml                       # budget and models for mmp (10.6); no file, no calls
├── wrangler.jsonc
└── .github/workflows/  check.yml  deploy.yml
```

## 9.2 Rules for the Lean code

1. **No `sorry` in the main tree.**
   - `MinimalModel.lean` imports everything outside `WIP/` and `bridge/`.
   - CI fails there on `sorry`, `admit`, a new `axiom`, `opaque`, `native_decide`, `implemented_by` and `@[extern]`.
   - A node with an unfinished proof keeps the proof in `WIP/` and has status `stated`.
   - The `sorry` bodies of 6.1 are filled at S0 before the first merge to `main`.
2. **Hypotheses, not axioms.**
   - A published theorem that is not yet formalized enters as a named `def ... : Prop` in `Statements/Hypotheses.lean`. It is a hypothesis of the theorems that use it, never an `axiom`.
   - The status of those theorems is `proved-mod` (08.3), and the site lists the hypotheses.
   - The first hypotheses, with the node that will discharge each:
     - `HasLogResolution`, shared with spec 2161 (Q-09), until hironaka or a port gives it;
     - `TheoremOfTheBase`, finite dimensionality of $N^1$, until T1-08;
     - `KawamataViehwegVanishing`, until the bridge proves it from Axiom's snc theorem and a port moves it;
     - `ExistenceOfFlips n` and `Termination n`, as inputs to the reductions (S19, S28, S29);
     - `ACCMld n` and `LSCMld n`, as inputs to Shokurov's reduction.
   - Every structure with axioms as fields (`IntersectionData` and others) is treated like a hypothesis: each theorem that takes one also has an instance in `Fidelity/` (06.3, F2; risk 9).
3. **Fresh claims are not hypotheses.** A `claimed` node (07.13) is never a hypothesis of another node. `mmp index` fails if one is. S22 is `claimed` or `proved-ext`, so no node of `MinimalModel` uses it.
4. **Statement files are small and commented.** Everything else may be long. A statement file has a docstring for each definition and each statement, with the informal statement and a reference to the source theorem number.
5. **Mathlib style, Mathlib names.** The code follows the Mathlib naming and style guide, so that parts can go upstream (9.5).
6. **Ported files keep their licence.**
   - A ported file keeps its header and gets a provenance line: `-- Ported from <repo>@<commit>:<path>`.
   - A change to a ported file is a commit of its own with the label `port-change`. Then a diff to the source is always possible.
   - A file written or ported by a model has `ai_written: true` in `manifests/ported.yaml` or in the node, and its definitions need F6 (05.4).
7. **One universe.** Statements are universe polymorphic (`Scheme.{u}`). Only `bridge/` specializes to `Scheme.{0}` (06.5, risk 8).

## 9.3 The toolchain pin

The project starts on Lean `v4.35.0` with the Mathlib tag `v4.35.0` (`56a005855ea17e0b0958f73ec801ae140b0a1679`, 2026-10-13). This is the pin of AxiomMath/MMP, AxiomMath/Stacks, singularity-lean, langlands-lean and hironaka (05.1), so the bridge and the main port sources build without change.

The other ports:
- formal-conjectures is at `v4.33.1`.
- TauCeti and YaelDillies/toric are at `v4.37.0-rc1`.
- The `porter` role moves these to the project pin file by file (05.4).

The bump rule has one constraint that the sibling projects do not have: the bridge package must build at the same pin as AxiomMath/MMP.
- The main package bumps once a month, as in langlands. The first bump is to `v4.36.0` at S1.
- The bridge package stays at the Axiom pin until Axiom bumps. If the main package is ahead, the bridge builds against the last main release at the Axiom pin, and `bridge.yml` reports the gap.
- A gap of more than two releases is a decision for the owner: freeze the main pin, or accept a bridge that checks an older release. The decision goes into the CHANGELOG (Q-07).

After that, the `bump` workflow runs once a month:
1. It opens a pull request with the new `lake-manifest.json`.
2. The `porter` role fixes what breaks.
3. A person merges.

## 9.4 The bridge package

`MinimalModelBridge` is the only package that imports `MMP` (00, decision 7). It has three jobs.
1. **Vocabulary equivalences.** For each definition of 06.1 that AxiomMath/MMP also defines, a theorem that the two agree under the hypotheses of both: `PrimeDivisor`, `QDivisor`, `IsNormalVariety`, `IsKltPair`, `IsLcPair`, `closedConeOfCurves`, `Program`, `IsMaximal`. These are the Lean side of audit step A8.
2. **Statement bridges.** For each row of 06.4, a theorem that proves the project's statement from Axiom's theorem, with the universe set to 0 and the field hypotheses matched. S22 is the main one.
3. **Copies.** `bridge/MinimalModelBridge/External/` has the word-for-word statement of each Axiom theorem used, with the commit, pinned in `manifests/external.sha256`. A new Axiom commit that changes one of them fails `bridge.yml`.

The bridge does not copy proofs out of Axiom. A statement proved only in the bridge has status `proved-ext` (08.3). If a short Axiom proof (under 200 lines, 05.2) is worth porting into `MinimalModel`, it is a port with a `ported.yaml` entry, and it gets a new review.

The bridge build is large: AxiomMath/MMP has 2,269 files and pulls Stacks. `bridge.yml` runs it on a runner with 64 GB of memory and caches the build by commit. The cost estimate is in 10.6.

## 9.5 Upstream

Tiers T1 and T5 are mostly general algebraic geometry and convex geometry that Mathlib does not have yet: Weil divisors on normal schemes, the canonical divisor, fans, and the toric cone theorem.
- Several Mathlib pull requests are open in these areas (05.1): the dual cone and face work on `PointedCone` (#37951 and the conic Carathéodory #44900), and the order of vanishing split (#43273).
- The project does not compete with them. When an open pull request covers a node, the project uses its statement shape and offers its proofs to the author.
- The project writes in Mathlib style and sends parts upstream when they are stable, with the authors listed.
- The Stacks layer is a second upstream. Where AxiomMath/Stacks has a definition that Mathlib lacks, the project uses the same shape and coordinates through the Axiom letter (Q-03).

Upstreaming is slow. The project never waits for it. A module stays in `MinimalModel/` until Mathlib has it, and then becomes a thin file of aliases. The fans of R3 steps 1 and 2 are the first candidates.

## 9.6 The trusted statements and the comparator

`manifests/statements.sha256` has the SHA-256 of each file in `MinimalModel/Statements/`.
- A change to one of those files fails CI unless the same pull request changes the manifest and has the label `statement-change`. That label needs two approvals.
- `lake comparator` (in the trust workflow) checks that each top theorem has exactly the type of its pinned statement. The list of pinned statements is `Comparator/statements.toml`. It also replays the proofs in lean4lean and nanoda.
- The bridge files of 06.4 hold word-for-word copies of external statements with their source commits. They are pinned in `manifests/external.sha256`.
- For the audit (A3), the same comparator runs on the AxiomMath/MMP main theorems against the copies in `External/`. The universe question of Q-07 is decided before that run.

## 9.7 CI

| Workflow | Repository | When | What |
|---|---|---|---|
| `check` | both | each pull request and push | the style script; the forbidden words scan (9.2); `zizmor` on the workflows; for `tamnd/mmp`, a schema check of `blueprint/`, `papers/`, `claims/` and `audit/` |
| `build` | mmp-lean | each pull request and push | `lake exe cache get`, `lake build`, `mmp index`, `mmp trust -quick` (axioms of the changed top theorems); the job uploads `records/` as an artifact |
| `bridge` | mmp-lean | daily, on changes to `bridge/`, by hand | the build of `MinimalModelBridge` with AxiomMath/MMP at the pin; the comparison of `External/` with the Axiom source; `#print axioms` of each bridge theorem |
| `deploy` | mmp | push to `main`, daily, by hand | `mmp site build`, `mmp site check`, `wrangler deploy`; a pull request builds and checks the site but does not deploy |
| `bump` | mmp-lean | monthly, by hand | the toolchain bump of 9.3 |
| `trust` | mmp-lean | weekly, by hand | the full trust run of document 14 |

The full trust run does these checks:
- `lake build` and `lake check`;
- `#print axioms` and a constant walk for every `proved` node;
- replay in `lean4checker --fresh`;
- `lake comparator --paranoid` for the pinned statements, which replays in the independent checkers lean4lean and nanoda;
- the bridge build and its axiom check.

The actions are pinned by commit hash, as in singularity.
