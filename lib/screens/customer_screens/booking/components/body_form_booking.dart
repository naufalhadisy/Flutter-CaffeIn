import 'package:caffein_teamzeal/components/loading.dart';
import 'package:caffein_teamzeal/components/rich_text_row.dart';
import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/booking_form_viewmodel.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/components/booking_confirmation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // final items = ['Table type 1', 'Table type 2'];
  // String? value;

  TextEditingController sampledata1 = new TextEditingController();
  TextEditingController sampledata2 = new TextEditingController();
  TextEditingController sampledata3 = new TextEditingController();
  TextEditingController sampledata4 = new TextEditingController();
  TextEditingController sampledata5 = new TextEditingController();

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
                controller: sampledata1,
                decoration: InputDecoration(hintText: "Table Type 1"),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Date\n"),
              TextFormField(
                controller: sampledata2,
                decoration: InputDecoration(hintText: "12/11/2022"),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Time\n"),
              TextFormField(
                controller: sampledata3,
                decoration: InputDecoration(hintText: "04.00 PM"),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Number of Person\n"),
              TextFormField(
                controller: sampledata4,
                decoration: InputDecoration(hintText: "4"),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Additional Note\n"),
              TextFormField(
                controller: sampledata5,
                decoration:
                    InputDecoration(hintText: "ex: please clean the table"),
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                height: 49,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new BookingConf()));
                  Map<String, dynamic> data = {
                    "Table Number": sampledata1.text,
                    "Date": sampledata2.text,
                    "Time": sampledata3.text,
                    "Number of Person": sampledata4.text,
                    "Additional": sampledata5.text
                  };
                  FirebaseFirestore.instance.collection("booking").add(data);
                },
                child: Text("Book now"),
                color: Color(0xFFCFB476),
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
}
