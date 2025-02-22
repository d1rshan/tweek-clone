import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.dark(
      surface: Colors.black,
      primary: Color.fromRGBO(39, 40, 43, 1.0),
      tertiary: Color.fromRGBO(14, 14, 14, 1.0),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 20),
      bodyMedium: TextStyle(fontSize: 16),
    ));
