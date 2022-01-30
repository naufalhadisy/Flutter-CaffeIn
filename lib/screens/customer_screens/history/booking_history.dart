import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/screens/customer_screens/history/components/body.dart';
import 'package:flutter/material.dart';

class BookingHistory extends StatelessWidget {
  final List<String> passes;

  const BookingHistory({Key? key, required this.passes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking History"),
      ),
      body: Body(),
    );
  }
}
