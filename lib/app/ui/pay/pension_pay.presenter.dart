import 'package:yachaq/app/ui/pay/pension_pay.view.dart';
import 'package:yachaq/domain/repository/consultations.repository.dart';

class PensionPresenter {
  ConsultationsRepository consultationsRepository;
  PensionView view;

  PensionPresenter({this.consultationsRepository});

  getUserInformation(String dni, String fnac) {
    view.showLoading();
    consultationsRepository.consultationPension(dni, fnac,
            (listUserInformation, descriptionInfo) {
          view.hideLoading();
          view.getUserInformation(listUserInformation, descriptionInfo);
        }, (message) {
          view.hideLoading();
          view.onError(message);
        });
  }
}
