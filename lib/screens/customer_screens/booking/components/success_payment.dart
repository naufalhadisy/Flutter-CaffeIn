import 'package:caffein_teamzeal/screens/customer_screens/history/booking_history.dart';
import 'package:caffein_teamzeal/screens/landing_view/landing_view.dart';
import 'package:flutter/material.dart';
import 'package:caffein_teamzeal/components/change_onboarding_screen.dart';
import 'package:caffein_teamzeal/screens/customer_screens/history/booking_history.dart';
class Success extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            Image.asset('assets/images/success.png', 
              width: 400,
             height: 300,),
            
          ],),
           Text('Your Payment is Success', style: TextStyle(fontSize: 50),textAlign: TextAlign.center,),
              FlatButton(
                color: Colors.yellow,
                onPressed: () {
                   Navigator.push(
                       context,
                       new MaterialPageRoute(
                           builder: (context) => new BookingHistory(passes: [],)));
                },
                // EdgeInsets.only(left: 25, right: 25, bottom: 50),
                height: 49,
                child: Text('Check your booking history'),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10)),
              ),
              FlatButton(
                color: Colors.white,
                onPressed: () {
                   Navigator.push(
                       context,
                       new MaterialPageRoute(
                           builder: (context) => new LandingView()));
                },
                // EdgeInsets.only(left: 25, right: 25, bottom: 50),
                height: 49,
                child: Text('Back to Home'),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10)),
              ),
        ],
      )
    );
  }
}