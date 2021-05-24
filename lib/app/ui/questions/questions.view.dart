import 'package:yachaq/app/ui/base/default.view.dart';
import 'package:yachaq/data/rr/response/questions.response.dart';


abstract class QuestionsView extends DefaultView{
  getQuestions(List<QuestionResponse> questions);
}