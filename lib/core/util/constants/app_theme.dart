import 'package:basic_app/core/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    fontFamily: 'NunitoSans',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: AppColor.kPrimary,
  );
}

InputDecorationTheme inputDecorationTheme() {
  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: AppColor.kPrimary),
    gapPadding: 10,
  );
  return InputDecorationTheme(
      isDense: true,
      //contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
      hintStyle:
          TextStyle(color: AppColor.kPrimary, fontStyle: FontStyle.italic),
      prefixIconColor: AppColor.kPrimary);
}

TextTheme textTheme() {
  return TextTheme(
      bodyLarge: TextStyle(color: AppColor.kPrimary),
      bodyMedium: TextStyle(color: AppColor.kPrimary),
      bodySmall: TextStyle(color: AppColor.kPrimary),
      displayLarge: TextStyle(color: AppColor.kPrimary),
      titleLarge: TextStyle(color: AppColor.kPrimary),
      titleMedium: TextStyle(color: AppColor.kPrimary),
      titleSmall: TextStyle(color: AppColor.kPrimary),
      labelSmall: TextStyle(
        color: AppColor.kPrimary,
        letterSpacing: .2,
        fontSize: 14,
      ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: AppColor.kPrimary,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      toolbarTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'NunitoSans',
      ));
}
