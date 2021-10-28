import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/services/organizations_service.dart';

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
    // TODO: implement createOrganization

    final organization =
        await organizationsService.createOrganization(withName: "");
    navigationService.back(result: organization);
  }

  @override
  bool get isCreatingOrganization => this.isBusy;

  @override
  void setFormStatus() {
    clearErrors();
    notifyListeners();
  }
}
