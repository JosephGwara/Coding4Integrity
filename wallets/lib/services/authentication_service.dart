import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallets/locator.dart';

abstract class AuthenticationService {
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String displayName,
      required String confirmedPassword});

  Future<void> sendEmailVerification();
  Future<void> sendForgotPasswordEmail(String email);

  Future<bool> isUserSignedIn();
  String getCurrentUserId();

  factory AuthenticationService() => _AuthenticationService();
}

class _AuthenticationService implements AuthenticationService {
  final firebaseAuth = locator<FirebaseAuth>();

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    if (email.isEmpty) throw ArgumentError("Please provide an email.");
    if (password.isEmpty) throw ArgumentError("Please provide a password.");

    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String displayName,
      required String confirmedPassword}) async {
    if (email.isEmpty) throw ArgumentError("Please provide an email.");
    if (password.isEmpty) throw ArgumentError("Please provide a password.");

    if (displayName.isEmpty)
      throw new ArgumentError("Please provide a display name.");

    if (password != confirmedPassword) {
      throw ArgumentError("Please enter matching passwords.");
    }

    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await firebaseAuth.currentUser!.updateDisplayName(displayName);
  }

  @override
  Future<bool> isUserSignedIn() async {
    return firebaseAuth.currentUser != null;
  }

  @override
  Future<void> sendEmailVerification() {
    return firebaseAuth.currentUser!.sendEmailVerification();
  }

  @override
  Future<void> sendForgotPasswordEmail(String email) {
    if (email.isEmpty) throw ArgumentError("Please provide an email.");

    return firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  String getCurrentUserId() {
    if (firebaseAuth.currentUser == null) throw "No user signed in.";
    return firebaseAuth.currentUser!.uid;
  }
}
