import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wallets/views/startup/startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
      viewModelBuilder: () => StartupViewModel.makeInstance(),
      onModelReady: (model) => model.checkUserAndNavigate(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
