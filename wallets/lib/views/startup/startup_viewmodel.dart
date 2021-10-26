import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/routes.dart';
import 'package:wallets/services/authentication_service.dart';

abstract class StartupViewModel extends BaseViewModel {
  Future<void> checkUserAndNavigate();

  static StartupViewModel makeInstance() => _StartupViewModel();
}

class _StartupViewModel extends StartupViewModel {
  final authenticationService = locator<AuthenticationService>();
  final navigationService = locator<NavigationService>();

  @override
  Future<void> checkUserAndNavigate() async {
    final isUserSignedIn = await authenticationService.isUserSignedIn();

    if (isUserSignedIn) {
      return navigationService.replaceWith(Routes.homeView);
    } else {
      return navigationService.replaceWith(Routes.signInView);
    }
  }
}
