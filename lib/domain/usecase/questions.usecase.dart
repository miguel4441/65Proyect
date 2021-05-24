import 'package:yachaq/data/rr/response/questions.response.dart';


abstract class QuestionsUseCase {
  questions(Function(List<QuestionResponse>) onSuccess, Function(String) onError);
}

