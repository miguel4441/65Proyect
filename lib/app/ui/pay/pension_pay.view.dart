import 'package:yachaq/app/ui/base/default.view.dart';
import 'package:yachaq/data/rr/response/consultation_pension.response.dart';
import 'package:yachaq/data/rr/response/description.response.dart';


abstract class PensionView extends DefaultView {
  getUserInformation(ConsultationPensionResponse userInformation, DescriptionResponse DescriptionResponse);
}