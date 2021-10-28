import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Wallet with _$Wallet {
  factory Wallet({
    required String id,
    required String organizationId,
    required String name,
    required double balance,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}

@freezed
class Organization with _$Organization {
  factory Organization({
    required String id,
    required String ownerId,
    required String name,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
}