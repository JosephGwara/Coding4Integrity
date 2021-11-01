import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/shared_ui/button_utils.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/views/create_wallet/create_wallet_view.form.dart';
import 'package:wallets/views/create_wallet/create_wallet_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'walletName', initialValue: ""),
])
class CreateWalletView extends StatelessWidget with $CreateWalletView {
  final Organization organization;

  CreateWalletView({required this.organization, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateWalletViewModel>.reactive(
      viewModelBuilder: () => CreateWalletViewModel.makeInstance(organization),
      onModelReady: (model) {
        listenToFormUpdated(model);
      },
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 310,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (model.hasError)
                  Text(
                    "${model.error(model)}",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: Colors.red[400]),
                  ),
                verticalSpace(20),
                TextField(
                  enabled: !model.isCreatingWallet,
                  controller: walletNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(hintText: "Wallet Name"),
                ),
                verticalSpace(30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 45)),
                  onPressed: onButtonPressed(
                    model.createWallet,
                    disableIf: model.isCreatingWallet,
                  ),
                  child: model.isCreatingWallet
                      ? SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          "Add Wallet",
                          style: TextStyle(fontSize: 20),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
