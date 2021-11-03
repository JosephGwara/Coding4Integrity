import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/services/credentials_service.dart';
import 'package:wallets/views/verify_wallet_view.dart/verify_wallet_view.form.dart';

abstract class VerifyWalletViewModel extends FormViewModel {
  bool get isVerifyingWallet;
  Future<void> verifyWalletAndReturnPublicKey();

  static VerifyWalletViewModel makeInstance() => _VerifyWalletViewModel();
}

class _VerifyWalletViewModel extends VerifyWalletViewModel {
  final navigationService = locator<NavigationService>();
  final credentialsService = locator<CredentialsService>();

  @override
  bool get isVerifyingWallet => isBusy;

  @override
  Future<void> verifyWalletAndReturnPublicKey() {
    final run = () async {
      final publickKey = await credentialsService.walletPrivateKeyToPublicKey(
        privateKeyValue ?? "",
      );
      navigationService.back(result: publickKey);
    };

    return runBusyFuture(run());
  }

  @override
  void setFormStatus() {
    clearErrors();
    notifyListeners();
  }
}
