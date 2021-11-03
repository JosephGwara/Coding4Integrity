import 'package:wallets/apis/block_scout_api.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/services/organizations_service.dart';

abstract class BlockScoutService {
  Future<double> getZarBalanceOfWallet(String walletAddress);

  Future<FetchTransactionsResults> fetchTransactionsForWallet(
      String walletAddress);

  factory BlockScoutService() = _BlockScoutService;
}

class _BlockScoutService implements BlockScoutService {
  final blockScoutApi = locator<BlockScoutApi>();
  final organizationsService = locator<OrganizationsService>();

  @override
  Future<double> getZarBalanceOfWallet(String walletAddress) {
    return blockScoutApi.getWalletBalance(walletAddress);
  }

  @override
  Future<FetchTransactionsResults> fetchTransactionsForWallet(
      String walletAddress) async {
    final rawTransactions =
        await blockScoutApi.listTransactionsForWallet(walletAddress);

    final identifiableTransactions = <IdentifiableTransaction>[];
    final unidentifiableTransactions = <Transaction>[];

    for (final rawTransaction in rawTransactions) {
      try {
        final fromOrganization = await organizationsService
            .getOrganizationOwningWallet(rawTransaction.fromAddress);
        final toOrganization = await organizationsService
            .getOrganizationOwningWallet(rawTransaction.toAddress);

        identifiableTransactions.add(IdentifiableTransaction(
          fromOrganization: fromOrganization,
          toOrganization: toOrganization,
          data: rawTransaction,
          isPayment: rawTransaction.fromAddress == walletAddress,
        ));
      } on StateError catch (_) {
        print("Unidentifiable transaction");
        unidentifiableTransactions.add(rawTransaction);
      }
    }

    return FetchTransactionsResults(
      allIdentifiableTransactions: identifiableTransactions,
      uniquePayments: organizeUniquePayments(identifiableTransactions),
      unidentifiableTransactions: unidentifiableTransactions,
    );
  }

  Map<Organization, List<IdentifiableTransaction>> organizeUniquePayments(
      List<IdentifiableTransaction> transactions) {
    final out = <Organization, List<IdentifiableTransaction>>{};

    for (final transaction
        in transactions.where((element) => element.isPayment)) {
      final currentPaymentsToOrganization = out[transaction.toOrganization];
      if (currentPaymentsToOrganization == null) {
        out.addAll({
          transaction.toOrganization: [transaction]
        });
      } else {
        out[transaction.toOrganization]?.add(transaction);
      }
    }

    return out;
  }
}
