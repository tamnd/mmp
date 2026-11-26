/-
Step A2 of spec 04.3: the axioms of the main theorems of AxiomMath/MMP at 1f9ade3670 and of the three other results. The workflow audit-build of tamnd/mmp runs this file with `lake env lean` in the build of step A1. The expected set is `propext`, `Classical.choice` and `Quot.sound`.
-/
import MMP

#print axioms MMP.Fourfold.Program.IsMaximal.isNefOnCurves_or_isMoriFibreSpace
#print axioms MMP.Fourfold.Program.isContinuableRay
#print axioms MMP.Fourfold.Program.n_ne_top_of_isAlgClosed
#print axioms MMP.Fourfold.projectiveLowerLogMMP_three
#print axioms MMP.Mori.subsingleton_derivedCohomologyOverField_divisorialSheaf_neg
#print axioms MMP.Fourfold.rationalBirationalProgramProperty_two
#print axioms MMP.Mori.IsKltPair.exists_relativeClosedConeOfCurves_eq_add_hull
