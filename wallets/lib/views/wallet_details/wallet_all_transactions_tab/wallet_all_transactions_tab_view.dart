import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/views/wallet_details/wallet_all_transactions_tab/wallet_all_transactions_tab_viewmodel.dart';

class WalletAllTransactionsTabView extends StatelessWidget {
  final DisplayableWallet wallet;

  WalletAllTransactionsTabView(this.wallet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletAllTransactionsTabViewModel>.reactive(
      viewModelBuilder: () => WalletAllTransactionsTabViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text("I list all transactions"),
        ),
      ),
    );
  }
}
