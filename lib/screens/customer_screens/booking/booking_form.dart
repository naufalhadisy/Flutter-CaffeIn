import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/components/body_form_booking.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/booking_form_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking"),
      ),
      body: Body(),
    );
  }
}
