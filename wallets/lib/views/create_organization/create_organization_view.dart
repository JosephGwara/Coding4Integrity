import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:wallets/shared_ui/button_utils.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/views/create_organization/create_organization_view.form.dart';
import 'package:wallets/views/create_organization/create_organization_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'organizationName', initialValue: ""),
  FormTextField(name: 'entepriseNumber', initialValue: ""),
])
class CreateOrganizationView extends StatelessWidget
    with $CreateOrganizationView {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateOrganizationViewModel>.reactive(
      viewModelBuilder: () => CreateOrganizationViewModel.makeInstance(),
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
                  enabled: !model.isCreatingOrganization,
                  controller: organizationNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(hintText: "Organization Name"),
                ),
                verticalSpace(20),
                TextField(
                  enabled: !model.isCreatingOrganization,
                  controller: entepriseNumberController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(hintText: "Enteprise Number"),
                ),
                verticalSpace(30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45),
                    elevation: 0,
                  ),
                  onPressed: onButtonPressed(
                    model.createOrganization,
                    disableIf: model.isCreatingOrganization,
                  ),
                  child: model.isCreatingOrganization
                      ? SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          "Add Organization",
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
