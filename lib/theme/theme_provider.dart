import 'package:flutter/material.dart';

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
      bodySmall: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),
      titleSmall: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
      titleLarge: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    ),
    extensions: const [],
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(0, 3, 3, 3),
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
      bodyMedium: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
      bodySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      headlineLarge: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color.fromRGBO(47, 53, 58, 1),
      secondary: Color.fromRGBO(28, 31, 34, 1),
    ),
    dividerColor: Colors.white,
    extensions: const [],
  );
}

const lightTextTheme = TextTheme(
  bodyLarge:
      TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
  bodySmall: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
  bodyMedium:
      TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),
  titleSmall:
      TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
  titleLarge:
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
);

const darkTextTheme = TextTheme(
  bodyLarge:
      TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
  bodyMedium:
      TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
  bodySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
  titleSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
  titleLarge:
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
  headlineLarge:
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
);
