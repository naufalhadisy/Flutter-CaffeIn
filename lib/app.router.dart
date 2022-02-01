// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'components/enum.dart';
import 'screens/customer_screens/history/booking_history.dart';
import 'screens/customer_screens/home/home_screen.dart';
import 'screens/customer_screens/profile/components/edit_profile.dart';
import 'screens/customer_screens/profile/profile_screen.dart';
import 'screens/landing_view/landing_view.dart';
import 'screens/landing_view/staff_landing_view.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_in/staff_sign_in/staff_sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/staff_screens/staff_home/staff_homescreen.dart';
import 'screens/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String splashScreen = '/splash_screen';
  static const String landingView = '/landing-page';
  static const String staffLandingView = '/staff-landing-page';
  static const String signInScreen = '/sign_in';
  static const String staffSignInScreen = '/staff_sign_in';
  static const String signUpScreen = '/sign_up';
  static const String homeScreen = '/home';
  static const String staffHomeScreen = '/staff_home';
  static const String detailsScreen = '/event-details';
  static const String confirmBookingView = '/confirm-booking';
  static const String makePayment = '/make_payment';
  static const String profileScreen = '/my-profile';
  static const String editProfile = '/edit-profile';
  static const String bookingHistory = '/booking-history';
  static const all = <String>{
    startUpView,
    splashScreen,
    landingView,
    staffLandingView,
    signInScreen,
    staffSignInScreen,
    signUpScreen,
    homeScreen,
    staffHomeScreen,
    detailsScreen,
    confirmBookingView,
    makePayment,
    profileScreen,
    editProfile,
    bookingHistory,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.landingView, page: LandingView),
    RouteDef(Routes.staffLandingView, page: StaffLandingView),
    RouteDef(Routes.signInScreen, page: SignInScreen),
    RouteDef(Routes.staffSignInScreen, page: StaffSignInScreen),
    RouteDef(Routes.signUpScreen, page: SignUpScreen),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.staffHomeScreen, page: StaffHomeScreen),
    RouteDef(Routes.profileScreen, page: ProfileScreen),
    RouteDef(Routes.editProfile, page: EditProfile),
    RouteDef(Routes.bookingHistory, page: BookingHistory),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartUpView(),
        settings: data,
      );
    },
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    LandingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LandingView(),
        settings: data,
      );
    },
    StaffLandingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StaffLandingView(),
        settings: data,
      );
    },
    SignInScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInScreen(),
        settings: data,
      );
    },
    StaffSignInScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StaffSignInScreen(),
        settings: data,
      );
    },
    SignUpScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpScreen(),
        settings: data,
      );
    },
    HomeScreen: (data) {
      var args = data.getArgs<HomeScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeScreen(
          key: args.key,
          eventType: args.eventType,
        ),
        settings: data,
      );
    },
    StaffHomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StaffHomeScreen(),
        settings: data,
      );
    },
    ProfileScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileScreen(),
        settings: data,
      );
    },
    EditProfile: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditProfile(),
        settings: data,
      );
    },
    BookingHistory: (data) {
      var args = data.getArgs<BookingHistoryArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => BookingHistory(
          key: args.key,
          passes: args.passes,
        ),
        settings: data,
      );
    },
  };
}

/// HomeScreen arguments holder class
class HomeScreenArguments {
  final Key? key;
  final EventType eventType;
  HomeScreenArguments({this.key, required this.eventType});
}

/// BookingHistory arguments holder class
class BookingHistoryArguments {
  final Key? key;
  final List<String> passes;
  BookingHistoryArguments({this.key, required this.passes});
}
