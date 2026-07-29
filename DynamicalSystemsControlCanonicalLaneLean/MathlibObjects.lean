import DynamicalSystemsControlCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure AdmittedSystem where
  stateSpace : Type
  dynamics : Type
  initialCondition : Type
  control : Type
  stabilityConclusion : stabilityConclusion

structure AdmittedSystem where
  stateSpace : Type
  dynamics : Type
  initialCondition : Type
  control : Type
  stabilityConclusion : stabilityConclusion

structure AdmittedSystem where
  stateSpace : Type
  dynamics : Type
  initialCondition : Type
  control : Type
  stabilityConclusion : stabilityConclusion

def SystemWitnessClosed (S : AdmittedSystem) : Prop :=
  S.stabilityConclusion

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse
