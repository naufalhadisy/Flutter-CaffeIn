// ignore_for_file: prefer_const_constructors

import 'package:caffein_teamzeal/components/constants.dart';
import 'package:caffein_teamzeal/screens/customer_screens/profile/components/logout_tile.dart';
import 'package:caffein_teamzeal/screens/customer_screens/profile/components/uesr_info.dart';
import 'package:caffein_teamzeal/screens/customer_screens/profile/components/view_bookings_tile.dart';
import 'package:caffein_teamzeal/screens/customer_screens/profile/profile_screen_viewmodel.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final ProfileScreenViewModel viewModel;

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
          ViewBookings(user: viewModel.user),
          divider(),
          LogoutTile(),
          divider(),
        ],
      ),
    );
  }
}
