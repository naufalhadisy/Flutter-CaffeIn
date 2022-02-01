import 'dart:developer';

import 'package:caffein_teamzeal/app.locator.dart';
import 'package:caffein_teamzeal/app.router.dart';
import 'package:caffein_teamzeal/models/user_model.dart';
import 'package:caffein_teamzeal/services/authentication_service.dart';
import 'package:caffein_teamzeal/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileScreenViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final FirebaseService _firebaseService = locator<FirebaseService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> errors = [];

  String emailId = "";

  late UserModel user;

  Future populateDetails() async {
    user = _authenticationService.currentUser!;
    populateFields();
  }

  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();
  FocusNode ageFocusNode = FocusNode();

  final nameEditingController = TextEditingController();
  final ageEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();

  void populateFields() {
    user = _authenticationService.currentUser!;
    nameEditingController.text = user.name;
    phoneNumberEditingController.text = user.phone;
    emailId = user.email;
  }

  Future<void> updateUserProfile() async {
    try {
      final UserModel newUser = UserModel(
          id: user.id,
          name: nameEditingController.text,
          phone: phoneNumberEditingController.text,
          email: user.email,
          booking: user.booking,
          role: user.role);
      await _firebaseService.updateUser(newUser);
      refreshUser(user.id!);
      await _dialogService.showDialog(
          title: "Success", description: "Profile Updated!");
      _navigationService.back(result: true);
    } catch (e) {
      log('Error updating user profile: ');
      log(e.toString());
    }
  }

  void addError({required String error}) {
    if (!errors.contains(error)) {
      errors.add(error);
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      errors.remove(error);
    }
  }

  void logout() {
    _authenticationService.userLogout();
    _navigationService.clearStackAndShow(Routes.splashScreen);
  }

  Future navigateToEditScreen() async {
    await _navigationService.navigateTo(Routes.editProfile);
    await _authenticationService.checkUserLoggedIn();
    user = _authenticationService.currentUser!;
    notifyListeners();
  }

  Future refreshUser(String userId) async {
    await _authenticationService.refreshUser(userId);
    populateDetails();
    notifyListeners();
  }
}
