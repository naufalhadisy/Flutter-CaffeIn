import 'package:caffein_teamzeal/components/constants.dart';
import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/models/menu_model.dart';
import 'package:caffein_teamzeal/screens/staff_screens/staff_home/add_menu.dart';
import 'package:caffein_teamzeal/screens/staff_screens/staff_home/staff_homescreen_viewmodel.dart';
import 'package:caffein_teamzeal/screens/staff_screens/staff_home/staff_menu_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:caffein_teamzeal/models/menu_model.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products = firestore.collection('products');
    return ViewModelBuilder<StaffHomeScreenViewModel>.reactive(
        onModelReady: (viewModel) async {},
        viewModelBuilder: () => StaffHomeScreenViewModel(),
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
              title: const Text("CaffeIN - Staff"),
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
                                  (e) => StaffMenuCard(Menu(
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

                  // FloatingActionButton(
                  //   onPressed: () => ({}),
                  //   tooltip: 'Add Menu',
                  //   child: Icon(Icons.add),
                  //   heroTag: null,
                  // ),
                  FlatButton(
                    color: Color(0xFFCFB476),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new AddMenu()));
                    },
                    child: Text('Add Menu'),

                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10)),
                  ),
                ]),
              ),
            ),
          ));
        });
  }
}
