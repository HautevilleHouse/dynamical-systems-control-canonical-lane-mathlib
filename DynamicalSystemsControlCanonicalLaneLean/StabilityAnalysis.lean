import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure StabilityPackage (cs : ControlSystem) where
  equilibrium : cs.State
  locallyAsymptoticallyStable : Prop
  lyapunovCertificate : ControlLyapunovEvidence cs

structure StabilityEvidence (cs : ControlSystem) (S : StabilityPackage cs) where
  equilibriumStable : S.locallyAsymptoticallyStable
  lyapunovDecreasing : S.lyapunovCertificate.decreasingAlongDynamics

def StabilityClosed (cs : ControlSystem) (S : StabilityPackage cs) : Prop :=
  S.locallyAsymptoticallyStable ∧
  S.lyapunovCertificate.decreasingAlongDynamics

theorem stability_closed_from_evidence (cs : ControlSystem) (S : StabilityPackage cs) (E : StabilityEvidence cs S) : StabilityClosed cs S :=
  by
    exact And.intro E.equilibriumStable E.lyapunovDecreasing

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse