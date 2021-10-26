abstract class AuthenticationService {
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String displayName,
      required String confirmedPassword});

  factory AuthenticationService() => _AuthenticationService();
}

class _AuthenticationService implements AuthenticationService {
  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    // TODO: implement signInWithEmailAndPassword
    // throw UnimplementedError();
  }

  @override
  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String displayName,
      required String confirmedPassword}) {
    if (displayName.isEmpty)
      throw new ArgumentError("Please provide a display name.");

    if (password != confirmedPassword) {
      throw ArgumentError("Please enter matching passwords.");
    }

    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }
}
