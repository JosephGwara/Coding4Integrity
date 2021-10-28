import 'package:wallets/models/models.dart';

abstract class WalletsService {
  Future<Wallet> createWallet(
      {required String withName, required String organizationId});

  Future<void> deleteWalletWithId(String walletId);

  Future<List<Wallet>> listCurrentUserWallets();

  factory WalletsService() = _WalletsService;
}

// TODO: Connect to backend
class _WalletsService implements WalletsService {
  @override
  Future<Wallet> createWallet(
      {required String withName, required String organizationId}) async {
    await Future.delayed(Duration(seconds: 2));

    return Wallet(
      id: "id",
      organizationId: "organizationId",
      name: "name",
      balance: 0.0,
    );
  }

  @override
  Future<void> deleteWalletWithId(String walletId) {
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Future<List<Wallet>> listCurrentUserWallets() async {
    await Future.delayed(Duration(seconds: 2));

    return [];
  }
}
