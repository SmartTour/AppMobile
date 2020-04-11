import 'package:flutter/material.dart';

class BaseTheme {
  static ThemeData data() {
    return ThemeData(
        primarySwatch: Colors.blue,
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary));
  }
}
