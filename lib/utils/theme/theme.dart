import 'package:flutter/material.dart';
import 'package:sohoj_kart/utils/theme/custom_themes/appbar_theme.dart';
import 'package:sohoj_kart/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:sohoj_kart/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:sohoj_kart/utils/theme/custom_themes/chip_theme.dart';
import 'package:sohoj_kart/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:sohoj_kart/utils/theme/custom_themes/outline_button_theme.dart';
import 'package:sohoj_kart/utils/theme/custom_themes/text_field_theme.dart';
import 'package:sohoj_kart/utils/theme/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: SKTextTheme.lightTextTheme,
    chipTheme: SKChipTheme.lightChipTheme,
    appBarTheme: SKAppBarTheme.lightAppBarTheme,
    checkboxTheme: SKCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: SKBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: SKElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: SKOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: SKTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: SKTextTheme.dartTextTheme,
    chipTheme: SKChipTheme.darkChipTheme,
    appBarTheme: SKAppBarTheme.darkAppBarTheme,
    checkboxTheme: SKCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: SKBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: SKElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: SKOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: SKTextFormFieldTheme.darkInputDecorationTheme,
  );
}
