import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure ControlLyapunovPackage where
  systemDynamics : Type u
  equilibrium : systemDynamics
  lyapunovFunction : Type v
  positiveDefinite : Prop
  derivativeNegative : Prop
  stabilityConcluded : Prop

structure ControlLyapunovEvidence (C : ControlLyapunovPackage) where
  positiveDefiniteClosed : C.positiveDefinite
  derivativeNegativeClosed : C.derivativeNegative
  stabilityConcludedClosed : C.stabilityConcluded

def ControlLyapunovClosed (C : ControlLyapunovPackage) : Prop :=
  C.positiveDefinite ∧ C.derivativeNegative ∧ C.stabilityConcluded

theorem control_lyapunov_closed_from_evidence (C : ControlLyapunovPackage)
    (E : ControlLyapunovEvidence C) : ControlLyapunovClosed C := by
  exact And.intro E.positiveDefiniteClosed
    (And.intro E.derivativeNegativeClosed E.stabilityConcludedClosed)

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse
