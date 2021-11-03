import 'package:flutter/material.dart';
import 'package:wallets/models/models.dart';

class UniquePaymentsTabView extends StatelessWidget {
  final DisplayableWallet wallet;

  UniquePaymentsTabView(this.wallet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("I show unique payments"),
      ),
    );
  }
}
