/-
Step A4 of spec 04.3: the definition index of AxiomMath/MMP at 1f9ade3670.

The index lists every `def`, `abbrev`, `structure`, `class`, `instance`, `inductive`, `opaque` and `axiom` of AxiomMath/MMP and AxiomMath/Stacks in the transitive closure of the statements of the main theorems and of the three other results of step A2. The closure starts from the type of each of the seven theorems. For a definition it follows the type and the value, and for an inductive type or a structure the types of the constructors. It does not follow a theorem, so the proofs are not in the closure. Lean puts the proofs inside a definition into auxiliary theorems `_proof_n`, so those are not followed either. It does not follow a declaration of Mathlib: Mathlib is the vocabulary that the audit takes as given.

The auxiliary declarations (matchers, recursors, constructors, `noConfusion`, internal names) are followed but not listed. Each listed item has its kind, its module, its file and line, the depth (the length of the shortest path from a statement), the statements that reach it, whether its value was visible to the importer (AxiomMath/MMP uses the module system, and a body that is not exposed is hidden), and the first line of its docstring.

The workflow audit-build of tamnd/mmp runs this file with `lake env lean` in the build of step A1, and the file writes `A4.json`.
-/
import MMP

open Lean Meta

namespace AuditA4

/-- The seven theorems of step A2. -/
def roots : List Name := [
  `MMP.Fourfold.Program.IsMaximal.isNefOnCurves_or_isMoriFibreSpace,
  `MMP.Fourfold.Program.isContinuableRay,
  `MMP.Fourfold.Program.n_ne_top_of_isAlgClosed,
  `MMP.Fourfold.projectiveLowerLogMMP_three,
  `MMP.Mori.subsingleton_derivedCohomologyOverField_divisorialSheaf_neg,
  `MMP.Fourfold.rationalBirationalProgramProperty_two,
  `MMP.Mori.IsKltPair.exists_relativeClosedConeOfCurves_eq_add_hull]

/-- The module of a declaration, if it is imported. -/
def moduleOf (env : Environment) (n : Name) : Option Name :=
  (env.getModuleIdxFor? n).bind fun i => env.allImportedModuleNames[i.toNat]?

/-- A declaration is in the scope of the audit when its module is in AxiomMath/MMP or AxiomMath/Stacks. -/
def inScope (env : Environment) (n : Name) : Bool :=
  match moduleOf env n with
  | some m => [`MMP, `Stacks, `StacksCore, `StacksFrontier].contains m.getRoot
  | none => false

/-- An auxiliary declaration is followed but not listed. -/
def isAux (env : Environment) (n : Name) (ci : ConstantInfo) : Bool :=
  n.isInternal || isAuxRecursor env n || isNoConfusion env n || isMatcherCore env n ||
    match ci with
    | .ctorInfo _ | .recInfo _ | .quotInfo _ => true
    | _ => false

def isTheorem : ConstantInfo → Bool
  | .thmInfo _ => true
  | _ => false

/-- The kind of a listed declaration. -/
def kind (env : Environment) (n : Name) (ci : ConstantInfo) : String :=
  if isClass env n then "class"
  else if isStructure env n then "structure"
  else if isInstanceCore env n then "instance"
  else match ci with
    | .defnInfo d => if d.hints.isAbbrev then "abbrev" else "def"
    | .inductInfo _ => "inductive"
    | .opaqueInfo _ => "opaque"
    | .axiomInfo _ => "axiom"
    | _ => "other"

/-- The expressions that the closure follows from a declaration, and whether its value is visible. -/
def parts (env : Environment) (ci : ConstantInfo) : Array Expr × Bool :=
  match ci with
  | .defnInfo d => (#[d.type, d.value], true)
  | .opaqueInfo d => (#[d.type, d.value], true)
  | .inductInfo d =>
    (d.ctors.foldl (fun es c => match env.find? c with
      | some cc => es.push cc.type
      | none => es) #[d.type], true)
  | .ctorInfo d => (#[d.type], true)
  | .recInfo d => (#[d.type], true)
  | .axiomInfo d => (#[d.type], false)
  | ci => (#[ci.type], true)

/-- The closure from one statement: each declaration in scope with its depth. -/
def closure (env : Environment) (root : ConstantInfo) : Std.HashMap Name Nat := Id.run do
  let mut seen : Std.HashSet Name := {}
  let mut out : Std.HashMap Name Nat := {}
  let mut queue : Array (Name × Nat) := root.type.getUsedConstants.map (·, 1)
  let mut i := 0
  while i < queue.size do
    let (n, d) := queue[i]!
    i := i + 1
    if seen.contains n || !inScope env n then continue
    seen := seen.insert n
    let some ci := env.find? n | continue
    if isTheorem ci then continue
    unless isAux env n ci do
      out := out.insert n d
    for e in (parts env ci).1 do
      for c in e.getUsedConstants do
        unless seen.contains c do
          queue := queue.push (c, d + 1)
  return out

def fileOf (m : Name) : String :=
  "/".intercalate (m.components.map (·.toString (escape := false))) ++ ".lean"

def firstLine (s : String) : String :=
  ((s.splitOn "\n").filter (· != "")).headD ""

def run : CoreM Unit := do
  let env ← getEnv
  let mut depth : Std.HashMap Name Nat := {}
  let mut reach : Std.HashMap Name (Array Name) := {}
  let mut missing : Array Json := #[]
  for r in roots do
    let some ci := env.find? r
      | missing := missing.push (toJson r.toString)
    for (n, d) in closure env ci do
      depth := depth.insert n (min d ((depth.get? n).getD d))
      reach := reach.insert n (((reach.get? n).getD #[]).push r)
  let names := depth.toArray.qsort fun a b => a.2 < b.2 || (a.2 == b.2 && a.1.toString < b.1.toString)
  let mut items : Array Json := #[]
  for (n, d) in names do
    let some ci := env.find? n | continue
    let m := (moduleOf env n).getD .anonymous
    let line := (← findDeclarationRanges? n).map (·.range.pos.line)
    let doc := (← findDocString? env n).map firstLine
    items := items.push <| Json.mkObj [
      ("name", toJson n.toString),
      ("kind", toJson (kind env n ci)),
      ("package", toJson (if m.getRoot == `MMP then "MMP" else "Stacks")),
      ("module", toJson m.toString),
      ("file", toJson (fileOf m)),
      ("line", toJson line),
      ("depth", toJson d),
      ("roots", toJson (((reach.get? n).getD #[]).map (·.toString))),
      ("value_visible", toJson (parts env ci).2),
      ("doc", toJson doc)]
  let out := Json.mkObj [
    ("source", toJson "AxiomMath/MMP"),
    ("commit", toJson "1f9ade367087ec711a2ce1382bad279a5a0284c3"),
    ("roots", toJson (roots.map (·.toString))),
    ("missing_roots", Json.arr missing),
    ("count", toJson items.size),
    ("items", Json.arr items)]
  IO.FS.writeFile "A4.json" (out.pretty ++ "\n")
  IO.println s!"A4: {items.size} definitions, {missing.size} statements not found"

end AuditA4

#eval AuditA4.run
