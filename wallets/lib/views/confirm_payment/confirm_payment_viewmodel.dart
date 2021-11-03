import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/routes.dart';
import 'package:wallets/services/payments_service.dart';
import 'package:wallets/views/confirm_payment/confirm_payment_view.form.dart';

abstract class ConfirmPaymentViewModel extends FormViewModel {
  bool get canMakePayment;
  Future<void> makePaymentAndReturnHome();

  static ConfirmPaymentViewModel makeInstance(DisplayableWallet recepient) =>
      _ConfirmPaymentViewModel(recepient);
}

class _ConfirmPaymentViewModel extends ConfirmPaymentViewModel {
  final paymentsService = locator<PaymentsService>();
  final navigationService = locator<NavigationService>();

  final DisplayableWallet recepient;
  _ConfirmPaymentViewModel(this.recepient);

  @override
  bool get canMakePayment =>
      amountValue != null && double.parse(amountValue!) > 0;

  @override
  Future<void> makePaymentAndReturnHome() async {
    await paymentsService.makePayment(
      amount: double.parse(amountValue!),
      toAddress: recepient.data.publicAddress,
    );

    return navigationService.clearStackAndShow(Routes.homeView);
  }

  @override
  void setFormStatus() {
    notifyListeners();
  }
}
