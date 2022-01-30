import 'package:caffein_teamzeal/app.locator.dart';
import 'package:caffein_teamzeal/app.router.dart';
import 'package:caffein_teamzeal/models/user_model.dart';
import 'package:caffein_teamzeal/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();

  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String? name = "";
  String? email = "";
  String? phoneNumber = "";
  String? gender;
  String? password = "";
  String? confirmPassword = "";
  bool obscureText = true;
  final List<String> errors = [];

  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  void addError({required String error}) {
    if (!errors.contains(error)) errors.add(error);
    notifyListeners();
  }

  void removeError({required String error}) {
    if (errors.contains(error)) errors.remove(error);
    notifyListeners();
  }

  void toggle() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      signUp();
    }
  }

  Future signUp() async {
    setBusy(true);
    final UserModel user = UserModel(
      name: name!,
      phone: phoneNumber!,
      email: email!,
    );
    final bool result = await _authenticationService.signUpWithEmail(
      user: user,
      password: password!,
    );
    if (result) {
      _navigationService.clearStackAndShow(Routes.landingView);
    }
    setBusy(false);
  }
}
