import 'package:caffein_teamzeal/models/user_model.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/booking_form.dart';
import 'package:caffein_teamzeal/screens/customer_screens/home/home_screen_viewmodel.dart';
import 'package:caffein_teamzeal/screens/customer_screens/profile/profile_screen.dart';
import 'package:caffein_teamzeal/screens/customer_screens/profile/profile_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final HomeScreenViewModel viewModel;

  const Body({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            height: 49,
            color: Colors.transparent,
            child: FlatButton(
              color: Color(0xFFCFB476),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Booking()));
              },
              child: Text('Booking'),

              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10)),
            )),
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Container(
                    child: Text(
                      "Booking",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      width: 180,
                      height: 260,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     new MaterialPageRoute(
                          //         builder: (context) => new Booking()));
                        },
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                            "https://m.media-amazon.com/images/I/61JCeKP0UZL._SY450_.jpg",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                      width: 180,
                      height: 260,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     new MaterialPageRoute(
                          //         builder: (context) => new Booking()));
                        },
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                              "https://m.media-amazon.com/images/I/61JCeKP0UZL._SY450_.jpg"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Text(
                      "Table Type 1\n1 - 4 Person\nBooking Price: RM 5",
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Text(
                          "Table Type 2\n5 - 8 Person\nBooking Price: RM 7",
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Location",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Jalan Sri Skudai, Taman Sri Skudai, \n81300 Skudai, Johor, Mal, 81300, Malaysia",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
