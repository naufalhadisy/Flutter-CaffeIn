import 'package:caffein_teamzeal/components/constants.dart';
import 'package:caffein_teamzeal/components/enum.dart';
import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/screens/customer_screens/home/home_screen_viewmodel.dart';
import 'package:caffein_teamzeal/screens/customer_screens/home/menu_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'menu_card.dart';
import 'package:caffein_teamzeal/models/menu_model.dart';

class HomeScreen extends StatelessWidget {
  final EventType eventType;

  const HomeScreen({Key? key, required this.eventType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products = firestore.collection('products');
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        onModelReady: (viewModel) async {},
        viewModelBuilder: () => HomeScreenViewModel(),
        builder: (context, viewModel, child) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              leading: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Image.asset(
                  "assets/images/caffein_logo.png",
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text("CaffeIN"),
              actions: [
                Container(
                  height: 32,
                  width: 32,
                  margin: const EdgeInsets.only(right: 10),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Column(children: [
                  SizedBox(
                    height: 15,
                    width: 10,
                  ),
                  Text('List Menu',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                  SizedBox(
                    height: 32,
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream:
                          products.orderBy('id', descending: false).snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: (snapshot.data! as QuerySnapshot)
                                .docs
                                .map(
                                  (e) => MenuCard(Menu(
                                      id: e['id'],
                                      image: e['image'],
                                      name: e['name'],
                                      price: e['price'],
                                      desc: e['desc'])),
                                )
                                .toList(),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ]),
              ),
            ),
          ));
        });
  }
}
