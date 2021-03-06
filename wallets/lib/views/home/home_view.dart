import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/shared_ui/listing_view.dart';
import 'package:wallets/views/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel.makeInstance(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          tooltip: "Make Payment",
          onPressed: model.initiatePayment,
          child: Icon(Icons.payment_rounded),
        ),
        appBar: AppBar(
          title: Text("Wallets"),
          actions: [
            PopupMenuButton(
              onSelected: (_) => model.createNewWallet(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: "add_new_wallet",
                  child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add New Wallet"),
                  ),
                )
              ],
            )
          ],
        ),
        body: ListingView(
          model: model,
          itemName: ItemName.Wallet,
          content: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final wallet = model.wallets[index];
                      return Card(
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: index == model.wallets.length - 1 ? 200 : 0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          height: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.purple[400],
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      )),
                                  child: Text(
                                    "R${wallet.balance.round()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 0,
                              ),
                              ListTile(
                                title: Text(wallet.data.name),
                                trailing: ElevatedButton(
                                  onPressed: () => model.openWallet(wallet),
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(0),
                                  ),
                                  child: Text("Open"),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => verticalSpace(0),
                    itemCount: model.wallets.length,
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
