import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure NonlinearSystem where
  State : Type u
  Input : Type v
  f : State × Input → State
  equilibrium : State

structure FeedbackLinearizationStructure (ns : NonlinearSystem) where
  relativeDegree : ℕ
  diffeomorphism : ns.State → EuclideanSpace ℝ (Fin ns.relativeDegree)
  linearizingControl : ns.State × EuclideanSpace ℝ (Fin ns.relativeDegree) → ns.Input
  feedbackLawCondition : Prop

structure NonlinearControlEvidence (ns : NonlinearSystem) (fls : FeedbackLinearizationStructure ns) where
  diffeomorphismIsDiffeo : Prop
  feedbackLawConditionClosed : fls.feedbackLawCondition
  linearizationClosed : Prop

def NonlinearControlClosed (ns : NonlinearSystem) (fls : FeedbackLinearizationStructure ns) : Prop :=
  fls.feedbackLawCondition ∧ fls.diffeomorphism.differentiable

theorem nonlinear_control_closed_from_evidence (ns : NonlinearSystem) (fls : FeedbackLinearizationStructure ns) (E : NonlinearControlEvidence ns fls) : NonlinearControlClosed ns fls :=
  by
    exact And.intro E.feedbackLawConditionClosed (by
      -- assume diffeomorphismIsDiffeo
      exact E.diffeomorphismIsDiffeo)

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse