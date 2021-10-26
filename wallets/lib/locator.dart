import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/services/authentication_service.dart';

final locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => NavigationService());
}
