import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/routes.dart';
import 'package:wallets/services/wallets_service.dart';
import 'package:wallets/views/select_recepient/select_recepient_view.form.dart';

abstract class SelectRecepientViewModel extends FormViewModel {
  List<DisplayableWallet> get filteredRecepients;
  Future<void> fetchAllRecepients();
  Future<void> continueToPay(DisplayableWallet recepient);

  Future<void> init();

  static SelectRecepientViewModel makeInstance() => _SelectRecepientViewModel();
}

class _SelectRecepientViewModel extends SelectRecepientViewModel {
  final navigationService = locator<NavigationService>();
  final walletsService = locator<WalletsService>();

  @override
  Future<void> continueToPay(DisplayableWallet recepient) async {
    return navigationService.navigateTo(Routes.confirmPaymentView,
        arguments: recepient);
  }

  @override
  Future<void> fetchAllRecepients() async {
    recepients =
        await runBusyFuture(walletsService.listAllWalletsIgnoringBalances());
  }

  @override
  List<DisplayableWallet> get filteredRecepients {
    final filter = addressFilterValue ?? "";
    return recepients
        .where((recepient) => recepient.data.publicAddress.contains(filter))
        .toList();
  }

  List<DisplayableWallet> recepients = [];

  @override
  void setFormStatus() {
    notifyListeners();
  }

  @override
  Future<void> init() {
    return fetchAllRecepients();
  }
}
