import 'package:wallets/models/models.dart';

abstract class TransactionsService {
  Future<List<DisplayableWalletTransaction>> listAllTransactionsForWallet(
      String walletAddress);

  Future<List<DisplayableWalletTransaction>> listAllUniquePaymentsForWallet(
      String walletAddress);

  Future<DisplayableWallet> getWalletDetails(String walletAddress);
}
