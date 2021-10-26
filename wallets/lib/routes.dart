import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallets/views/sign_in/sign_in_view.dart';
import 'package:wallets/views/sign_up/sign_up_view.dart';

class Routes {
  static const homeView = 'homeView';
  static const signInView = 'signInView';
  static const signUpView = 'signUpView';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
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
    type: PageTransitionType.rightToLeft,
  );
}
