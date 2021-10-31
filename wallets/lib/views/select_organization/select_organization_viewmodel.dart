import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/routes.dart';
import 'package:wallets/services/organizations_service.dart';
import 'package:wallets/shared_ui/listing_view.dart';

abstract class SelectOrganizationViewModel extends BaseViewModel
    implements ListingViewModel {
  List<Organization> get organizations;
  Future<void> fetchOrganizations();
  Future<void> createNewOrganization();
  void returnOrganization(Organization selectedOrganization);

  static SelectOrganizationViewModel makeInstance() =>
      _SelectOrganizationViewModel();
}

class _SelectOrganizationViewModel extends SelectOrganizationViewModel {
  final navigationService = locator<NavigationService>();
  final organizationsService = locator<OrganizationsService>();

  @override
  List<Organization> organizations = [];

  @override
  Future<void> createNewOrganization() async {
    final createdOrganization =
        await navigationService.navigateTo(Routes.createOrganizationView);

    if (createdOrganization != null) return fetchOrganizations();
  }

  @override
  Future<void> fetchOrganizations() async {
    organizations = await runBusyFuture(
        organizationsService.listCurrentUserOrganizations());
  }

  @override
  void returnOrganization(Organization selectedOrganization) {
    navigationService.back(result: selectedOrganization);
  }

  @override
  Future<void> addNewItem() {
    return createNewOrganization();
  }

  @override
  bool get hasItems => organizations.isNotEmpty;

  @override
  Future<void> retryFetch() {
    return fetchOrganizations();
  }
}
