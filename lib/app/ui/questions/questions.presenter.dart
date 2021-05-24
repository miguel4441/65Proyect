import 'package:yachaq/app/ui/questions/questions.view.dart';
import 'package:yachaq/domain/repository/questions.repository.dart';

class QuestionsPresenter {
  QuestionsRepository questionsRepository;
  QuestionsView view;

  QuestionsPresenter({this.questionsRepository});

  getQuestions() {
    questionsRepository.questions(
            (questionsListResponse) =>
        {view.getQuestions(questionsListResponse)},
            (message) => {view.onError(message)});
  }
}