import 'package:caffein_teamzeal/components/loading.dart';
import 'package:caffein_teamzeal/components/rich_text_row.dart';
import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/booking_form_viewmodel.dart';
import 'package:caffein_teamzeal/screens/customer_screens/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:caffein_teamzeal/components/change_onboarding_screen.dart';

import '../booking_form.dart';

class BookingConf extends StatefulWidget {
  @override
  _BookingConfState createState() => _BookingConfState();
}

class _BookingConfState extends State<BookingConf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Confirmation"),
      ),
      // bottomNavigationBar: Container(
      //     margin: EdgeInsets.only(left: 25, right: 25, bottom: 50),
      //     height: 49,
      //     color: Colors.transparent,
      //     child: FlatButton(
      //       color: Color(0xFFCFB476),
      //       onPressed: () {},
      //       child: Text('Pay'),
      //       // shape: RoundedRectangleBorder(
      //       //     borderRadius: BorderRadius.circular(10)),
      //     )),
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(
              //   height: 20,
              // ),
              Image.asset(
                'assets/images/check.png',
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Center(
                child: Text(
                  "Your Booking has been recorded",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Your booking has been recorded, you can proceed to payment or cancel the booking.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Color(0xFFCFB476),
                onPressed: () {},
                // EdgeInsets.only(left: 25, right: 25, bottom: 50),
                height: 49,
                child: Text('Pay'),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 30,
              ),
              ChangeOnboardingScreenText(
                  clickableText: "Cancel Booking",
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Booking()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
