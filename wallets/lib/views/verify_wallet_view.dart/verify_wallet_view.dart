import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:wallets/shared_ui/button_utils.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/views/verify_wallet_view.dart/verify_wallet_view.form.dart';
import 'package:wallets/views/verify_wallet_view.dart/verify_wallet_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'privateKey', initialValue: ""),
])
class VerifyWalletView extends StatelessWidget with $VerifyWalletView {
  VerifyWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyWalletViewModel>.reactive(
      viewModelBuilder: () => VerifyWalletViewModel.makeInstance(),
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
                  enabled: !model.isVerifyingWallet,
                  controller: privateKeyController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration:
                      InputDecoration(hintText: "Paste account private key"),
                ),
                verticalSpace(30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45),
                    elevation: 0,
                  ),
                  onPressed: onButtonPressed(
                    model.verifyWalletAndReturnPublicKey,
                    disableIf: model.isVerifyingWallet,
                  ),
                  child: model.isVerifyingWallet
                      ? SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          "Verify Wallet",
                          style: TextStyle(fontSize: 20),
                        ),
                ),
                verticalSpace(20),
                Text(
                  "We do not save your private key. We only use it once, to verify that you "
                  "do own the wallet you are trying to connect. "
                  "Never share private keys with anyone.",
                  style: TextStyle(color: Colors.red[400]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
