import 'package:yachaq/app/ui/general/general.view.dart';
import 'package:yachaq/domain/repository/consultations.repository.dart';

class GeneralPresenter {
  ConsultationsRepository consultationsRepository;
  GeneralView view;

  GeneralPresenter({this.consultationsRepository});

  getUserInformation(String dni, String fnac) {
    view.showLoading();
    consultationsRepository.consultationGeneral(dni, fnac,
            (userInformation, descriptionResponse) {
          view.hideLoading();
          view.getUserInformation(userInformation, descriptionResponse);
        }, (message) {
          view.hideLoading();
          view.onError(message);
        });
  }
}
