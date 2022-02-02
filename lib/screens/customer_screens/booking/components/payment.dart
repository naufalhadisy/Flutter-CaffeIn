import 'package:caffein_teamzeal/components/constants.dart';
import 'package:caffein_teamzeal/screens/customer_screens/booking/components/success_payment.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Choose your payment method',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(children: [
                  ListTile(
                    leading: Icon(Icons.credit_score_sharp, size: 20),
                    title: Text(
                      'Credit Card/Debit Card',
                      textScaleFactor: 1.5,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Success()));
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.payment,
                      size: 20,
                    ),
                    title: Text(
                      'Bank Transfer',
                      textScaleFactor: 1.5,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Success()));
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.money,
                      size: 20,
                    ),
                    title: Text(
                      'E-Wallet',
                      textScaleFactor: 1.5,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Success()));
                    },
                  ),
                ]);
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
        ],
      ),
    );
  }
}
