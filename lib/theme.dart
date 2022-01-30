import 'package:flutter/material.dart';

import 'components/constants.dart';

ThemeData theme() {
  return ThemeData(
      primaryColor: const Color(0xFF1E1D1D),
      scaffoldBackgroundColor: const Color(0xFF222222),
      fontFamily: "Muli",
      appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      unselectedWidgetColor: Colors.white);
}

InputDecorationTheme inputDecorationTheme() {
  final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: kTextColor),
  );
  return InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.grey[600]),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    labelStyle: const TextStyle(color: kSecondaryColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    centerTitle: true,
    color: Color(0xFF151514),
    elevation: 1,
    iconTheme: IconThemeData(color: Colors.white),
  );
}
