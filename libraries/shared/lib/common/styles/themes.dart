import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:shared/common/styles/color_palettes.dart';

// Styling for text
final TextTheme _myTextTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  displayMedium: TextStyle(fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall: TextStyle(fontSize: 46, fontWeight: FontWeight.w400),
  headlineMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineSmall: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
  titleLarge: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  titleSmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

// Styling for light theme
ThemeData lightTheme = ThemeData(
  fontFamily: 'IBMPlexSans',
  primaryColor: Modular.get<ColorPalettes>().lightPrimary,
  dividerColor: Modular.get<ColorPalettes>().darkBG,
  scaffoldBackgroundColor: Modular.get<ColorPalettes>().lightBG,
  textTheme: _myTextTheme,
  appBarTheme: AppBarTheme(
    elevation: 0,
    toolbarTextStyle: _myTextTheme.apply(bodyColor: Modular.get<ColorPalettes>().darkPrimary).bodyMedium,
    titleTextStyle: _myTextTheme.apply(bodyColor: Modular.get<ColorPalettes>().darkPrimary).titleLarge,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Modular.get<ColorPalettes>().lightAccent,
    unselectedItemColor: Colors.grey,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Modular.get<ColorPalettes>().lightAccent,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(0),
      ),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(cursorColor: Modular.get<ColorPalettes>().lightAccent),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: Modular.get<ColorPalettes>().lightAccent)
      .copyWith(background: Modular.get<ColorPalettes>().lightBG),
);

// Styling for dark theme
ThemeData darkTheme = ThemeData(
  fontFamily: 'IBMPlexSans',
  brightness: Brightness.dark,
  backgroundColor: Modular.get<ColorPalettes>().darkBG,
  primaryColor: Modular.get<ColorPalettes>().darkPrimary,
  dividerColor: Modular.get<ColorPalettes>().lightPrimary,
  scaffoldBackgroundColor: Modular.get<ColorPalettes>().darkBG,
  textTheme: _myTextTheme,
  appBarTheme: AppBarTheme(
    elevation: 0,
    toolbarTextStyle: _myTextTheme.apply(bodyColor: Modular.get<ColorPalettes>().lightPrimary).bodyMedium,
    titleTextStyle: _myTextTheme.apply(bodyColor: Modular.get<ColorPalettes>().lightPrimary).titleLarge,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Modular.get<ColorPalettes>().darkAccent,
    unselectedItemColor: Colors.grey,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Modular.get<ColorPalettes>().darkAccent,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(0),
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Modular.get<ColorPalettes>().darkAccent),
  textSelectionTheme: TextSelectionThemeData(cursorColor: Modular.get<ColorPalettes>().darkAccent),
);
