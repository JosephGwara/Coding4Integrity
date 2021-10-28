import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wallets/views/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel.makeInstance(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text("Home here!"),
        ),
      ),
    );
  }
}
