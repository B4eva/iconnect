import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/ui/shared/app_colors.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: kContentColorLightTheme),
      appBarTheme: appBarTheme,
      iconTheme: const IconThemeData(color: kContentColorDarkTheme),
      colorScheme: const ColorScheme.light(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
          error: kErrorColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: kSecondaryColor,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kPrimaryColor.withOpacity(0.6),
          selectedIconTheme: const IconThemeData(color: kPrimaryColor)));
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
      primaryColor: kPrimaryColor,
      //scaffoldBackgroundColor: kContentColorLightTheme,
      appBarTheme: appBarTheme,
      iconTheme: const IconThemeData(color: kContentColorDarkTheme),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        error: kErrorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: kPrimaryColor,
          selectedItemColor: kContentColorDarkTheme,
          unselectedItemColor: kSecondaryColor.withOpacity(0.5),
          selectedIconTheme: const IconThemeData(color: Colors.green)));
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
