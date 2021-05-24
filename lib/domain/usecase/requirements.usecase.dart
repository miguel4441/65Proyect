
import 'package:yachaq/data/rr/response/description.response.dart';
import 'package:yachaq/data/rr/response/requirements.response.dart';

abstract class RequirementsUseCase {
  requirements(Function(List<RequirementsResponse>) onSuccess, Function(String) onError);
}