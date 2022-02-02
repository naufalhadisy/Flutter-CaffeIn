// ignore_for_file: prefer_const_constructors

import 'package:caffein_teamzeal/components/constants.dart';
import 'package:caffein_teamzeal/screens/staff_screens/staff_profile/components/logout_tile.dart';
import 'package:caffein_teamzeal/screens/staff_screens/staff_profile/components/user_info.dart';
import 'package:caffein_teamzeal/screens/staff_screens/staff_profile/staff_profile_screen_viewmodel.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final StaffProfileScreenViewModel viewModel;

  const Body({Key? key, required this.viewModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserDetails(
            viewModel: viewModel,
          ),
          divider(),
          LogoutTile(),
          divider(),
        ],
      ),
    );
  }
}
