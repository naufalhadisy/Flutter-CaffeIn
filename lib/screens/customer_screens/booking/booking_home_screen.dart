import 'package:caffein_teamzeal/components/enum.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/components/body_home_booking.dart';
import 'package:caffein_teamzeal/screens/customer_screens/home/home_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BookingScreen extends StatelessWidget {
  final EventType eventType;

  const BookingScreen({Key? key, required this.eventType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      onModelReady: (viewModel) async {},
      viewModelBuilder: () => HomeScreenViewModel(),
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
            body: Body(
              viewModel: viewModel,
            ),
          ),
        );
      },
      //viewModelBuilder: () => HomeScreenViewModel(),
    );
  }
}
