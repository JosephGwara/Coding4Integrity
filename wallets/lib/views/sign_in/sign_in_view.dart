import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:wallets/shared_ui/button_utils.dart';
import 'package:wallets/shared_ui/dimensions.dart';
import 'package:wallets/views/sign_in/sign_in_view.form.dart';
import 'package:wallets/views/sign_in/sign_in_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', initialValue: ""),
  FormTextField(name: 'password', initialValue: "", isPassword: true),
])
class SignInView extends StatelessWidget with $SignInView {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel.makeInstance(),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Wallets",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  "Let's sign you in",
                  style: Theme.of(context).textTheme.subtitle1,
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
                  enabled: !model.isSigningIn,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: "Email"),
                ),
                verticalSpace(10),
                TextField(
                  enabled: !model.isSigningIn,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                ),
                verticalSpace(10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: onButtonPressed(
                      model.forgotPassword,
                      disableIf: model.isSigningIn,
                    ),
                    child: Text("Forgot Password"),
                  ),
                ),
                verticalSpace(10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 45)),
                  onPressed: onButtonPressed(
                    model.signIn,
                    disableIf: model.isSigningIn,
                  ),
                  child: model.isSigningIn
                      ? SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          "Sign In",
                          style: TextStyle(fontSize: 20),
                        ),
                ),
                verticalSpace(15),
                Text(
                  "Or",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 20,
                      ),
                ),
                verticalSpace(15),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 45)),
                  onPressed: onButtonPressed(
                    model.navigateToSignUpView,
                    disableIf: model.isSigningIn,
                  ),
                  child: Text(
                    "Sign Up",
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
