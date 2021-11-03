import 'package:stacked/stacked.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/services/block_scout_service.dart';

abstract class WalletDetailsViewModel extends BaseViewModel {
  int get currentNavBarIndex;
  void selectNavBarItem(int index);

  FetchTransactionsResults get transactions;
  Future<void> fetchTransactionsForWallet();

  Future<void> init();

  static WalletDetailsViewModel makeInstance(DisplayableWallet wallet) =>
      _WalletDetailsViewModel(wallet);
}

class _WalletDetailsViewModel extends WalletDetailsViewModel {
  final DisplayableWallet wallet;
  _WalletDetailsViewModel(this.wallet);

  final blockScoutService = locator<BlockScoutService>();

  @override
  int currentNavBarIndex = 0;

  @override
  void selectNavBarItem(int index) {
    currentNavBarIndex = index;
    notifyListeners();
  }

  @override
  Future<void> fetchTransactionsForWallet() async {
    transactions = await runBusyFuture(blockScoutService
        .fetchTransactionsForWallet(wallet.data.publicAddress));
  }

  @override
  FetchTransactionsResults transactions = FetchTransactionsResults(
    allIdentifiableTransactions: [],
    uniquePayments: {},
    unidentifiableTransactions: [],
  );

  @override
  Future<void> init() {
    return fetchTransactionsForWallet();
  }
}
