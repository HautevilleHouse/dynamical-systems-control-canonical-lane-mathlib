import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure FeedbackLinearizationPackage where
  nonlinearSystem : Type u
  diffeomorphism : Type v
  linearizingFeedback : Type w
  exactLinearizationCondition : Prop
  inputOutputLinearizationCondition : Prop

def FeedbackLinearizationClosed (F : FeedbackLinearizationPackage) : Prop :=
  F.exactLinearizationCondition ∧ F.inputOutputLinearizationCondition

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse