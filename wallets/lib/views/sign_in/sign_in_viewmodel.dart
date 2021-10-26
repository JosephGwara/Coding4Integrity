import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/routes.dart';
import 'package:wallets/services/authentication_service.dart';
import 'package:wallets/views/sign_in/sign_in_view.form.dart';

abstract class SignInViewModel extends FormViewModel {
  Future<void> signIn();
  Future<void> forgotPassword();
  Future<void> navigateToSignUpView();

  bool get isSigningIn;

  static SignInViewModel makeInstance() => _SignInViewModel();
}

class _SignInViewModel extends SignInViewModel {
  final navigationService = locator<NavigationService>();
  final authenticationService = locator<AuthenticationService>();
  final dialogService = locator<DialogService>();

  @override
  void setFormStatus() {
    clearErrors();
    notifyListeners();
  }

  @override
  Future<void> signIn() async {
    final run = () async {
      await authenticationService.signInWithEmailAndPassword(
        email: emailValue ?? "",
        password: passwordValue ?? "",
      );

      return navigationService.replaceWith(Routes.homeView);
    };

    return runBusyFuture(run());
  }

  @override
  Future<void> forgotPassword() async {
    final run = () async {
      await authenticationService.sendForgotPasswordEmail(emailValue ?? "");
      return dialogService.showDialog(
        title: "Check your emails",
        description:
            "A link to reset your email has been sent to $emailValue. Please click on the link to reset your password.",
      );
    };

    return runBusyFuture(run());
  }

  @override
  Future<void> navigateToSignUpView() async {
    return navigationService.navigateTo(Routes.signUpView);
  }

  @override
  bool get isSigningIn => this.isBusy;
}
