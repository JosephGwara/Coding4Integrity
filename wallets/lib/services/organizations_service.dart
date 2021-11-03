import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wallets/config/firestore_constants.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/services/authentication_service.dart';
import 'package:wallets/services/wallets_service.dart';

abstract class OrganizationsService {
  Future<Organization> createOrganization(
      {required String withName, required String enterpiseNumber});
  Future<void> deleteOrganizationWithId(String organizationId);
  Future<Organization> getOrganizationWithId(String organizationId);
  Future<Organization> getOrganizationOwningWallet(String walletId);
  Future<List<Organization>> listCurrentUserOrganizations();

  factory OrganizationsService() = _OrganizationsService;
}

class _OrganizationsService implements OrganizationsService {
  final firestore = locator<FirebaseFirestore>();
  final authenticationService = locator<AuthenticationService>();

  WalletsService get walletsService => locator<WalletsService>();

  @override
  Future<Organization> createOrganization(
      {required String withName, required String enterpiseNumber}) async {
    if (withName.isEmpty)
      throw ArgumentError("Organization name cannot be empty.");

    if (enterpiseNumber.isEmpty)
      throw new ArgumentError("Enteprise Number cannot be empty.");

    final ref = firestore.collection(ksOrganizationsCollection).doc();
    final organization = Organization(
      id: ref.id,
      ownerId: authenticationService.getCurrentUserId(),
      name: withName,
      entepriseNumber: enterpiseNumber,
    );

    await ref.set(organization.toJson());
    return organization;
  }

  @override
  Future<void> deleteOrganizationWithId(String organizationId) {
    return firestore
        .collection(ksOrganizationsCollection)
        .doc(organizationId)
        .delete();
  }

  @override
  Future<Organization> getOrganizationWithId(String organizationId) async {
    final doc = await firestore
        .collection(ksOrganizationsCollection)
        .doc(organizationId)
        .get();

    if (!doc.exists)
      throw StateError("The requested organization does not exist.");

    return Organization.fromJson(doc.data()!);
  }

  @override
  Future<Organization> getOrganizationOwningWallet(String walletId) async {
    final wallet = await walletsService.getWalletWithId(walletId);
    return getOrganizationWithId(wallet.organizationId);
  }

  @override
  Future<List<Organization>> listCurrentUserOrganizations() async {
    final organizationsData = await firestore
        .collection(ksOrganizationsCollection)
        .where("ownerId", isEqualTo: authenticationService.getCurrentUserId())
        .get();

    return organizationsData.docs
        .map((doc) => Organization.fromJson(doc.data()))
        .toList();
  }
}
