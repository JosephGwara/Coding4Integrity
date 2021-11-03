import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/shared_ui/render_on_boolean.dart';
import 'package:wallets/views/wallet_details/unique_payments_tab/unique_payments_tabview.dart';
import 'package:wallets/views/wallet_details/unknown_transactions_tab/unknown_transactions_tabview.dart';
import 'package:wallets/views/wallet_details/wallet_all_transactions_tab/wallet_all_transactions_tab_view.dart';
import 'package:wallets/views/wallet_details/wallet_details_viewmodel.dart';
import 'package:wallets/views/wallet_details/wallet_information_tab/wallet_information_tab_view.dart';

class WalletDetailsView extends StatelessWidget {
  final DisplayableWallet wallet;

  WalletDetailsView({required this.wallet, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletDetailsViewModel>.reactive(
      viewModelBuilder: () => WalletDetailsViewModel.makeInstance(wallet),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(wallet.data.name),
        ),
        bottomNavigationBar: model.isBusy || model.hasError
            ? null
            : BottomNavigationBar(
                unselectedItemColor: Colors.black54,
                selectedItemColor: Theme.of(context).primaryColor,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.money_rounded),
                    label: "All Activity",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.payment),
                    label: "Payments",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.error_outline),
                    label: "Unknown",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz),
                    label: "Details",
                  ),
                ],
                currentIndex: model.currentNavBarIndex,
                onTap: model.selectNavBarItem,
              ),
        body: RenderOnBoolean(
          boolean: model.isBusy,
          whenTrueRender: Center(
            child: CircularProgressIndicator(),
          ),
          whenFalseRender: RenderOnBoolean(
            boolean: model.hasError,
            whenTrueRender: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${model.error(model)}',
                    style: TextStyle(color: Colors.red[400]),
                  ),
                  verticalSpace(10),
                  OutlinedButton(
                    onPressed: model.fetchTransactionsForWallet,
                    child: Text("Retry"),
                  ),
                ],
              ),
            ),
            whenFalseRender: <Widget>[
              WalletAllTransactionsTabView(
                transactions: model.transactions.allIdentifiableTransactions,
              ),
              UniquePaymentsTabView(
                uniquePayments: model.transactions.uniquePayments,
              ),
              UnknownTransactionsTabView(
                thisWallet: wallet,
                transactions: model.transactions.unidentifiableTransactions,
              ),
              WalletInformationTabView(
                wallet: wallet,
              ),
            ].elementAt(model.currentNavBarIndex),
          ),
        ),
      ),
    );
  }
}
