import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: 'PlayfairDisplay',
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColor.primaryColor,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColor.white),
    titleTextStyle: TextStyle(
      color: AppColor.white,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  brightness: Brightness.dark,
  primaryColor: AppColor.primaryColor,
  shadowColor: AppColor.black,
  splashColor: AppColor.grey,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColor.white,
    ),
    displayMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
    bodyLarge: TextStyle(
      height: 2,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColor.white,
    ),
    bodyMedium: TextStyle(height: 2, fontSize: 14, color: AppColor.grey),
  ),
);

ThemeData themeArbic = ThemeData(
  fontFamily: 'Cairo',
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColor.primaryColor,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColor.white),
    titleTextStyle: TextStyle(
      color: AppColor.white,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  brightness: Brightness.dark,
  primaryColor: AppColor.primaryColor,
  shadowColor: AppColor.black,
  splashColor: AppColor.grey,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColor.white,
    ),
    displayMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
    bodyLarge: TextStyle(
      height: 2,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColor.white,
    ),
    bodyMedium: TextStyle(height: 2, fontSize: 14, color: AppColor.grey),
  ),
);
