import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure OptimalControlPackage where
  costFunctional : Type u
  hamiltonJacobiBellmanEquation : Prop
  optimalPolicy : Type v
  existenceOfOptimalControl : Prop
  uniquenessOfOptimalControl : Prop

def OptimalControlClosed (O : OptimalControlPackage) : Prop :=
  O.hamiltonJacobiBellmanEquation ∧ O.existenceOfOptimalControl ∧ O.uniquenessOfOptimalControl

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse