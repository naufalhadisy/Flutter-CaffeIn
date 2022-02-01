import 'package:caffein_teamzeal/components/constants.dart';
import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/screens/staff_screens/staff_home/staff_homescreen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StaffHomeScreenViewModel>.reactive(
        onModelReady: (viewModel) async {},
        viewModelBuilder: () => StaffHomeScreenViewModel(),
        builder: (context, viewModel, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                leading: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    "assets/images/caffein_logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text("CaffeIN"),
                actions: [
                  Container(
                    height: 32,
                    width: 32,
                    margin: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(5)),
                    SizedBox(height: getProportionateScreenWidth(10)),
                  ],
                ),
              ),
            ),
          );
        });
  }
}