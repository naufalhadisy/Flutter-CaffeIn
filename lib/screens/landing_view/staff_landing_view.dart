import 'dart:io';

import 'package:caffein_teamzeal/components/constants.dart';
import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/screens/staff_screens/staff_home/staff_homescreen.dart';
import 'package:caffein_teamzeal/screens/staff_screens/staff_profile/staff_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class StaffLandingView extends StatefulWidget {
  static String routeName = "/navbar";
  @override
  _StaffLandingViewState createState() => _StaffLandingViewState();
}

class _StaffLandingViewState extends State<StaffLandingView>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<Widget> _children = [
    const StaffHomeScreen(),
    StaffHomeScreen(),
    StaffProfileScreen(),
  ];

  Future<bool?> _exitApp(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          title: Text(
            "Want to exit?",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () => Navigator.of(context).pop(false),
              splashColor: Colors.red[50],
              child: Text(
                "No",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kSecondaryColor),
              ),
            ),
            MaterialButton(
              onPressed: () => exit(0),
              splashColor: Colors.red[50],
              child: Text(
                "Yes",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kSecondaryColor),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: PageView(
        onPageChanged: onPageChanged,
        controller: _pageController,
        children: _children,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.white.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.white,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.calendarCheckAlt,
                  text: 'Booking',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                onTabTapped(index);
              },
            ),
          ),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: kAnimationDuration,
      curve: Curves.ease,
    );
  }

  void onPageChanged(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
