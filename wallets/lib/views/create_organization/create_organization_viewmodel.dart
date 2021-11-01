import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/services/organizations_service.dart';
import 'package:wallets/views/create_organization/create_organization_view.form.dart';

abstract class CreateOrganizationViewModel extends FormViewModel {
  bool get isCreatingOrganization;
  Future<void> createOrganization();

  static CreateOrganizationViewModel makeInstance() =>
      _CreateOrganizationViewModel();
}

class _CreateOrganizationViewModel extends CreateOrganizationViewModel {
  final organizationsService = locator<OrganizationsService>();
  final navigationService = locator<NavigationService>();

  @override
  Future<void> createOrganization() async {
    final run = () async {
      final organization = await organizationsService.createOrganization(
        withName: organizationNameValue ?? "",
        enterpiseNumber: entepriseNumberValue ?? "",
      );

      navigationService.back(result: organization);
    };

    return runBusyFuture(run());
  }

  @override
  bool get isCreatingOrganization => this.isBusy;

  @override
  void setFormStatus() {
    clearErrors();
    notifyListeners();
  }
}
