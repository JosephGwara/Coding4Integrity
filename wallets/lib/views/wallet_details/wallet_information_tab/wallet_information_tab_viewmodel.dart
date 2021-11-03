import 'package:clipboard/clipboard.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';

abstract class WalletInformationTabViewModel extends BaseViewModel {
  Future<void> copyAddressToClipboard(String address);

  static WalletInformationTabViewModel makeInstance() =>
      _WalletInformationTabViewModel();
}

class _WalletInformationTabViewModel extends WalletInformationTabViewModel {
  final snackbarService = locator<SnackbarService>();

  @override
  Future<void> copyAddressToClipboard(String address) async {
    await FlutterClipboard.copy(address);
    snackbarService.showSnackbar(
      message: "Address Copied to Clipboard",
      duration: Duration(seconds: 1),
    );
  }
}
