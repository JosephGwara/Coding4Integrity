import 'package:stacked/stacked.dart';

abstract class WalletDetailsViewModel extends BaseViewModel {
  int get currentNavBarIndex;
  void selectNavBarItem(int index);

  static WalletDetailsViewModel makeInstance() => _WalletDetailsViewModel();
}

class _WalletDetailsViewModel extends WalletDetailsViewModel {
  @override
  int currentNavBarIndex = 0;

  @override
  void selectNavBarItem(int index) {
    currentNavBarIndex = index;
    notifyListeners();
  }
}
