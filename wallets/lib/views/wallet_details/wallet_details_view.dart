import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/views/wallet_details/unique_payments_tab/unique_payments_tabview.dart';
import 'package:wallets/views/wallet_details/wallet_all_transactions_tab/wallet_all_transactions_tab_view.dart';
import 'package:wallets/views/wallet_details/wallet_details_viewmodel.dart';
import 'package:wallets/views/wallet_details/wallet_information_tab/wallet_information_tab_view.dart';

class WalletDetailsView extends StatelessWidget {
  final DisplayableWallet wallet;

  WalletDetailsView({required this.wallet, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletDetailsViewModel>.reactive(
      viewModelBuilder: () => WalletDetailsViewModel.makeInstance(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(wallet.data.name),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "R${wallet.balance.round()}",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.money_rounded),
              label: "All Transactions",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: "Unique Payments",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: "Details",
            ),
          ],
          currentIndex: model.currentNavBarIndex,
          onTap: model.selectNavBarItem,
        ),
        body: <Widget>[
          WalletAllTransactionsTabView(wallet),
          UniquePaymentsTabView(wallet),
          WalletInformationTabView(),
        ].elementAt(model.currentNavBarIndex),
      ),
    );
  }
}
