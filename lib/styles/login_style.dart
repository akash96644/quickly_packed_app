import 'package:flutter/material.dart';
import 'package:quickly_packed_app/styles/colors.dart';

String montserratFontFamily = "Montserrat";

class LoginTextStyles {
  static TextStyle sloganText() => TextStyle(
    color: ThemeColors.blackColor,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontFamily: montserratFontFamily,
  );
  static TextStyle tanText() => TextStyle(
    color: ThemeColors.blackColor,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: montserratFontFamily,
  );

  static TextStyle minuteText() => TextStyle(
    color: ThemeColors.blackColor,
    fontSize: 25,
    fontWeight: FontWeight.w600,
    fontFamily: montserratFontFamily,
  );

  static TextStyle enterMobileText() => TextStyle(
    color: ThemeColors.blackColor,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontFamily: montserratFontFamily,
  );

  static TextStyle mobileNumberText() => TextStyle(
    color: ThemeColors.blackColor,
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontFamily: montserratFontFamily,
  );

  static TextStyle mobileNumberHintText({Color? color}) => TextStyle(
    color: color ?? ThemeColors.hintColor,
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontFamily: montserratFontFamily,
  );

  static TextStyle termText(Color color) => TextStyle(
    color: color,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontFamily: montserratFontFamily,
  );

  static TextStyle resendOTPText(Color color) => TextStyle(
    color: color,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: montserratFontFamily,
  );

  static TextStyle otpText(Color color) => TextStyle(
    color: color,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: montserratFontFamily,
  );
}
