import 'package:yachaq/app/ui/base/default.view.dart';
import 'package:yachaq/data/rr/response/requirements.response.dart';

abstract class RequirementsView extends DefaultView{
  getRequirements(List<RequirementsResponse> requirements);
}