import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/views/create_organization/create_organization_view.dart';
import 'package:wallets/views/create_wallet/create_wallet_view.dart';
import 'package:wallets/views/home/home_view.dart';
import 'package:wallets/views/select_organization/select_organization_view.dart';
import 'package:wallets/views/sign_in/sign_in_view.dart';
import 'package:wallets/views/sign_up/sign_up_view.dart';
import 'package:wallets/views/startup/startup_view.dart';
import 'package:wallets/views/verify_wallet_view.dart/verify_wallet_view.dart';
import 'package:wallets/views/wallet_details/wallet_details_view.dart';

class Routes {
  static const startupView = 'startupView';
  static const signInView = 'signInView';
  static const signUpView = 'signUpView';
  static const homeView = 'homeView';
  static const selectOrganizationView = 'selectOrganizationView';
  static const createOrganizationView = 'createOrganizationView';
  static const createWalletView = 'createWalletView';
  static const walletDetailsView = 'walletDetailsView';
  static const verifyWalletView = 'verifyWalletView';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.startupView:
      return _getPageRoute(
        settings: settings,
        viewToShow: StartupView(),
      );

    case Routes.signInView:
      return _getPageRoute(
        settings: settings,
        viewToShow: SignInView(),
      );

    case Routes.signUpView:
      return _getPageRoute(
        settings: settings,
        viewToShow: SignUpView(),
      );

    case Routes.homeView:
      return _getPageRoute(
        settings: settings,
        viewToShow: HomeView(),
      );

    case Routes.selectOrganizationView:
      return _getPageRoute(
        settings: settings,
        viewToShow: SelectOrganizationView(),
      );

    case Routes.createOrganizationView:
      return _getPageRoute(
        settings: settings,
        viewToShow: CreateOrganizationView(),
      );

    case Routes.createWalletView:
      return _getPageRoute(
        settings: settings,
        viewToShow: CreateWalletView(
          arguments: settings.arguments as CreateWalletViewArguments,
        ),
      );

    case Routes.verifyWalletView:
      return _getPageRoute(
        settings: settings,
        viewToShow: VerifyWalletView(),
      );

    case Routes.walletDetailsView:
      return _getPageRoute(
        settings: settings,
        viewToShow: WalletDetailsView(
          wallet: settings.arguments as DisplayableWallet,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}

PageRoute _getPageRoute(
    {required RouteSettings settings, required Widget viewToShow}) {
  return PageTransition(
    child: viewToShow,
    settings: settings,
    type: PageTransitionType.rightToLeftWithFade,
  );
}
