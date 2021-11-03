import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/services/wallets_service.dart';
import 'package:wallets/views/create_wallet/create_wallet_view.form.dart';

abstract class CreateWalletViewModel extends FormViewModel {
  bool get isCreatingWallet;
  Future<void> createWallet();

  static CreateWalletViewModel makeInstance(
          CreateWalletViewArguments arguments) =>
      _CreateWalletViewModel(arguments);
}

class _CreateWalletViewModel extends CreateWalletViewModel {
  final navigationService = locator<NavigationService>();
  final walletsService = locator<WalletsService>();

  final CreateWalletViewArguments arguments;
  _CreateWalletViewModel(this.arguments);

  @override
  Future<void> createWallet() {
    final run = () async {
      final wallet = await walletsService.createWallet(
        withName: walletNameValue ?? "",
        organizationId: arguments.organization.id,
        publicAddress: arguments.walletPublicAddress,
      );
      navigationService.back(result: wallet);
    };

    return runBusyFuture(run());
  }

  @override
  bool get isCreatingWallet => isBusy;

  @override
  void setFormStatus() {
    clearErrors();
    notifyListeners();
  }
}
