import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/routes.dart';

abstract class HomeViewModel extends BaseViewModel {
  List<Wallet> get wallets;

  Future<void> init();
  Future<void> createNewWallet();
  Future<void> openWallet(Wallet wallet);

  static makeInstance() => _HomeViewModel();
}

class _HomeViewModel extends HomeViewModel {
  final navigationService = locator<NavigationService>();

  @override
  Future<void> createNewWallet() {
    // TODO: implement createNewWallet
    throw UnimplementedError();
  }

  @override
  Future<void> init() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      navigationService.replaceWith(Routes.selectOrganizationView);
    });
  }

  @override
  Future<void> openWallet(Wallet wallet) {
    // TODO: implement openWallet
    throw UnimplementedError();
  }

  @override
  // TODO: implement wallets
  List<Wallet> get wallets => throw UnimplementedError();
}
