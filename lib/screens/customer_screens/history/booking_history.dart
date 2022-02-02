import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/models/booking_model.dart';
import 'package:caffein_teamzeal/screens/customer_screens/history/components/body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookingHistory extends StatelessWidget {
  final List<String> passes;

  const BookingHistory({Key? key, required this.passes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference booking = firestore.collection('booking');
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking History"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          StreamBuilder<QuerySnapshot>(
              stream: booking.orderBy('Book_ID', descending: false).snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: (snapshot.data! as QuerySnapshot)
                        .docs
                        .map(
                          (e) => Body(BookingModel(
                              Book_id: e['Book_ID'],
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
