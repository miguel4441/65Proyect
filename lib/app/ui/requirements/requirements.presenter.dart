import 'package:yachaq/app/ui/requirements/requirements.view.dart';
import 'package:yachaq/domain/repository/requirements.repository.dart';

class RequirementsPresenter {
  RequirementsRepository requirementsRepository;
  RequirementsView view;

  RequirementsPresenter({this.requirementsRepository});

  getRequirements() {
    requirementsRepository.requirements(
            (requirementsListResponse) =>
        {view.getRequirements(requirementsListResponse)},
            (message) => {view.onError(message)});
  }
}
