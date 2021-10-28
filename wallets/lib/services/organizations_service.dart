import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wallets/config/firestore_constants.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/services/authentication_service.dart';

abstract class OrganizationsService {
  Future<Organization> createOrganization({required String withName});
  Future<void> deleteOrganizationWithId(String organizationId);
  Future<List<Organization>> listCurrentUserOrganizations();

  factory OrganizationsService() = _OrganizationsService;
}

class _OrganizationsService implements OrganizationsService {
  final firestore = locator<FirebaseFirestore>();
  final authenticationService = locator<AuthenticationService>();

  @override
  Future<Organization> createOrganization({required String withName}) async {
    final ref = firestore.collection(ksOrganizationsCollection).doc();
    final organization = Organization(
      id: ref.id,
      ownerId: authenticationService.getCurrentUserId(),
      name: withName,
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
