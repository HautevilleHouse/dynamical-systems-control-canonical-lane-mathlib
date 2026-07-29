import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsControlCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SystemWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicalSystemsControlCanonicalLaneLean
end HautevilleHouse
