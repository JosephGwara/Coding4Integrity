import 'package:flutter/material.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/shared_ui/render_on_boolean.dart';
import 'package:timeago/timeago.dart' as timeago;

class WalletAllTransactionsTabView extends StatelessWidget {
  final List<IdentifiableTransaction> transactions;

  WalletAllTransactionsTabView({required this.transactions, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RenderOnBoolean(
        boolean: transactions.isEmpty,
        whenTrueRender: Center(
          child: Text(
            "No traceable transactions so far. Make payments or receive funds"
            " from other organizations to see them here.",
            textAlign: TextAlign.center,
          ),
        ),
        whenFalseRender: ListView.separated(
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            final title = transaction.isPayment
                ? transaction.toOrganization.name
                : transaction.fromOrganization.name;
            final subtitle = timeago.format(transaction.data.dateTime);
            final amount = transaction.isPayment
                ? "-R${transaction.data.amount.round()}"
                : "R${transaction.data.amount.round()}";

            return ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
              trailing: Text(amount),
            );
          },
          separatorBuilder: (context, index) => verticalSpace(20),
          itemCount: transactions.length,
        ),
      ),
    );
  }
}
