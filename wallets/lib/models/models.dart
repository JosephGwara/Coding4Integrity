import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Wallet with _$Wallet {
  factory Wallet({
    required String publicAddress,
    required String organizationId,
    required String name,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}

@freezed
class DisplayableWallet with _$DisplayableWallet {
  factory DisplayableWallet({
    required String organizationName,
    required Wallet data,
    required double balance,
  }) = _DisplayableWallet;
}

@freezed
class Organization with _$Organization {
  factory Organization({
    required String id,
    required String ownerId,
    required String name,
    required String entepriseNumber,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
}

@freezed
class IdentifiableTransaction with _$IdentifiableTransaction {
  factory IdentifiableTransaction({
    required Organization fromOrganization,
    required Organization toOrganization,
    required Transaction data,

    // True when [amount] went out of the wallet.
    // And false when [amount] went into the wallet.
    required bool isPayment,
  }) = _DisplayableWalletTransaction;
}

@freezed
class CreateWalletViewArguments with _$CreateWalletViewArguments {
  factory CreateWalletViewArguments({
    required Organization organization,
    required String walletPublicAddress,
  }) = _CreateWalletViewArguments;
}

@freezed
class Transaction with _$Transaction {
  factory Transaction({
    required String fromAddress,
    required String toAddress,
    required double amount,
    required DateTime dateTime,
  }) = _Transaction;
}

@freezed
class FetchTransactionsResults with _$FetchTransactionsResults {
  factory FetchTransactionsResults({
    required List<IdentifiableTransaction> allIdentifiableTransactions,
    required Map<Organization, List<IdentifiableTransaction>> uniquePayments,
    required List<Transaction> unidentifiableTransactions,
  }) = _FetchTransactionsResults;
}
