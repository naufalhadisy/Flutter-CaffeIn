import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/models/booking_model.dart';
import 'package:caffein_teamzeal/screens/customer_screens/history/components/body.dart';
import 'package:caffein_teamzeal/screens/staff_screens/staff_booking/staff_booking_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StaffBooking extends StatelessWidget {
  const StaffBooking({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference booking = firestore.collection('booking');
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CaffeIN - Staff"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 15,
            width: 10,
          ),
          Text(
            "Incoming Booking",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: booking.orderBy('Book_ID', descending: false).snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: (snapshot.data! as QuerySnapshot)
                        .docs
                        .map(
                          (e) => StaffBookingBody(BookingModel(
                              Book_id: e['Book_ID'],
                              name: e['name'],
                              tabletype: e['tableType'],
                              date: e['date'],
                              numberperson: e['numberperson'],
                              time: e['time'],
                              additional: e['additional'])),
                        )
                        .toList(),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ]),
      ),
    );
  }
}
