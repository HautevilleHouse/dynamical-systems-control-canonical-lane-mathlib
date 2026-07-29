import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure LQRPackage where
  stateDim : ℕ
  inputDim : ℕ
  A : Matrix (Fin stateDim) (Fin stateDim) ℝ
  B : Matrix (Fin stateDim) (Fin inputDim) ℝ
  Q : Matrix (Fin stateDim) (Fin stateDim) ℝ
  R : Matrix (Fin inputDim) (Fin inputDim) ℝ
  areSolution : Prop

structure LQREvidence (L : LQRPackage) where
  stabilizable : Prop
  detectable : Prop
  areSolutionClosed : L.areSolution
  optimalCost : ℝ
  optimalCostClosed : optimalCost = 0 -- placeholder

def LQRClosed (L : LQRPackage) : Prop :=
  L.areSolution

theorem lqr_closed_from_evidence (L : LQRPackage) (E : LQREvidence L) : LQRClosed L :=
  by
    exact E.areSolutionClosed

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse