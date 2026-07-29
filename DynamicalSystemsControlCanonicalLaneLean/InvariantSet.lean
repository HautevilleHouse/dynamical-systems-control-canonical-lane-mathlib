import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure InvariantSetPackage where
  invariantSet : Type u → Type u
  forwardInvariance : Prop
  controlledInvariance : Prop
  barrierCertificate : Type v

def InvariantSetClosed (I : InvariantSetPackage) : Prop :=
  I.forwardInvariance ∧ I.controlledInvariance

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse