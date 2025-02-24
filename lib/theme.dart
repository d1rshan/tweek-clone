import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  fontFamily: 'SuisseIntl',
  colorScheme: ColorScheme.dark(
    primary: Colors.black,
    inversePrimary: Colors.white,
    secondary: Color.fromRGBO(39, 40, 43, 1.0),
    tertiary: Color.fromRGBO(229, 215, 250, 1.0),
    tertiaryContainer: Color.fromRGBO(217, 204, 237, 1.0),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 20),
    bodyMedium: TextStyle(fontSize: 16),
  ),
);

Color black = Colors.black;
Color white = Colors.white;
Color grey = Color.fromRGBO(39, 40, 43, 1.0);
Color lightPurple = Color.fromRGBO(229, 215, 250, 1.0);
Color purple = Color.fromRGBO(217, 204, 237, 1.0);
Color darkerPurple = Color.fromRGBO(154, 145, 168, 1);

// Text style for bottom sheet & settings page (same for dark and light theme)

TextStyle titleLarge({Color color = Colors.black}) {
  return TextStyle(color: color, fontSize: 28, fontWeight: FontWeight.bold);
}

TextStyle titleMedium({Color color = Colors.black}) {
  return TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.bold);
}

TextStyle titleSmall({Color color = Colors.black}) {
  return TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold);
}

TextStyle bodyLarge({Color color = Colors.black}) {
  return TextStyle(color: color, fontSize: 20);
}

TextStyle bodyMedium({Color color = Colors.black}) {
  return TextStyle(color: color, fontSize: 16);
}
