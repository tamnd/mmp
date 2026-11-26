#!/usr/bin/env python3
"""Check, elaborate and score the eval sets of spec 10.9.

The sets are in eval/:
- eval/tasks: 200 Lean tasks with a known answer. A task is the statement of a theorem of Mathlib or of mmp-lean at a pinned commit, and the answer is its proof.
- eval/statements: 50 informal statements, each with its reviewed Lean statement and one planted wrong statement.
- eval/audit: 60 definitions with their reference text. 30 have a planted difference and 30 are faithful.

Commands:
  eval.py check
      Check the format of the three sets. It needs no Lean. The lint workflow runs it.
  eval.py elab --lean ROOT [--jobs N] [--only tasks|statements|audit]
      Put each Lean text of the sets into its file at the pinned commit and run `lake env lean` on it in the Lake project ROOT, a checkout of mmp-lean at the pin with Mathlib in .lake/packages. Each answer of a task, each faithful and each planted statement, and each definition must elaborate. The planted texts are wrong but well typed. The workflow eval of mmp-lean runs it.
  eval.py score ANSWERS
      Score the answers of a runner. ANSWERS is a JSON Lines file. Each line is {"id": ..., "verdict": ...} for a statement or a definition, or {"id": ..., "pass": true|false} for a task, from `eval.py elab` on the candidate proof. A statement has two questions, `Snnn.faithful` and `Snnn.planted`, and the verdict is "faithful" or "wrong". A definition has one question, `Annn`, and the verdict is "faithful" or "planted". An optional "cost" field, in US dollars, is summed. The script prints the pass rate of each set and the total cost.

The script uses only the standard library. It reads the YAML of the sets with a small reader for the form that the sets use: one key and a scalar per line, and block scalars after `|`.
"""

import concurrent.futures
import json
import pathlib
import re
import subprocess
import sys
import tempfile

ROOT = pathlib.Path(__file__).resolve().parent.parent
EVAL = ROOT / "eval"
PINS = {
    "mathlib4": ("leanprover-community/mathlib4", "56a005855ea17e0b0958f73ec801ae140b0a1679"),
}
SETS = {
    "tasks": ("T", 200, ["id", "source", "repo", "commit", "file", "line", "end", "name", "from", "license", "statement", "answer"]),
    "statements": ("S", 50, ["id", "source", "repo", "commit", "file", "line", "end", "name", "from", "license", "informal", "faithful", "planted", "defect"]),
    "audit": ("A", 60, ["id", "source", "repo", "commit", "file", "line", "end", "name", "from", "license", "reference", "lean", "planted"]),
}
KEY = re.compile(r"^([a-z]+): ?(.*)$")


def read(path: pathlib.Path) -> dict:
    """Read one file of a set."""
    out: dict = {}
    lines = path.read_text(encoding="utf-8").split("\n")
    i = 0
    while i < len(lines):
        line = lines[i]
        if not line:
            i += 1
            continue
        m = KEY.match(line)
        if not m:
            raise ValueError(f"{path}:{i + 1}: not a key")
        key, value = m.groups()
        if key in out:
            raise ValueError(f"{path}:{i + 1}: key {key} twice")
        if value == "|":
            block = []
            i += 1
            while i < len(lines) and (lines[i].startswith("  ") or lines[i] == ""):
                block.append(lines[i][2:])
                i += 1
            while block and block[-1] == "":
                block.pop()
            out[key] = "\n".join(block)
            continue
        if value.startswith('"'):
            value = json.loads(value)
        elif re.fullmatch(r"\d+", value):
            value = int(value)
        elif value in ("true", "false"):
            value = value == "true"
        out[key] = value
        i += 1
    return out


def load(name: str) -> list[dict]:
    return [read(p) for p in sorted((EVAL / name).glob("*.yaml"))]


def check() -> list[str]:
    faults = []
    names: dict[str, str] = {}
    for name, (prefix, count, keys) in SETS.items():
        try:
            items = load(name)
        except ValueError as e:
            faults.append(str(e))
            continue
        if len(items) != count:
            faults.append(f"eval/{name}: {len(items)} items, spec 10.9 asks for {count}")
        for n, x in enumerate(items, 1):
            where = f"eval/{name}/{x.get('id')}"
            if x.get("id") != f"{prefix}{n:03d}":
                faults.append(f"{where}: the id is not {prefix}{n:03d}")
            missing = [k for k in keys if k not in x]
            extra = [k for k in x if k not in keys and k != "defect"]
            if missing:
                faults.append(f"{where}: missing {', '.join(missing)}")
            if extra:
                faults.append(f"{where}: unknown keys {', '.join(extra)}")
            if x.get("source") == "mathlib4":
                if (x.get("repo"), x.get("commit")) != PINS["mathlib4"]:
                    faults.append(f"{where}: not the pinned Mathlib commit")
            elif x.get("source") == "mmp-lean":
                if x.get("repo") != "tamnd/mmp-lean" or not re.fullmatch(r"[0-9a-f]{40}", str(x.get("commit"))):
                    faults.append(f"{where}: not a commit of tamnd/mmp-lean")
            else:
                faults.append(f"{where}: unknown source {x.get('source')}")
            if not (isinstance(x.get("line"), int) and isinstance(x.get("end"), int) and x["line"] <= x["end"]):
                faults.append(f"{where}: bad line range")
            if x.get("from") not in ("S0", "S2"):
                faults.append(f"{where}: from is S0 or S2")
            key = f"{name}:{x.get('name')}"
            if key in names:
                faults.append(f"{where}: {x.get('name')} is also {names[key]}")
            names[key] = x.get("id", "")
            if name == "statements":
                if x.get("faithful") == x.get("planted"):
                    faults.append(f"{where}: the planted statement is the faithful one")
                if not x.get("defect"):
                    faults.append(f"{where}: no defect")
            if name == "audit":
                if not isinstance(x.get("planted"), bool):
                    faults.append(f"{where}: planted is true or false")
                if x.get("planted") is True and not x.get("defect"):
                    faults.append(f"{where}: a planted definition needs a defect")
                if x.get("planted") is False and "defect" in x:
                    faults.append(f"{where}: a faithful definition has no defect")
        if name == "audit":
            planted = sum(1 for x in items if x.get("planted") is True)
            if planted != 30:
                faults.append(f"eval/audit: {planted} planted definitions, spec 10.9 asks for 30")
        if name == "tasks":
            own = sum(1 for x in items if x.get("from") == "S2")
            if own == 0:
                faults.append("eval/tasks: no task from the history of the project (spec 10.9 from S2)")
    return faults


def texts(only: str | None):
    """Yield (label, item, text) for each Lean text that must elaborate."""
    if only in (None, "tasks"):
        for x in load("tasks"):
            yield x["id"], x, x["statement"] + " :=\n  " + x["answer"].replace("\n", "\n  ")
    if only in (None, "statements"):
        for x in load("statements"):
            yield x["id"] + ".faithful", x, x["faithful"]
            yield x["id"] + ".planted", x, x["planted"]
    if only in (None, "audit"):
        for x in load("audit"):
            yield x["id"], x, x["lean"]


def head(repo: pathlib.Path) -> str:
    return subprocess.run(["git", "rev-parse", "HEAD"], cwd=repo, capture_output=True, text=True, check=True).stdout.strip()


def source(lean: pathlib.Path, x: dict, heads: dict) -> str:
    """The text of the file of the item at its pinned commit."""
    repo = lean if x["source"] == "mmp-lean" else lean / ".lake" / "packages" / "mathlib"
    if repo not in heads:
        heads[repo] = head(repo)
    if heads[repo] == x["commit"]:
        return (repo / x["file"]).read_text(encoding="utf-8")
    if x["source"] != "mmp-lean":
        raise SystemExit(f"{repo} is at {heads[repo]}, and {x['id']} pins {x['commit']}")
    show = subprocess.run(["git", "show", f"{x['commit']}:{x['file']}"], cwd=repo, capture_output=True, text=True)
    if show.returncode != 0:
        raise SystemExit(f"{x['id']}: git show {x['commit']}:{x['file']} failed; fetch the full history of mmp-lean")
    return show.stdout


def elab(lean: pathlib.Path, jobs: int, only: str | None) -> int:
    tmp = pathlib.Path(tempfile.mkdtemp(prefix="eval-", dir=lean))
    work = []
    heads: dict = {}
    for label, x, text in texts(only):
        lines = source(lean, x, heads).split("\n")
        body = lines[: x["line"] - 1] + text.split("\n")
        path = tmp / (label.replace(".", "_") + ".lean")
        path.write_text("\n".join(body) + "\n", encoding="utf-8")
        work.append((label, path))

    def run(item):
        label, path = item
        r = subprocess.run(["lake", "env", "lean", str(path)], cwd=lean, capture_output=True, text=True)
        out = (r.stdout + r.stderr).strip()
        bad = r.returncode != 0 or re.search(r"\berror\b", out) is not None or "declaration uses 'sorry'" in out
        return label, not bad, out

    failed = 0
    with concurrent.futures.ThreadPoolExecutor(max_workers=jobs) as pool:
        for label, ok, out in pool.map(run, work):
            print(f"{label}\t{'ok' if ok else 'FAIL'}", flush=True)
            if not ok:
                failed += 1
                print("\n".join("    " + l for l in out.split("\n")[:20]), flush=True)
    print(f"{len(work) - failed} of {len(work)} texts elaborate")
    return 1 if failed else 0


def score(answers: pathlib.Path) -> int:
    got = {}
    cost = 0.0
    for n, line in enumerate(answers.read_text(encoding="utf-8").split("\n"), 1):
        if not line.strip():
            continue
        a = json.loads(line)
        got[a["id"]] = a
        cost += float(a.get("cost", 0))
    rows = []
    tasks = load("tasks")
    rows.append(("tasks", sum(1 for x in tasks if got.get(x["id"], {}).get("pass") is True), len(tasks)))
    st = load("statements")
    right = 0
    for x in st:
        right += got.get(x["id"] + ".faithful", {}).get("verdict") == "faithful"
        right += got.get(x["id"] + ".planted", {}).get("verdict") == "wrong"
    rows.append(("statements", right, 2 * len(st)))
    au = load("audit")
    right = sum(1 for x in au if got.get(x["id"], {}).get("verdict") == ("planted" if x["planted"] else "faithful"))
    rows.append(("audit", right, len(au)))
    for name, r, n in rows:
        print(f"{name}\t{r}/{n}\t{100 * r / n:.1f}%")
    print(f"cost\t${cost:.2f}")
    return 0


def main(argv: list[str]) -> int:
    if not argv or argv[0] in ("-h", "--help"):
        print(__doc__)
        return 0
    if argv[0] == "check":
        faults = check()
        for f in faults:
            print(f)
        if not faults:
            print("eval: 200 tasks, 50 statements, 60 definitions")
        return 1 if faults else 0
    if argv[0] == "elab":
        args = dict(zip(argv[1::2], argv[2::2]))
        if "--lean" not in args:
            print("eval.py elab --lean ROOT [--jobs N] [--only tasks|statements|audit]")
            return 2
        return elab(pathlib.Path(args["--lean"]).resolve(), int(args.get("--jobs", "4")), args.get("--only"))
    if argv[0] == "score" and len(argv) == 2:
        return score(pathlib.Path(argv[1]))
    print(__doc__)
    return 2


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
