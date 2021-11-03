import 'package:flutter/material.dart';
import 'package:wallets/models/models.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/shared_ui/render_on_boolean.dart';
import 'package:timeago/timeago.dart' as timeago;

class UniquePaymentsTabView extends StatelessWidget {
  final Map<Organization, List<IdentifiableTransaction>> uniquePayments;
  UniquePaymentsTabView({required this.uniquePayments, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RenderOnBoolean(
        boolean: uniquePayments.isEmpty,
        whenTrueRender: Center(
          child: Text(
            "No traceable transactions so far. Make payments"
            " to other organizations to see them here.",
            textAlign: TextAlign.center,
          ),
        ),
        whenFalseRender: ListView.separated(
          itemBuilder: (context, index) {
            final organization = uniquePayments.keys.elementAt(index);
            final payments = uniquePayments[organization];

            return Column(
              children: [
                Text(
                  organization.name,
                  style: TextStyle(fontSize: 20),
                ),
                ...payments!.map((payment) {
                  final title = payment.toOrganization.name;
                  final subtitle = timeago.format(payment.data.dateTime);
                  final amount = "-R${payment.data.amount}";

                  return ListTile(
                    title: Text(title),
                    subtitle: Text(subtitle),
                    trailing: Text(amount),
                  );
                })
              ],
            );
          },
          separatorBuilder: (context, index) => verticalSpace(20),
          itemCount: uniquePayments.length,
        ),
      ),
    );
  }
}
