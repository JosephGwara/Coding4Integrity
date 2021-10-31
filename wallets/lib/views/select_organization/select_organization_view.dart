import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/shared_ui/listing_view.dart';
import 'package:wallets/views/select_organization/select_organization_viewmodel.dart';

class SelectOrganizationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectOrganizationViewModel>.reactive(
      viewModelBuilder: () => SelectOrganizationViewModel.makeInstance(),
      onModelReady: (model) => model.fetchOrganizations(),
      builder: (context, model, child) => ListingView(
        model: model,
        itemName: ItemName.Orgaization,
        content: Padding(
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
    );
  }
}
