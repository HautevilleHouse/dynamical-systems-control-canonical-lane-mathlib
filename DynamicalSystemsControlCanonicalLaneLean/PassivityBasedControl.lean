import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure PassivityBasedControlPackage where
  storageFunction : Type u
  supplyRate : Type v
  passivityInequality : Prop
  outputFeedbackPassivity : Prop
  asymptoticStabilityViaDamping : Prop

def PassivityBasedControlClosed (P : PassivityBasedControlPackage) : Prop :=
  P.passivityInequality ∧ P.outputFeedbackPassivity ∧ P.asymptoticStabilityViaDamping

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse