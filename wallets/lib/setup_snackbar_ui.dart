import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallets/locator.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: Colors.green[800]!,
    messageColor: Colors.white,
  ));
}
