import DynamicalSystemsControlCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

def ConstrainedDynamicalClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamical_endgame (A : AdmissibleClass) :
    ConstrainedDynamicalClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse
