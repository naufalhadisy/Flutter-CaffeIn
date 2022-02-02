import 'dart:ui';

import 'package:caffein_teamzeal/screens/staff_screens/staff_home/staff_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:caffein_teamzeal/models/menu_model.dart';

class StaffMenuCard extends StatelessWidget {
  final Menu menu;
  StaffMenuCard(this.menu);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StaffDetailScreen(
                    menu.id, menu.image, menu.name, menu.price, menu.desc)));
      },
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: 130,
                    height: 110,
                    child: Image.network(menu.image, fit: BoxFit.cover),
                  ),
                ),
                // Image.network(menu.image, width: 130, height: 110),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                      width: 10,
                    ),
                    Text(
                      '   ${menu.name}',
                      //textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 24,
                          // fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(height: 3, width: 1),
                    Text('   ${menu.price}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 25,
                            // fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
