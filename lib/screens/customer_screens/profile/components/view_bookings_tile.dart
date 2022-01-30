import 'package:caffein_teamzeal/app.locator.dart';
import 'package:caffein_teamzeal/app.router.dart';
import 'package:caffein_teamzeal/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

class ViewBookings extends StatelessWidget {
  const ViewBookings({Key? key, required this.user}) : super(key: key);

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        await locator<NavigationService>().navigateTo(
          Routes.bookingHistory,
          arguments: BookingHistoryArguments(
            passes: user.booking != null
                ? user.booking!.map((e) => e.toString()).toList()
                : [],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                SvgPicture.asset(
                  "assets/icons/tickets.svg",
                  height: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'My Booking',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset("assets/icons/arrow_right.svg",
                  height: 14, fit: BoxFit.cover, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
