import 'package:yachaq/data/rr/response/bienvenida.response.dart';

abstract class BienvenidaUseCase {
  bienvenida(
      Function(List<BienvenidaResponse>) onSuccess, Function(String) onError);
}
