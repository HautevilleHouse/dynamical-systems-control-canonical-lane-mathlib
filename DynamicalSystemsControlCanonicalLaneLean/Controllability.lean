import canonicalLaneMathlib.LyapunovStability

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure ControllabilityPackage (A : AdmissibleClass) where
  reachableSet : Type u
  controllabilityGramian : Type v
  fullRank : Prop
  reachableSetClosed : reachableSet
  controllabilityGramianClosed : controllabilityGramian
  fullRankClosed : fullRank

structure ControllabilityEvidence {A : AdmissibleClass} (C : ControllabilityPackage A) where
  reachableSetClosed : C.reachableSetClosed
  controllabilityGramianClosed : C.controllabilityGramianClosed
  fullRankClosed : C.fullRankClosed

def ControllabilityClosed {A : AdmissibleClass} (C : ControllabilityPackage A) : Prop :=
  C.reachableSetClosed ∧ C.controllabilityGramianClosed ∧ C.fullRankClosed

theorem controllability_closed_from_evidence
    {A : AdmissibleClass} (C : ControllabilityPackage A) (E : ControllabilityEvidence C) :
    ControllabilityClosed C := by
  exact And.intro E.reachableSetClosed (And.intro E.controllabilityGramianClosed E.fullRankClosed)

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse
