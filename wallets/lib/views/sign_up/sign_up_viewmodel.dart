import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';

abstract class SignUpViewModel extends FormViewModel {
  Future<void> signUp();
  void navigateBack();

  bool get isSigningUp;

  static SignUpViewModel makeInstance() => _SignUpViewModel();
}

class _SignUpViewModel extends SignUpViewModel {
  final navigationService = locator<NavigationService>();

  @override
  void setFormStatus() {
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
    // TODO: implement signUp
    // throw UnimplementedError();
  }
}
