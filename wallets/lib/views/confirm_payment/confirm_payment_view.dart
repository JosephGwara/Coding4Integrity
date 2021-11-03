import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/shared_ui/button_utils.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/views/confirm_payment/confirm_payment_view.form.dart';
import 'package:wallets/views/confirm_payment/confirm_payment_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'amount', initialValue: "0"),
])
class ConfirmPaymentView extends StatelessWidget with $ConfirmPaymentView {
  final DisplayableWallet recepient;
  ConfirmPaymentView({required this.recepient, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ConfirmPaymentViewModel>.reactive(
      viewModelBuilder: () => ConfirmPaymentViewModel.makeInstance(recepient),
      onModelReady: (model) {
        listenToFormUpdated(model);
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Confirm Payment"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                width: screenWidthFraction(1, context),
                height: screenHeightFraction(0.3, context),
                alignment: Alignment.center,
                child: Text(
                  "Confirm Paymnent of R${amountController.text} to ${recepient.data.name} of "
                  "${recepient.organization.name}. You will be directed to MetaMask to complete"
                  " the payment.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              verticalSpace(20),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "Amount",
                    border: OutlineInputBorder(),
                    icon: Text(
                      "R",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  inputFormatters: [
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      final isValid = int.tryParse(newValue.text) != null;
                      if (isValid) return newValue;
                      return oldValue;
                    })
                  ],
                ),
              ),
              verticalSpace(30),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                  onPressed: onButtonPressed(
                    model.makePaymentAndReturnHome,
                    disableIf: !model.canMakePayment,
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45),
                    elevation: 0,
                  ),
                  child: Text("Make Payment"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
