import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/shared_ui/render_on_boolean.dart';

const ksItemNameWallet = "Wallet";
const ksItemNameOrganization = "Organization";

enum ItemName {
  Wallet,
  Orgaization,
}

String _itemNameToString(ItemName itemName) =>
    EnumToString.convertToString(itemName);

abstract class ListingViewModel implements BaseViewModel {
  bool get hasItems;
  Future<void> retryFetch();
  Future<void> addNewItem();
}

class ListingView extends StatelessWidget {
  final ListingViewModel model;
  final ItemName itemName;
  final Widget content;

  ListingView({
    required this.model,
    required this.itemName,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: model.retryFetch,
                  child: Text("Retry"),
                ),
              ],
            ),
          ),
          whenFalseRender: RenderOnBoolean(
            boolean: !model.hasItems,
            whenTrueRender: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have not added any ${_itemNameToString(itemName).toLowerCase()}s yet. Please add one.',
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(10),
                  OutlinedButton(
                    onPressed: model.addNewItem,
                    child: Text("Add new ${_itemNameToString(itemName)}"),
                  ),
                ],
              ),
            ),
            whenFalseRender: content,
          ),
        ),
      ),
    );
  }
}
