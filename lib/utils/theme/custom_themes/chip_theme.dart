import 'package:flutter/material.dart';

class SKChipTheme{
  SKChipTheme._();

  ///Chip Light Theme
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor:  Colors.grey.withOpacity(.4),
    labelStyle: const TextStyle(color:  Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical : 12),
    checkmarkColor: Colors.white
  );


  ///Chip dark Theme
  static ChipThemeData darkChipTheme = ChipThemeData(
      disabledColor:  Colors.grey.withOpacity(.4),
      labelStyle: const TextStyle(color:  Colors.white),
      selectedColor: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical : 12),
      checkmarkColor: Colors.white
  );
}