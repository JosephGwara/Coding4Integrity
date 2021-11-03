import 'package:wallets/apis/block_scout_api.dart';
import 'package:wallets/locator.dart';

abstract class BlockScoutService {
  Future<double> getZarBalanceOfWallet(String walletAddress);

  factory BlockScoutService() = _BlockScoutService;
}

class _BlockScoutService implements BlockScoutService {
  final blockScoutApi = locator<BlockScoutApi>();

  @override
  Future<double> getZarBalanceOfWallet(String walletAddress) {
    return blockScoutApi.getWalletBalance(walletAddress);
  }
}
