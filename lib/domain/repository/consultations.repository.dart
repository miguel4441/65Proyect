import 'package:yachaq/data/http_api_rest.dart';
import 'package:yachaq/data/rr/response/consultation_general.response.dart';
import 'package:yachaq/data/rr/response/consultation_pension.response.dart';
import 'package:yachaq/data/rr/response/description.response.dart';
import 'package:yachaq/data/rr/response/description_general.response.dart';
import 'package:yachaq/domain/usecase/consultations.usecase.dart';

class ConsultationsRepository implements ConsultationUseCase {

  @override
  consultationGeneral(String dni, String fnac, Function(ConsultationGeneralResponse, DescriptionGeneralResponse) onSuccess, Function(String) onError) {
    HttpResponse.get("https://movil.pension65.gob.pe/bonos/wsconsultageneral.php?valdni=$dni&valfnaci=$fnac", (response) => onSuccess(ConsultationGeneralResponse.fromJson(response[0]), DescriptionGeneralResponse.fromJson(response[1])), (message) => onError(message));
  }

  @override
  consultationPension(String dni, String fnac, Function(ConsultationPensionResponse, DescriptionResponse) onSuccess, Function(String) onError) {
    HttpResponse.get("https://movil.pension65.gob.pe/bonos/wsconsultap65.php?valdni=$dni&valfnaci=$fnac", (response) => onSuccess(ConsultationPensionResponse.fromJson(response[0]), DescriptionResponse.fromJson(response[1])), (message) => onError(message));
  }


}