import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsControlCanonicalLaneLean.StateSpaceModels

/-!
# Controllability and Observability Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure ControllabilityObservabilityPackage {S : StateSpaceModelsPackage} where
  controllabilityMatrix : Type u
  observabilityMatrix : Type v
  controllabilityRankCondition : Prop
  observabilityRankCondition : Prop
  controllable : Prop
  observable : Prop

structure ControllabilityObservabilityEvidence {S : StateSpaceModelsPackage}
    (C : ControllabilityObservabilityPackage S) where
  controllabilityRankConditionClosed : C.controllabilityRankCondition
  observabilityRankConditionClosed : C.observabilityRankCondition
  controllableClosed : C.controllable
  observableClosed : C.observable

def ControllabilityObservabilityClosed {S : StateSpaceModelsPackage}
    (C : ControllabilityObservabilityPackage S) : Prop :=
  C.controllabilityRankCondition ∧ C.observabilityRankCondition ∧
  C.controllable ∧ C.observable

theorem controllability_observability_closed_from_evidence {S : StateSpaceModelsPackage}
    (C : ControllabilityObservabilityPackage S)
    (E : ControllabilityObservabilityEvidence C) :
    ControllabilityObservabilityClosed C := by
  exact And.intro E.controllabilityRankConditionClosed
    (And.intro E.observabilityRankConditionClosed
      (And.intro E.controllableClosed E.observableClosed))

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse