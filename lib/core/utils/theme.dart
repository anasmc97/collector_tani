import 'package:flutter/material.dart';
import 'package:project_tani/core/utils/shared_value.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Inter",
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: CustomColors.colorsFontPrimary),
        headline2: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: CustomColors.colorsFontSecondary,
        ),
        bodyText1: TextStyle(
          fontFamily: "Roboto",
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: CustomColors.colorsFontPrimary,
        ),
      ),
    );
  }
}