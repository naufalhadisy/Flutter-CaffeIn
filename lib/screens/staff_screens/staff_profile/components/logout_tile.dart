import 'package:caffein_teamzeal/screens/staff_screens/staff_profile/staff_profile_screen_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../components/constants.dart';

class LogoutTile extends StatelessWidget {
  Future _logout(BuildContext context, StaffProfileScreenViewModel viewModel) {
    return showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          title: Text(
            "Want to logout?",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () => Navigator.of(context).pop(false),
              splashColor: Colors.red[50],
              child: Text(
                "No",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kSecondaryColor),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                viewModel.logout();
              },
              splashColor: kPrimaryColor,
              child: Text(
                "Yes",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kSecondaryColor),
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
      viewModelBuilder: () => StaffProfileScreenViewModel(),
      builder: (context, viewModel, child) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => _logout(context, viewModel),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/icons/logout.svg",
                    height: 17,
                    color: Colors.white70,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset("assets/icons/arrow_right.svg",
                    height: 14, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
