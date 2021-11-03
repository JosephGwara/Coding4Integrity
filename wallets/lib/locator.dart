import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/apis/block_scout_api.dart';
import 'package:wallets/services/authentication_service.dart';
import 'package:wallets/services/block_scout_service.dart';
import 'package:wallets/services/credentials_service.dart';
import 'package:wallets/services/organizations_service.dart';
import 'package:wallets/services/wallets_service.dart';

final locator = GetIt.instance;

Future<void> setUpLocator() async {
  final firebaseApp = await Firebase.initializeApp();

  locator.registerSingleton(FirebaseAuth.instanceFor(app: firebaseApp));
  locator.registerSingleton(FirebaseFirestore.instanceFor(app: firebaseApp));
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => OrganizationsService());
  locator.registerLazySingleton(() => WalletsService());
  locator.registerLazySingleton(() => CredentialsService());
  locator.registerLazySingleton(() => BlockScoutApi());
  locator.registerLazySingleton(() => BlockScoutService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
}
