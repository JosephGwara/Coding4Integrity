import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:wallets/shared_ui/button_utils.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/views/sign_up/sign_up_view.form.dart';
import 'package:wallets/views/sign_up/sign_up_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'displayName', initialValue: ""),
  FormTextField(name: 'email', initialValue: ""),
  FormTextField(name: 'password', initialValue: "", isPassword: true),
  FormTextField(name: 'confirmPassword', initialValue: "", isPassword: true),
])
class SignUpView extends StatelessWidget with $SignUpView {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel.makeInstance(),
      onModelReady: (model) {
        listenToFormUpdated(model);
      },
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeightFraction(1, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: statusBarHeight(context)),
                  child: IconButton(
                    onPressed: onButtonPressed(
                      model.navigateBack,
                      disableIf: model.isSigningUp,
                    ),
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 310,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up to BoltaPay",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          verticalSpace(30),
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
                            enabled: !model.isSigningUp,
                            controller: displayNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: "Display name",
                              icon: Icon(Icons.account_box),
                            ),
                          ),
                          verticalSpace(20),
                          TextField(
                            enabled: !model.isSigningUp,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Email",
                              icon: Icon(Icons.mail),
                            ),
                          ),
                          verticalSpace(10),
                          TextField(
                            enabled: !model.isSigningUp,
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              icon: Icon(Icons.lock),
                            ),
                          ),
                          verticalSpace(10),
                          TextField(
                            enabled: !model.isSigningUp,
                            controller: confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Confirm password",
                              icon: Icon(Icons.lock),
                            ),
                          ),
                          verticalSpace(30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 45),
                              elevation: 0,
                            ),
                            onPressed: onButtonPressed(
                              model.signUp,
                              disableIf: model.isSigningUp,
                            ),
                            child: model.isSigningUp
                                ? SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(
                                    "Sign Up",
                                    style: TextStyle(fontSize: 20),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
