import 'package:flutter/material.dart';

const COLOR_BISTRO = Color(0xFF2B2015);
const COLOR_FRENCH_BISTRO = Color(0xFF81694F);
const COLOR_CAFE_NOIR = Color(0xFF503C29);
const COLOR_EGGSHELL = Color(0xFFF0E7D4);

class AppTheme {
  AppTheme._();

  // 1. Define Colors.
  static const Color _darkPrimaryColor = COLOR_CAFE_NOIR;

  static const Color _darkPrimaryContainerColor = COLOR_BISTRO;
  static const Color _darkOnPrimaryColor = COLOR_EGGSHELL;
  static const Color _darkTextColorPrimary = Color(0xFFF0E7D4);
  static const Color _appbarColorDark = COLOR_CAFE_NOIR;
  static const Color _iconColor = Colors.white;
  static const Color _accentColorDark = COLOR_FRENCH_BISTRO;

  // 2. Create Text Theme.
  // 2.a. Define Heading Textstyle.
  static const TextStyle _darkHeadingText = TextStyle(
      color: _darkTextColorPrimary, fontSize: 20, fontWeight: FontWeight.bold);

  // 2.b. Define Body Textstyle.
  static const TextStyle _darkBodyText = TextStyle(
      color: _darkTextColorPrimary,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontSize: 16);

  static const TextTheme _darkTextTheme =
      TextTheme(headline1: _darkHeadingText, bodyText1: _darkBodyText);

  // 3. Finally create dark theme for in app use.
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkPrimaryColor,
    appBarTheme: const AppBarTheme(backgroundColor: _appbarColorDark),
    iconTheme: const IconThemeData(color: _iconColor),
    bottomAppBarColor: _appbarColorDark,
    colorScheme: const ColorScheme.dark(
      primary: _darkPrimaryColor,
      secondary: _accentColorDark,
      onPrimary: _darkOnPrimaryColor,
      primaryContainer: _darkPrimaryContainerColor,
    ),
    textTheme: _darkTextTheme,
  );
}
