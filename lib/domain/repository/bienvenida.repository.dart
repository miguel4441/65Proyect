import 'package:yachaq/data/http_api_rest.dart';
import 'package:yachaq/data/rr/response/bienvenida.response.dart';
import 'package:yachaq/domain/usecase/bienvenida.usecase.dart';

class BienvenidaRepository implements BienvenidaUseCase {
  @override
  // ignore: missing_return
  Future<List<BienvenidaResponse>> bienvenida(
      Function(List<BienvenidaResponse> bienvenidaList) onSuccess,
      Function(String) onError) async {
    await HttpResponse.get(
        "https://movil.pension65.gob.pe/bonos/wsconsultabienvenida.php",
        (response) => onSuccess(BienvenidaResponse.listFromJson(response)),
        (message) => onError(message));
  }
}
