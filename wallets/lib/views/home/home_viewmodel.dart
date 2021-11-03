import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/routes.dart';
import 'package:wallets/services/wallets_service.dart';
import 'package:wallets/shared_ui/listing_view.dart';

abstract class HomeViewModel extends BaseViewModel implements ListingViewModel {
  List<DisplayableWallet> get wallets;

  Future<void> init();
  Future<void> createNewWallet();
  Future<void> openWallet(DisplayableWallet wallet);
  Future<void> initiatePayment();

  static makeInstance() => _HomeViewModel();
}

class _HomeViewModel extends HomeViewModel {
  final navigationService = locator<NavigationService>();
  final walletsService = locator<WalletsService>();

  @override
  List<DisplayableWallet> wallets = [];

  @override
  Future<void> createNewWallet() async {
    final organization =
        await navigationService.navigateTo(Routes.selectOrganizationView);

    if (organization != null) {
      final walletAddress =
          await navigationService.navigateTo(Routes.verifyWalletView);

      if (walletAddress != null) {
        await navigationService.navigateTo(
          Routes.createWalletView,
          arguments: CreateWalletViewArguments(
            organization: organization,
            walletPublicAddress: walletAddress,
          ),
        );
        return _fetchWallets();
      }
    }
  }

  @override
  Future<void> init() {
    return _fetchWallets();
  }

  @override
  Future<void> openWallet(DisplayableWallet wallet) async {
    await navigationService.navigateTo(
      Routes.walletDetailsView,
      arguments: wallet,
    );

    return _fetchWallets();
  }

  Future<void> _fetchWallets() async {
    wallets = await runBusyFuture(walletsService.listCurrentUserWallets());
  }

  @override
  Future<void> addNewItem() {
    return createNewWallet();
  }

  @override
  bool get hasItems => wallets.isNotEmpty;

  @override
  Future<void> retryFetch() {
    return _fetchWallets();
  }

  @override
  Future<void> initiatePayment() async {
    return navigationService.navigateTo(Routes.selectRecepientView);
  }
}
