import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wallets/config/firestore_constants.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/services/block_scout_service.dart';
import 'package:wallets/services/organizations_service.dart';

abstract class WalletsService {
  Future<Wallet> createWallet(
      {required String withName,
      required String publicAddress,
      required String organizationId});

  Future<void> deleteWalletWithId(String walletId);
  Future<Wallet> getWalletWithId(String walletId);

  Future<List<DisplayableWallet>> listCurrentUserWallets();

  factory WalletsService() = _WalletsService;
}

class _WalletsService implements WalletsService {
  final firestore = locator<FirebaseFirestore>();
  final blockScoutService = locator<BlockScoutService>();

  OrganizationsService get organizationsService =>
      locator<OrganizationsService>();

  @override
  Future<Wallet> createWallet(
      {required String withName,
      required String publicAddress,
      required String organizationId}) async {
    if (withName.isEmpty) throw ArgumentError("Wallet name cannot be empty.");

    final alreadyExists = await _walletAlreadyExists(publicAddress);
    if (alreadyExists) {
      throw StateError(
          "A wallet with the given public key has already been added. Try using a different private.");
    }

    final wallet = Wallet(
      publicAddress: publicAddress,
      organizationId: organizationId,
      name: withName,
    );

    await firestore
        .collection(ksWalletsCollection)
        .doc(publicAddress)
        .set(wallet.toJson());

    return wallet;
  }

  @override
  Future<void> deleteWalletWithId(String walletId) {
    throw UnimplementedError();
  }

  @override
  Future<List<DisplayableWallet>> listCurrentUserWallets() async {
    final out = <DisplayableWallet>[];

    final userOrganizations =
        await organizationsService.listCurrentUserOrganizations();

    for (final organization in userOrganizations) {
      final walletsData = await firestore
          .collection(ksWalletsCollection)
          .where("organizationId", isEqualTo: organization.id)
          .get();

      for (final walletData in walletsData.docs) {
        final wallet = Wallet.fromJson(walletData.data());

        out.add(
          DisplayableWallet(
            organizationName: organization.name,
            data: wallet,
            balance: await blockScoutService
                .getZarBalanceOfWallet(wallet.publicAddress),
          ),
        );
      }
    }

    return out;
  }

  Future<bool> _walletAlreadyExists(String walletAddress) async {
    final doc = await firestore
        .collection(ksWalletsCollection)
        .doc(walletAddress)
        .get();

    return doc.exists;
  }

  @override
  Future<Wallet> getWalletWithId(String walletId) async {
    final doc =
        await firestore.collection(ksWalletsCollection).doc(walletId).get();

    if (!doc.exists) throw StateError("Wallet does not exists");

    return Wallet.fromJson(doc.data()!);
  }
}
