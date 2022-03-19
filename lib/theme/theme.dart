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
          error: kErrorColor));
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: kContentColorDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
  );
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
