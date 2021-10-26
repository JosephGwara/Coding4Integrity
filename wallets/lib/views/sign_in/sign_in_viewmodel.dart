import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/routes.dart';

abstract class SignInViewModel extends FormViewModel {
  Future<void> signIn();
  Future<void> forgotPassword();
  Future<void> navigateToSignUpView();

  bool get isSigningIn;

  static SignInViewModel makeInstance() => _SignInViewModel();
}

class _SignInViewModel extends SignInViewModel {
  final navigationService = locator<NavigationService>();

  @override
  void setFormStatus() {
    notifyListeners();
  }

  @override
  Future<void> signIn() async {
    // TODO: implement signIn
    // throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword() async {
    // TODO: implement forgotPassword
    // throw UnimplementedError();
  }

  @override
  Future<void> navigateToSignUpView() async {
    return navigationService.navigateTo(Routes.signUpView);
  }

  @override
  bool get isSigningIn => this.isBusy;
}
