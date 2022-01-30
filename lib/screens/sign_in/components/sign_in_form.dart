import 'package:caffein_teamzeal/components/constants.dart';
import 'package:caffein_teamzeal/components/custom_suffix_icon.dart';
import 'package:caffein_teamzeal/components/default_button.dart';
import 'package:caffein_teamzeal/components/form_error.dart';
import 'package:caffein_teamzeal/components/loading.dart';
import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/screens/sign_in/components/bottom_text.dart';
import 'package:caffein_teamzeal/screens/sign_in/sign_in_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class SignForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      builder: (context, viewModel, child) => viewModel.isBusy
          ? const Loading(text: "Logging in...")
          : Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  buildEmailFormField(viewModel, context),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildPasswordFormField(viewModel, context),
                  SizedBox(height: getProportionateScreenHeight(25)),
                  FormError(errors: viewModel.errors),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  DefaultButton(
                      text: "Sign In",
                      press: () async {
                        viewModel.validateAndSave();
                      }),
                  const SigninScreenBottomText()
                ],
              ),
            ),
      viewModelBuilder: () => SignInViewModel(),
    );
  }

  TextFormField buildEmailFormField(
      SignInViewModel viewModel, BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white70),
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.white70,
      textInputAction: TextInputAction.go,
      focusNode: viewModel.emailFocusNode,
      onSaved: (newValue) => viewModel.email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          viewModel.removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          viewModel.removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          viewModel.addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          viewModel.addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
      onFieldSubmitted: (value) {
        viewModel.emailFocusNode.unfocus();
        FocusScope.of(context).requestFocus(viewModel.passwordFocusNode);
      },
    );
  }

  TextFormField buildPasswordFormField(
    SignInViewModel viewModel,
    BuildContext context,
  ) {
    return TextFormField(
      style: const TextStyle(color: Colors.white70),
      obscureText: viewModel.obscureText,
      cursorColor: Colors.white70,
      textInputAction: TextInputAction.done,
      focusNode: viewModel.passwordFocusNode,
      onSaved: (newValue) => viewModel.password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          viewModel.removeError(error: kPassNullError);
        } else if (value.length >= 6) {
          viewModel.removeError(error: kShortPassError);
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          viewModel.addError(error: kPassNullError);
          return "";
        } else if (value.length < 6) {
          viewModel.addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: viewModel.obscureText
              ? GestureDetector(
                  onTap: () => viewModel.toggle(),
                  child: const FaIcon(
                    FontAwesomeIcons.eyeSlash,
                    size: 17,
                    color: Colors.white70,
                  ),
                )
              : GestureDetector(
                  onTap: () => viewModel.toggle(),
                  child: const FaIcon(
                    FontAwesomeIcons.eye,
                    size: 17,
                    color: Colors.white70,
                  ),
                ),
        ),
      ),
      onFieldSubmitted: (value) {
        viewModel.passwordFocusNode.unfocus();
      },
    );
  }
}
