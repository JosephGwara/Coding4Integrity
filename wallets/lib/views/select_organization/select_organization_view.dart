import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/shared_ui/render_on_boolean.dart';
import 'package:wallets/views/select_organization/select_organization_viewmodel.dart';

class SelectOrganizationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectOrganizationViewModel>.reactive(
      viewModelBuilder: () => SelectOrganizationViewModel.makeInstance(),
      onModelReady: (model) => model.fetchOrganizations(),
      builder: (context, model, child) => Scaffold(
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
                    onPressed: model.fetchOrganizations,
                    child: Text("Retry"),
                  ),
                ],
              ),
            ),
            whenFalseRender: RenderOnBoolean(
              boolean: model.organizations.isEmpty,
              whenTrueRender: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You have not added any organisations yet. Please add one.',
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(10),
                    OutlinedButton(
                      onPressed: model.createNewOrganization,
                      child: Text("Add new Organisation"),
                    ),
                  ],
                ),
              ),
              whenFalseRender: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    verticalSpace(statusBarHeight(context)),
                    Text(
                      "Select Organization",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          if (index < model.organizations.length) {
                            return ListTile(
                              onTap: () => model.returnOrganization(
                                model.organizations[index],
                              ),
                              title: Text(model.organizations[index].name),
                              subtitle: Text(
                                model.organizations[index].entepriseNumber,
                              ),
                            );
                          } else {
                            return OutlinedButton(
                              onPressed: model.createNewOrganization,
                              child: Text("Add new Organisation"),
                            );
                          }
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: model.organizations.length + 1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
