import 'package:caffein_teamzeal/components/loading.dart';
import 'package:caffein_teamzeal/components/rich_text_row.dart';
import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/models/menu_model.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/booking_form.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/booking_form_viewmodel.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/components/booking_confirmation.dart';
import 'package:caffein_teamzeal/screens/landing_view/staff_landing_view.dart';
import 'package:caffein_teamzeal/screens/staff_screens/staff_home/staff_homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../models/booking_model.dart';

class AddMenu extends StatefulWidget {
  @override
  _AddMenu createState() => _AddMenu();
}

class _AddMenu extends State<AddMenu> {
  // final items = ['Table type 1', 'Table type 2'];
  // String? value;
//final BookingModel bookingModel;
  final controllerName = TextEditingController();
  final controllerPrice = TextEditingController();
  final controllerDesc = TextEditingController();
  final controllerImage = TextEditingController();
//   final controllerDate = TextEditingController();
//   final controllerTime = TextEditingController();
//   final controllerAdditional = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Name\n"),
              TextFormField(
                controller: controllerName,
                decoration: InputDecoration(hintText: ""),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Description\n",
              ),
              TextFormField(
                controller: controllerDesc,
                decoration: InputDecoration(hintText: ""),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Price\n"),
              TextFormField(
                controller: controllerPrice,
                decoration: InputDecoration(hintText: ""),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Image\n"),
              TextFormField(
                controller: controllerImage,
                decoration: InputDecoration(hintText: ""),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                //height: 49,
                style: ElevatedButton.styleFrom(
                  primary: Color(0XFF93C47D),
                ),
                child: Text("Submit", style: TextStyle(color: Colors.black54)),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new StaffLandingView()));
                  final menu = Menu(
                    name: controllerName.text,
                    price: controllerPrice.text,
                    desc: controllerDesc.text,
                    id: null,
                    image: controllerImage.text,
                  );
                  createAddMenu(menu);

                  // final docUser = FirebaseFirestore.instance.collection("booking").doc();
                },

                //color: Color(0xFFCFB476),
              )
            ],
          ),
        ),
      ),
    );
  }

  // DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
  //       value: item,
  //       child: Text(
  //         item,
  //         style: TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //     );
  Future createAddMenu(Menu menu) async {
    final docUser = FirebaseFirestore.instance.collection("products").doc();
    menu.id = docUser.id;
    final json = menu.toJson();
    await docUser.set(json);
  }
}
