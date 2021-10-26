import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/services/authentication_service.dart';

final locator = GetIt.instance;

Future<void> setUpLocator() async {
  final firebaseApp = await Firebase.initializeApp();

  locator.registerSingleton(FirebaseAuth.instanceFor(app: firebaseApp));
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
}
