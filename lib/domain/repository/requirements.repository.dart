import 'package:yachaq/data/http_api_rest.dart';
import 'package:yachaq/data/rr/response/requirements.response.dart';
import 'package:yachaq/domain/usecase/requirements.usecase.dart';

class RequirementsRepository implements RequirementsUseCase {

  @override
  requirements(Function(List<RequirementsResponse>) onSuccess, Function(String) onError) {
    HttpResponse.get("https://movil.pension65.gob.pe/bonos/wsconsultarq.php", (response) => onSuccess(RequirementsResponse.listFromJson(response)), (message) => onError(message));
  }

}