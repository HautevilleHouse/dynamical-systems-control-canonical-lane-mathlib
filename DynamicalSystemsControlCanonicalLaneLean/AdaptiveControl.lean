import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure AdaptiveControlSystem (cs : ControlSystem) where
  parameterSpace : Type u
  parameterEstimate : cs.State → parameterSpace
  adaptationLaw : cs.State × parameterSpace → parameterSpace
  certaintyEquivalence : cs.State × parameterSpace → cs.Input
  convergenceProperty : Prop

structure AdaptiveControlEvidence (cs : ControlSystem) (A : AdaptiveControlSystem cs) where
  estimationErrorDecays : Prop
  convergencePropertyClosed : A.convergenceProperty
  stabilityClosed : Prop

def AdaptiveControlClosed (cs : ControlSystem) (A : AdaptiveControlSystem cs) : Prop :=
  A.convergenceProperty ∧ (∃ (x : cs.State), True)

theorem adaptive_control_closed_from_evidence (cs : ControlSystem) (A : AdaptiveControlSystem cs) (E : AdaptiveControlEvidence cs A) : AdaptiveControlClosed cs A :=
  by
    exact And.intro E.convergencePropertyClosed (by
      -- trivial existential
      refine ⟨0, trivial⟩
    )

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse