import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/shared_ui/render_on_boolean.dart';
import 'package:wallets/views/select_recepient/select_recepient_view.form.dart';
import 'package:wallets/views/select_recepient/select_recepient_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'addressFilter', initialValue: ""),
])
class SelectRecepientView extends StatelessWidget with $SelectRecepientView {
  SelectRecepientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectRecepientViewModel>.reactive(
      viewModelBuilder: () => SelectRecepientViewModel.makeInstance(),
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.init();
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Pay"),
        ),
        body: Center(
          child: RenderOnBoolean(
            boolean: model.isBusy,
            whenTrueRender: CircularProgressIndicator(),
            whenFalseRender: Column(
              children: [
                verticalSpace(10),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: addressFilterController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Enter recepient address",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                verticalSpace(5),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final wallet = model.filteredRecepients[index];
                        return ListTile(
                          title: Text("${wallet.organization.name}"),
                          subtitle: Text("${wallet.data.name}"),
                          trailing: Icon(Icons.chevron_right_rounded),
                          onTap: () => model.continueToPay(wallet),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        height: 0,
                      ),
                      itemCount: model.filteredRecepients.length,
                    ),
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
