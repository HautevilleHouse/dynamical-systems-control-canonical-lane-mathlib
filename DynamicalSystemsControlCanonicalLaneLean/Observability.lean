import canonicalLaneMathlib.Controllability

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

structure ObservabilityPackage (A : AdmissibleClass) where
  observabilityGramian : Type u
  fullRankObs : Prop
  reconstruction : Prop
  observabilityGramianClosed : observabilityGramian
  fullRankObsClosed : fullRankObs
  reconstructionClosed : reconstruction

structure ObservabilityEvidence {A : AdmissibleClass} (O : ObservabilityPackage A) where
  observabilityGramianClosed : O.observabilityGramianClosed
  fullRankObsClosed : O.fullRankObsClosed
  reconstructionClosed : O.reconstructionClosed

def ObservabilityClosed {A : AdmissibleClass} (O : ObservabilityPackage A) : Prop :=
  O.observabilityGramianClosed ∧ O.fullRankObsClosed ∧ O.reconstructionClosed

theorem observability_closed_from_evidence
    {A : AdmissibleClass} (O : ObservabilityPackage A) (E : ObservabilityEvidence O) :
    ObservabilityClosed O := by
  exact And.intro E.observabilityGramianClosed (And.intro E.fullRankObsClosed E.reconstructionClosed)

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse
