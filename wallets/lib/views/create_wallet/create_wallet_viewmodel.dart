import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/services/wallets_service.dart';
import 'package:wallets/views/create_wallet/create_wallet_view.form.dart';

abstract class CreateWalletViewModel extends FormViewModel {
  bool get isCreatingWallet;
  Future<void> createWallet();

  static CreateWalletViewModel makeInstance(Organization organization) =>
      _CreateWalletViewModel(organization);
}

class _CreateWalletViewModel extends CreateWalletViewModel {
  final navigationService = locator<NavigationService>();
  final walletsService = locator<WalletsService>();

  final Organization organization;
  _CreateWalletViewModel(this.organization);

  @override
  Future<void> createWallet() {
    final run = () async {
      final wallet = await walletsService.createWallet(
        withName: walletNameValue ?? "",
        organizationId: organization.id,
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
