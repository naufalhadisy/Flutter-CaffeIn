// MAP - PROJECT
// TEAM ZEAL

// MEMBERS:
// AMMAR HAWARI ABDILLAH        (A19EC0220)
// NAUFAL HADI SYUKRIMA         (A19EC0272)
// SHAFIA CARINA SAPTOMO        (A19EC0286)
// RAMADHAN MUHAMMAD JUMANTORO  (A19EC0277)

import 'package:caffein_teamzeal/app.locator.dart';
import 'package:caffein_teamzeal/app.router.dart';
import 'package:caffein_teamzeal/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CaffeIN',
      theme: theme(),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: Routes.startUpView,
    );
  }
}
