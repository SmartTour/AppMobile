import 'package:flutter/material.dart';

class BaseTheme {
  static ThemeData data() {
    return ThemeData(
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.lightBlueAccent,
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary));
  }
}
