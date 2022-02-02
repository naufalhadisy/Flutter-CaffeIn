import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/booking_form.dart';

class DetailScreen extends StatefulWidget {
  int id;
  String image;
  String name;
  String price;
  String note;

  DetailScreen(this.id, this.image, this.name, this.price, this.note,
      {Key? key})
      : super(key: key);
  @override
  State<DetailScreen> createState() =>
      _DetailScreen(id, image, name, price, note);
}

class _DetailScreen extends State<DetailScreen> {
  int _id;
  String _image;
  String _name;
  String _price;
  String _note;
  _DetailScreen(this._id, this._image, this._name, this._price, this._note);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Image.network(
            _image,
            width: 600,
            height: 400,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              SizedBox(height: 380),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    color: Colors.white),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 15,
                      ),
                      child: Column(children: [
                        SizedBox(height: 15),
                        Row(children: [
                          Text(_name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                          // Spacer(),
                          // Image.asset('assets/images/Minus.png', width: 34,),
                          // SizedBox(width: 16),
                          // Text('1',
                          // style: TextStyle(color: Colors.white,fontSize: 22, fontWeight: FontWeight.w400),),
                          // SizedBox(width: 16),
                          // Image.asset('assets/images/Plus.png', width: 34,),
                        ]),
                        SizedBox(width: 12),
                        Row(
                          children: [
                            Text(_price,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(height: 18),
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 12),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            _note,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(height: 18),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            padding: EdgeInsets.only(top: 12, bottom: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hoverElevation: 0,
                            highlightElevation: 0,
                            disabledElevation: 0,
                            elevation: 0,
                            onPressed: () {
                               Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Booking()));
                            },
                            color: Colors.yellow,
                            child: Text(
                              'Proceed to Booking',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
