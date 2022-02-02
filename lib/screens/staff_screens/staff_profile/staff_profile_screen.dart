import 'package:caffein_teamzeal/screens/staff_screens/staff_profile/components/body.dart';
import 'package:caffein_teamzeal/screens/staff_screens/staff_profile/staff_profile_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StaffProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StaffProfileScreenViewModel>.reactive(
      onModelReady: (viewModel) => viewModel.populateDetails(),
      builder: (context, viewModel, child) {
        return Scaffold(
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
            title: const Text("Staff Profile"),
            actions: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  await viewModel.navigateToEditScreen();
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: ClipOval(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.edit,
                        size: 22,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: Body(
            viewModel: viewModel,
          ),
        );
      },
      viewModelBuilder: () => StaffProfileScreenViewModel(),
    );
  }
}
