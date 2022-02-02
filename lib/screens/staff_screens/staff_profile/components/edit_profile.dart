import 'package:caffein_teamzeal/app.locator.dart';
import 'package:caffein_teamzeal/components/constants.dart';
import 'package:caffein_teamzeal/components/custom_suffix_icon.dart';
import 'package:caffein_teamzeal/components/loading.dart';
import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/screens/staff_screens/staff_profile/staff_profile_screen_viewmodel.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfile extends StatelessWidget {
  Future _discardChanges(
    BuildContext context,
    StaffProfileScreenViewModel viewModel,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          title: const Text(
            'Discard changes?',
            style: TextStyle(
              fontSize: 17,
              letterSpacing: 0.7,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () => Navigator.of(context).pop(false),
              splashColor: Theme.of(context).primaryColorLight,
              child: const Text(
                'No',
                style: TextStyle(
                    fontSize: 14, letterSpacing: .8, color: Colors.white70),
              ),
            ),
            MaterialButton(
              onPressed: () {
                viewModel.updateUserProfile();
              },
              splashColor: Theme.of(context).primaryColorLight,
              child: const Text(
                'Yes',
                style: TextStyle(
                    fontSize: 14, letterSpacing: .8, color: Colors.white70),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StaffProfileScreenViewModel>.reactive(
        builder: (context, viewModel, child) {
          viewModel.populateFields();
          return WillPopScope(
            onWillPop: () async =>
                locator<NavigationService>().back(result: false),
            child: Scaffold(
              key: viewModel.scaffoldKey,
              appBar: AppBar(
                title: const Text("Edit Profile"),
              ),
              body: SafeArea(
                child: viewModel.isBusy
                    ? const Loading()
                    : SingleChildScrollView(
                        child: Container(
                          height: SizeConfig.screenHeight * 0.8,
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 10),
                              nameFormField(context, viewModel),
                              const SizedBox(height: 20),
                              phoneNumberFormField(context, viewModel),
                              const SizedBox(height: 20),
                              //mailFormFIeld(viewModel),
                              //const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  discardChanges(context, viewModel),
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    color: kSecondaryColor,
                                    child: const Text(
                                      "Update",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () async {
                                      await viewModel.updateUserProfile();
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          );
        },
        viewModelBuilder: () => StaffProfileScreenViewModel());
  }

  TextFormField nameFormField(
      BuildContext context, StaffProfileScreenViewModel viewModel) {
    return TextFormField(
      style: const TextStyle(color: Colors.white70),
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      cursorColor: Colors.white70,
      textInputAction: TextInputAction.go,
      focusNode: viewModel.nameFocusNode,
      controller: viewModel.nameEditingController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          viewModel.removeError(error: "Name cannot be empty");
        }
        return;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          viewModel.addError(error: "Name cannot be empty");
          return "";
        }
      },
      decoration: const InputDecoration(
        labelText: "Name",
        hintText: "Change your name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
      onFieldSubmitted: (value) {
        viewModel.nameFocusNode.unfocus();
        FocusScope.of(context).requestFocus(viewModel.phoneNumberFocusNode);
      },
    );
  }

  TextFormField phoneNumberFormField(
      BuildContext context, StaffProfileScreenViewModel viewModel) {
    return TextFormField(
      style: const TextStyle(color: Colors.white70),
      keyboardType: TextInputType.phone,
      cursorColor: Colors.white70,
      textInputAction: TextInputAction.go,
      focusNode: viewModel.phoneNumberFocusNode,
      controller: viewModel.phoneNumberEditingController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          viewModel.removeError(error: "Please Enter your Phone Number");
        } else if (value.length == 10) {
          viewModel.removeError(error: "Please Enter valid Phone Number");
        }
        return;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          viewModel.addError(error: "Please Enter your Phone Number");
          return "";
        } else if (value.length != 10) {
          viewModel.addError(error: "Please Enter valid Phone Number");
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Phone Number",
        hintText: "Change your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Call-grey.svg"),
      ),
      onFieldSubmitted: (value) {
        viewModel.phoneNumberFocusNode.unfocus();
        FocusScope.of(context).requestFocus(viewModel.ageFocusNode);
      },
    );
  }

  MaterialButton discardChanges(
      BuildContext context, StaffProfileScreenViewModel viewModel) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: const Text(
        "Discard",
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        _discardChanges(context, viewModel);
      },
    );
  }
}
