import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/views/wallet_details/wallet_information_tab/wallet_information_tab_viewmodel.dart';

class WalletInformationTabView extends StatelessWidget {
  final DisplayableWallet wallet;

  WalletInformationTabView({required this.wallet, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletInformationTabViewModel>.nonReactive(
      viewModelBuilder: () => WalletInformationTabViewModel.makeInstance(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 310),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "R${wallet.balance.round()}",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 40,
                  ),
                ),
                verticalSpace(60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name"),
                    Text(wallet.data.name),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Owner"),
                    Text(wallet.organization.name),
                  ],
                ),
                Divider(),
                verticalSpace(20),
                Text(
                  wallet.data.publicAddress,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
                verticalSpace(20),
                OutlinedButton(
                  onPressed: () =>
                      model.copyAddressToClipboard(wallet.data.publicAddress),
                  child: Text("Copy Address to Clipboard"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
