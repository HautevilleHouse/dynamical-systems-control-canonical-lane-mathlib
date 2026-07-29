import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsControlCanonicalLaneLean.StateSpaceModels
import HautevilleHouse.DynamicalSystemsControlCanonicalLaneLean.LyapunovStability

/-!
# Feedback Control Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure FeedbackControlPackage {S : StateSpaceModelsPackage}
    {L : LyapunovStabilityPackage S} where
  controlLaw : S.stateManifold → S.inputSpace
  closedLoopDynamics : S.stateManifold → S.stateManifold
  stabilizationGuarantee : Prop
  robustnessMargin : Prop
  controlLawSmooth : Prop

structure FeedbackControlEvidence {S : StateSpaceModelsPackage}
    {L : LyapunovStabilityPackage S}
    (F : FeedbackControlPackage S L) where
  stabilizationGuaranteeClosed : F.stabilizationGuarantee
  robustnessMarginClosed : F.robustnessMargin
  controlLawSmoothClosed : F.controlLawSmooth

def FeedbackControlClosed {S : StateSpaceModelsPackage}
    {L : LyapunovStabilityPackage S}
    (F : FeedbackControlPackage S L) : Prop :=
  F.stabilizationGuarantee ∧ F.robustnessMargin ∧ F.controlLawSmooth

theorem feedback_control_closed_from_evidence {S : StateSpaceModelsPackage}
    {L : LyapunovStabilityPackage S} (F : FeedbackControlPackage S L)
    (E : FeedbackControlEvidence F) : FeedbackControlClosed F := by
  exact And.intro E.stabilizationGuaranteeClosed
    (And.intro E.robustnessMarginClosed E.controlLawSmoothClosed)

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse