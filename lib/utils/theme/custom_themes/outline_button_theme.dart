import 'package:flutter/material.dart';

class SKOutlineButtonTheme {
  SKOutlineButtonTheme._();

  ///Outline Button Light Theme
  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.black,
        side: const BorderSide(color: Colors.blue),
        textStyle: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
  );

  ///Outline Button dark Theme
  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.blueAccent),
        textStyle: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
  );
}
