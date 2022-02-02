import 'package:caffein_teamzeal/components/loading.dart';
import 'package:caffein_teamzeal/components/rich_text_row.dart';
import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/booking_form.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/booking_form_viewmodel.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/components/booking_confirmation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../models/booking_model.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // final items = ['Table type 1', 'Table type 2'];
  // String? value;
//final BookingModel bookingModel;

  final controllerTableType = TextEditingController();
  final controllerNumberofPerson = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerTime = TextEditingController();
  final controllerAdditional = TextEditingController();

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
              Text(
                "Table Type\n",
              ),
              // DropdownButton<String>(
              //   value: value,
              //   isExpanded: true,
              //   items: items.map(buildMenuItem).toList(),
              //   onChanged: (value) => setState(() => this.value = value),
              // ),

              TextFormField(
                controller: controllerTableType,
                decoration: InputDecoration(hintText: "Table Type 1"),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Date\n"),
              TextFormField(
                controller: controllerDate,
                decoration: InputDecoration(hintText: "12/11/2022"),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Time\n"),
              TextFormField(
                controller: controllerTime,
                decoration: InputDecoration(hintText: "04.00 PM"),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Number of Person\n"),
              TextFormField(
                controller: controllerNumberofPerson,
                decoration: InputDecoration(hintText: "4"),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Additional Note\n"),
              TextFormField(
                controller: controllerAdditional,
                decoration:
                    InputDecoration(hintText: "ex: please clean the table"),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                //height: 49,
                style: ElevatedButton.styleFrom(
                  primary: Color(0XFF93C47D),
                ),
                child:
                    Text("Book now", style: TextStyle(color: Colors.black54)),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new BookingConf()));
                  final data = BookingModel(
                      date: controllerDate.text,
                      additional: controllerAdditional.text,
                      numberperson: controllerNumberofPerson.text,
                      time: controllerTime.text,
                      tabletype: controllerTableType.text);
                  createBooking(data);

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
  Future createBooking(BookingModel bookingModel) async {
    final docUser = FirebaseFirestore.instance.collection("booking").doc();
    bookingModel.Book_id = docUser.id;
    final json = bookingModel.toJson();
    await docUser.set(json);
  }
}
