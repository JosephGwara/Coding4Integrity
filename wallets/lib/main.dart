import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/routes.dart';

void main() async {
  setUpLocator();
  runApp(WalletsApp());
}

class WalletsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallets App',
      navigatorKey: StackedService.navigatorKey,
      initialRoute: Routes.signInView,
      onGenerateRoute: generateRoute,
    );
  }
}
