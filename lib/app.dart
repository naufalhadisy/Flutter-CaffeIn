import 'package:caffein_teamzeal/screens/customer_screens/history/booking_history.dart';
import 'package:caffein_teamzeal/screens/customer_screens/home/home_screen.dart';
import 'package:caffein_teamzeal/screens/customer_screens/profile/components/edit_profile.dart';
import 'package:caffein_teamzeal/screens/customer_screens/profile/profile_screen.dart';
import 'package:caffein_teamzeal/screens/landing_view/landing_view.dart';
import 'package:caffein_teamzeal/screens/sign_in/sign_in_screen.dart';
import 'package:caffein_teamzeal/screens/sign_up/sign_up_screen.dart';
import 'package:caffein_teamzeal/screens/splash/splash_screen.dart';
import 'package:caffein_teamzeal/screens/startup/startup_view.dart';
import 'package:caffein_teamzeal/services/authentication_service.dart';
import 'package:caffein_teamzeal/services/firebase_service.dart';
import 'package:caffein_teamzeal/services/local_storage_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: SplashScreen, path: "/splash_screen"),
    MaterialRoute(page: LandingView, path: "/landing-page"),

    //*Login
    MaterialRoute(page: SignInScreen, path: "/sign_in"),
    MaterialRoute(page: SignUpScreen, path: "/sign_up"),

    //*Home Screen
    MaterialRoute(page: HomeScreen, path: "/home"),

    //*Profile Screen
    MaterialRoute(page: ProfileScreen, path: "/my-profile"),
    MaterialRoute(page: EditProfile, path: "/edit-profile"),
    MaterialRoute(page: BookingHistory, path: "/booking-history"),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: LocalStorageService),
    LazySingleton(classType: FirebaseService),
    LazySingleton(classType: AuthenticationService),
  ],
)
class App {}
