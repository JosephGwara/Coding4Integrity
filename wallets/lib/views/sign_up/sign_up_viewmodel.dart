import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/routes.dart';
import 'package:wallets/services/authentication_service.dart';
import 'package:wallets/views/sign_up/sign_up_view.form.dart';

abstract class SignUpViewModel extends FormViewModel {
  Future<void> signUp();
  void navigateBack();

  bool get isSigningUp;

  static SignUpViewModel makeInstance() => _SignUpViewModel();
}

class _SignUpViewModel extends SignUpViewModel {
  final navigationService = locator<NavigationService>();
  final authenticationService = locator<AuthenticationService>();

  @override
  void setFormStatus() {
    clearErrors();
    notifyListeners();
  }

  @override
  bool get isSigningUp => this.isBusy;

  @override
  void navigateBack() {
    navigationService.back();
  }

  @override
  Future<void> signUp() async {
    final run = () async {
      await authenticationService.signUpWithEmailAndPassword(
        email: emailValue ?? "",
        password: passwordValue ?? "",
        displayName: displayNameValue ?? "",
        confirmedPassword: confirmPasswordValue ?? "",
      );

      await authenticationService.sendEmailVerification();
      return navigationService.clearStackAndShow(Routes.homeView);
    };

    return runBusyFuture(run());
  }
}
