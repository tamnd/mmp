# 12. The site: mmp.tamnd.com

The site is static. `mmp site build` (10.1) writes it from three sources:
- `tamnd/mmp`: the map, the records, the claims, the audit and the pages;
- `tamnd/mmp-lean`: the Lean index of `MinimalModel` and of the bridge package `MinimalModelBridge`;
- the handbook build of `tamnd/mmp-handbook`.

The workflow `deploy` of `tamnd/mmp` puts it on the Cloudflare Worker `mmp`. The Worker has no script and serves the files of `public/`. Its configuration is `wrangler.jsonc` in `tamnd/mmp`:

```jsonc
// The Worker that serves mmp.tamnd.com. It has no script: Cloudflare serves the files of public/, which mmp site build writes.
{
  "name": "mmp",
  "compatibility_date": "2026-11-01",
  "workers_dev": true,
  "routes": [{ "pattern": "mmp.tamnd.com", "custom_domain": true }],
  "assets": {
    "directory": "public",
    "html_handling": "auto-trailing-slash",
    "not_found_handling": "404-page"
  }
}
```

The deploy needs the DNS zone `tamnd.com` in the Cloudflare account and a token with Workers and DNS rights in the secrets of `tamnd/mmp`. The custom domain is added by the first deploy. No other service is needed, because the site has no server code, no database and no forms.

The templates, the CSS and the search start as a copy of the `site/` package of langlands-agent, so the four sites (riemann, singularity, langlands, mmp) look like one family. Two pieces are new: the pictures of fans and cones (12.4) and the audit pages.

## 12.1 The home page and its doors

The home page has three parts:
- **The program in one paragraph.** Every variety is birational to a minimal model or to a Mori fibre space, and the minimal model program is the algorithm that should find it. Flips, termination and abundance are the steps that are open in general.
- **One status line, computed from the records.** For example: "statements: N of 60 faithful; toric MMP: proved; surfaces: proved; AxiomMath/MMP audit: A5 of A8; nodes proved: P of Q; claims checked: C of 14".
- **Doors**, as on the sibling sites:

| Door | For | Goes to |
|---|---|---|
| I know the mathematics | experts | `/program/`: the statements, what is known, the open targets and the routes |
| I referee | anyone who checks a claim | `/trust/`, `/audit/` and `/claims/` |
| I am a student | learners | `/learn/`: the reading paths through P0 to P8 and Volumes 0 to 17, by background |
| I teach | teachers | `/teach/`: course plans with chapters, exercises and the parallel textbook |
| I know Lean | Lean users | `/code/`: the package, the statements, the bridge, how to contribute, the ports |
| I am a program | agents and tools | `/llms.txt` and `/api/` |

The `/audit/` door is new in this project. AxiomMath/MMP is the largest Lean source in the field, and the public needs a place that says what has been checked in it and what has not (04.3, 14.3).

## 12.2 The levels report

`mmp levels` (10.1) writes `records/levels.json`. The page `/program/levels/` shows it, and the home page shows its first line. It has one block for each level of 02.3. Each block shows the measure of that level and the records it comes from. No block has a hand-written number.

| Level | Measure on the page | Computed from |
|---|---|---|
| G1 | faithful statements out of 60; for each family A to H of 06.2.2, the counts of `unstated`, `stated` and `faithful`; the six G1b statements with the vocabulary each one waits for | `records/status.json`, `records/fidelity.json` |
| G2 | `proved` nodes of the toric MMP (route R3) and of the surface results; the audit steps A1 to A8 with their state and the findings by severity | `records/status.json`, `audit/axiom-mmp/` |
| G3 | per tier T1 to T9: the counts of `proved`, `proved-mod`, `proved-ext`, `stated` and `unstated`; the named hypotheses still in use; the released handbook volumes | `records/status.json`, `blueprint/nodes/`, the handbook release files |
| G4 | the claims of 01.3 with the state of their check (`reading`, `planned`, `checked`, `gap`, `refuted`); the audit verdict on S22; the partial results of the routes, with their papers | `claims/`, `audit/axiom-mmp/`, `blueprint/targets.yaml` |
| G5 | the open targets of 04 with weight 3 or more, each with its route, its first nodes and their status | `blueprint/targets.yaml`, `records/status.json` |
| G6 | termination in dimension 5, abundance in dimension 4 and nonvanishing in dimension 4: the nodes of each and the reductions that lead to them (03.11) | the reduction graph in `blueprint/reductions.yaml` |

`proved-ext` nodes are counted apart from `proved` nodes in every block (08.3). A G3 count reads, for example, "T8: 3 proved, 5 proved-mod, 4 proved-ext (AxiomMath/MMP at `1f9ade3670`, audit: in progress), 2 stated". The page never adds the columns.

## 12.3 The pages

| Path | Content | Source |
|---|---|---|
| `/program/` | the statements of 03 and 06.2, by family; the table of what is proved and what is open; each with its Lean statement and its fidelity state | `site/program.md`, `records/` |
| `/program/levels/` | the levels report of 12.2 | `records/levels.json` |
| `/program/status/` | the status table by dimension of 11.6: settings by rows, steps of the MMP by columns, each cell with the literature state and the Lean status | `records/status.json`, `papers/` |
| `/statements/` and `/statements/<name>/` | each of the 60 statements: informal statement, Lean statement in full, pair class, coefficients, base and field (00, decision 4), vocabulary status, fidelity rows F1 to F7, bridges to other libraries (06.4) | `MinimalModel/Statements/`, `records/fidelity.json` |
| `/map/` | the map as a graph, filtered by tier, route, level, family or status; the reduction graph as its own view; a node opens its page | `blueprint/nodes/`, `records/status.json` |
| `/node/<tag>/` and `/node/<slug>/` | statement, proof sketch, Lean statement and proof with a link to the source line, uses and used by, papers, ports, external declarations with their audit state, database objects (13.2), Math 2.0 link, handbook section, history | all of the above |
| `/paper/<key>/` | the paper record: metadata, arXiv version, the results the project uses, their nodes and status | `papers/` |
| `/claims/` and `/claims/<key>/` | each fresh claim of route R1 (07.13): what it claims, the parts chosen, the state of each part, the letters to the authors and their answers; a page goes public only after the authors had 30 days to answer (14.4) | `claims/` |
| `/audit/` | the audit of AxiomMath/MMP: the pinned commit, the steps A1 to A8 with their state and date, the axioms report, the replay in two kernels, the definition index of A4, the reading reports of A5 and A6, the findings with severity, the bridge theorems | `audit/axiom-mmp/` |
| `/audit/definitions/` and `/audit/definitions/<decl>/` | each AxiomMath/MMP definition of A4: the Lean text, the textbook definition, the differences, the risk rank (06.5), the signatures of the readers | `audit/axiom-mmp/definitions.yaml`, `A5.md` |
| `/audit/findings/<n>/` | one finding: what, where, severity, the date sent to the authors, their answer; public only after the 30 days of 14.4 for severity 1 and 2 | `audit/axiom-mmp/findings/` |
| `/routes/` and `/routes/<R>/` | each route of 04: the idea, the open targets, the key obstruction, its nodes and a progress bar | `blueprint/routes.yaml`, `blueprint/targets.yaml` |
| `/ports/` | each ported source: licence, commit, files, what the project uses, the bridge | `manifests/ported.yaml` |
| `/lab/` and `/lab/<run>/` | the computations: spec, environment, results, certificates, the node each run supports or refutes | `lab/runs/` |
| `/trust/` | the trust table Q0 to Q10 (14) and the fidelity table (06.3) | `records/trust.json`, `records/fidelity.json` |
| `/learn/` | the start page for students: "where do I start", with three questions about background that lead to a path of 11.5 | `site/learn/`, `build/paths.json` |
| `/learn/paths/<path>/` | one reading path: the chapters in order, the pages, a checkbox per chapter (kept in the browser only) | `build/paths.json` |
| `/learn/status/` | the status table by dimension, with a short text per cell for a student | `records/status.json` |
| `/learn/examples/` and `/learn/examples/<key>/` | the running examples of 11.2.1, each with every place where it is computed, its pictures and its lab notebook | the handbook build, `lab/` |
| `/learn/glossary/` | the glossary of 11.6 | the handbook build |
| `/learn/blackboxes/` | the black box table of 11.6, each with its Lean hypothesis | the handbook build, `records/status.json` |
| `/teach/` and `/teach/<course>/` | course plans built from the handbook (12.5) | `site/teach/` |
| `/handbook/` | the volumes, the PDF and EPUB downloads, the HTML chapters, the edition of each volume | the handbook build |
| `/code/` | the layout of `MinimalModel` and of the bridge, the pin, how to build, the statement files in full, how to contribute | `tamnd/mmp-lean` |
| `/timeline/` | the weekly reports (10.8) and the releases | `reports/` |
| `/search/` | search over nodes, papers, claims, Lean names, audit items and the handbook | built index |
| `/api/nodes.json`, `/api/papers.json`, `/api/claims.json`, `/api/status.json`, `/api/levels.json`, `/api/audit.json` | the data, for programs | `records/`, `audit/` |
| `/llms.txt` | a short text map of the site for language models | generated |

## 12.4 Pictures

The MMP is a geometric subject. A student learns the cone theorem from a picture of $\overline{NE}(X)$, and a toric flip from two triangulations of one cone. The site and the handbook share one set of pictures, built from data, not drawn by hand:
- **Fans and polytopes** of toric varieties in dimension 2 and 3, from the Lean data of `MinimalModel/Toric/` (09.1) or from a lab run. A toric flip is shown as two triangulations, with the sign of $K$ on the wall.
- **Cones of curves** in dimension 2 and 3 (for $\rho \le 3$), as a slice of $N_1(X)_\mathbb{R}$ with the $K$-negative half marked. Examples are $\mathbb{F}_n$, the del Pezzo surfaces of degree 7 and 8, and $\mathbb{P}^1 \times \mathbb{P}^2$.
- **Dual graphs** of resolutions: the ADE graphs, the graphs of $\frac1n(1,q)$ by Hirzebruch-Jung continued fractions, Reid's pagoda.
- **The map and the reduction graph**, as on the sibling sites.

The pictures are SVG files written at build time by `mmp site build` from data files. No JavaScript is needed to see them.

## 12.5 Teaching

A course is the main way in which a student meets the handbook. Each page in `/teach/` lists the weeks, the chapters, the prerequisites, the exercises and the parallel textbook. Solutions go to teachers on request (11.6). The first course plans:

| Course | Weeks | Chapters | Parallel text |
|---|---|---|---|
| Algebraic geometry I | 14 | P3 Ch. 1 to 12 | Vakil; Hartshorne II |
| Algebraic geometry II | 14 | P4 Ch. 1 to 7; P5 Ch. 1 to 7 | Hartshorne III to V |
| Birational geometry of surfaces | 14 | P5 Ch. 5 to 12; Volume 2 | Beauville; Reid 1997 |
| Toric geometry and the toric MMP | 12 | P8 Part C; Volume 3 | Cox-Little-Schenck |
| Positivity and vanishing | 14 | P7; Volume 5 Ch. 1 to 3 | Lazarsfeld |
| Introduction to the MMP | 14 | Volume 1 Ch. 1 to 3; Volumes 4, 6, 7; Volume 8 Ch. 1 to 3 | KM98 Ch. 1 to 3 |
| The proof of BCHM | 14 | Volume 9, with Volume 5 Ch. 4 to 6 | Corti 2007; Hacon-Kovács |
| Boundedness and K-stability | 14 | Volume 12; Volume 14 Ch. 1 to 6 | Birkar ICM 2018; Xu 2025 |
| Formal birational geometry | 10 | Volume 0 Ch. 4; Volume 3 with its Lean parts; the statements of 06.2 | `MinimalModel/Statements/` |

The last course is new. It teaches a student to read and to write the Lean statements of the program, and its final project is one fidelity record (06.3).

## 12.6 Rules

1. **Every number on the site comes from a record.** No page has a hand-written count or status.
2. **No claim without the trust rows.**
   - The home page and `/program/` show the status of each open statement from `records/status.json`.
   - If a node of an open statement becomes `proved`, the site shows "Lean proof, rows Q0 to Qn passed" and links the trust page (14.2).
   - The words "solved" or "proved" for an open conjecture appear only after the claim policy of 06.6 is met.
   - A `proved-ext` node is shown as "proved in AxiomMath/MMP at `<commit>`; audit: `<state>`", never as "proved".
3. **No judgement of other people's work.** A claim page or an audit page reports what a check found, in neutral words. It never says that a paper or a library is wrong. It says, for example, "step X as stated does not follow from Y; here is the Lean counterexample", or "this definition differs from KM98 Definition 2.34 in the following way" (06.6, 14.4).
4. **The literature state and the Lean state are both shown, and never merged** (11, item 3).
5. **Math renders without JavaScript where possible.** KaTeX runs at build time, as on the sibling sites.
6. **`mmp site check`** checks these things:
   - every internal link;
   - every node tag and slug;
   - every Lean link, which must resolve to a line of the pinned commit of `tamnd/mmp-lean` or of AxiomMath/MMP;
   - every database label of 13.2;
   - every handbook link, which must resolve to a section of the current edition;
   - the style rules (no em dash, no en dash, no "we");
   - that each page has a title and a description;
   - that no page about a claim or a finding is public before its date (14.4).
