import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure RobustnessPackage (cs : ControlSystem) where
  disturbance : Type u
  perturbedDynamics : cs.State × cs.Input × disturbance → cs.State
  bound : disturbance → ℝ
  robustStable : Prop

structure RobustnessEvidence (cs : ControlSystem) (R : RobustnessPackage cs) where
  disturbanceBound : ∀ (d : R.disturbance), R.bound d ≥ 0
  robustStableClosed : R.robustStable

def RobustnessClosed (cs : ControlSystem) (R : RobustnessPackage cs) : Prop :=
  (∀ (d : R.disturbance), R.bound d ≥ 0) ∧ R.robustStable

theorem robustness_closed_from_evidence (cs : ControlSystem) (R : RobustnessPackage cs) (E : RobustnessEvidence cs R) : RobustnessClosed cs R :=
  by
    exact And.intro E.disturbanceBound E.robustStableClosed

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse