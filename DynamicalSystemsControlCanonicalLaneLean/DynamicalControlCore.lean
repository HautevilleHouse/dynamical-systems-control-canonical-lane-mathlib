import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure ControlSystem where
  State : Type u
  Input : Type v
  dynamics : State × Input → State
  cost : State × Input → ℝ
  terminalCost : State → ℝ

structure ControlLyapunovEvidence (cs : ControlSystem) where
  lyapunovFunction : cs.State → ℝ
  positiveDefinite : ∀ x ≠ 0, lyapunovFunction x > 0 ∧ lyapunovFunction 0 = 0
  decreasingAlongDynamics : ∀ (x : cs.State) (u : cs.Input),
    lyapunovFunction (cs.dynamics (x, u)) ≤ lyapunovFunction x

structure OptimalControlAdmissibleClass where
  system : ControlSystem
  lyapunovClosed : ControlLyapunovEvidence system
  inputConstraint : Prop

def DynamicalControlClosed (A : OptimalControlAdmissibleClass) : Prop :=
  A.lyapunovClosed.positiveDefinite ∧
  A.lyapunovClosed.decreasingAlongDynamics ∧
  A.inputConstraint

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse