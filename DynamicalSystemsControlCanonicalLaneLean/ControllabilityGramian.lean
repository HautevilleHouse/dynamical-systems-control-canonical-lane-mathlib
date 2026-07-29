import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure ControllabilityGramianPackage where
  stateSpace : Type u
  inputSpace : Type v
  linearDynamics : stateSpace → stateSpace
  inputMatrix : inputSpace → stateSpace
  controllabilityGramian : Type w
  fullRank : Prop
  reachabilityConcluded : Prop

structure ControllabilityGramianEvidence (C : ControllabilityGramianPackage) where
  fullRankClosed : C.fullRank
  reachabilityConcludedClosed : C.reachabilityConcluded

def ControllabilityGramianClosed (C : ControllabilityGramianPackage) : Prop :=
  C.fullRank ∧ C.reachabilityConcluded

theorem controllability_gramian_closed_from_evidence (C : ControllabilityGramianPackage)
    (E : ControllabilityGramianEvidence C) : ControllabilityGramianClosed C := by
  exact And.intro E.fullRankClosed E.reachabilityConcludedClosed

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse
