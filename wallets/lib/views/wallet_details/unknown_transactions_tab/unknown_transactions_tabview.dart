import 'package:flutter/material.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:wallets/shared_ui/render_on_boolean.dart';

class UnknownTransactionsTabView extends StatelessWidget {
  final List<Transaction> transactions;
  final DisplayableWallet thisWallet;
  UnknownTransactionsTabView(
      {required this.transactions, required this.thisWallet, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RenderOnBoolean(
        boolean: transactions.isEmpty,
        whenTrueRender: Center(
          child: Text("No unknown transactions so far. Great!"),
        ),
        whenFalseRender: ListView.separated(
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            final isPayment =
                transaction.fromAddress == thisWallet.data.publicAddress;

            final title =
                isPayment ? transaction.toAddress : transaction.fromAddress;
            final subtitle = timeago.format(transaction.dateTime);
            final amount = isPayment
                ? "-R${transaction.amount.round()}"
                : "R${transaction.amount.round()}";

            return ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
              trailing: Text(amount),
            );
          },
          separatorBuilder: (context, index) => verticalSpace(10),
          itemCount: transactions.length,
        ),
      ),
    );
  }
}
