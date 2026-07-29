import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure FeedbackStabilizationPackage where
  plantDynamics : Type u
  feedbackLaw : Type v
  closedLoopStable : Prop
  robustToDisturbance : Prop
  stabilizationConcluded : Prop

structure FeedbackStabilizationEvidence (F : FeedbackStabilizationPackage) where
  closedLoopStableClosed : F.closedLoopStable
  robustToDisturbanceClosed : F.robustToDisturbance
  stabilizationConcludedClosed : F.stabilizationConcluded

def FeedbackStabilizationClosed (F : FeedbackStabilizationPackage) : Prop :=
  F.closedLoopStable ∧ F.robustToDisturbance ∧ F.stabilizationConcluded

theorem feedback_stabilization_closed_from_evidence (F : FeedbackStabilizationPackage)
    (E : FeedbackStabilizationEvidence F) : FeedbackStabilizationClosed F := by
  exact And.intro E.closedLoopStableClosed
    (And.intro E.robustToDisturbanceClosed E.stabilizationConcludedClosed)

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse
