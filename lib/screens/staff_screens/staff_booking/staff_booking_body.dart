import 'package:caffein_teamzeal/components/loading.dart';
import 'package:caffein_teamzeal/components/rich_text_row.dart';
import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/models/booking_model.dart';
import 'package:caffein_teamzeal/screens/customer_screens/history/booking_history_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StaffBookingBody extends StatelessWidget {
  final BookingModel booking;
  StaffBookingBody(this.booking);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookingHistoryViewModel>.reactive(
      builder: (context, viewModel, child) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(5)),
                  SizedBox(
                    height: 15,
                    width: 10,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFCFB476))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 10,
                            width: 10,
                          ),
                          Text(
                            '   ${booking.tabletype}',
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 15,
                                // fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10, width: 1),
                          Text('   Name :        ${booking.name}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          SizedBox(height: 10, width: 1),
                          Text('   Date :          ${booking.date}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          SizedBox(height: 3, width: 1),
                          Text('   Person(s) :   ${booking.numberperson}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          SizedBox(height: 3, width: 1),
                          Text('   Time :          ${booking.time}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          SizedBox(height: 3, width: 1),
                          Text('   Note :          ${booking.additional}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          const SizedBox(height: 15)
                        ],
                      )),
                  const SizedBox(height: 30)
                ],
              ),
            ),
          ),
        ));
      },
      viewModelBuilder: () => BookingHistoryViewModel(),
    );
  }
}
