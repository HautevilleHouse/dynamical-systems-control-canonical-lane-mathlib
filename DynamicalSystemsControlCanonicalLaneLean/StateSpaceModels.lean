import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure StateSpacePackage where
  stateSet : Type u
  topology : TopologicalSpace stateSet
  smoothStructure : Prop
  controlSet : Type v
  dynamics : stateSet → controlSet → stateSet
  initialCondition : stateSet
  smoothDynamics : Prop

def StateSpaceClosed (S : StateSpacePackage) : Prop :=
  S.smoothStructure ∧ S.smoothDynamics

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse