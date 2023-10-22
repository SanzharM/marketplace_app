import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:marketplace_app/src/core/flutter_gen/generated/fonts.gen.dart';

class AppTextTheme {
  static const String fontFamily = FontFamily.inter;

  static const TextStyle _primaryTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
    letterSpacing: 0,
  );

  static TextTheme getTextTheme({Color color = ColorName.black}) {
    return TextTheme(
      // HEADLINES
      headlineLarge: _primaryTextStyle.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineMedium: _primaryTextStyle.copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      headlineSmall: _primaryTextStyle.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: color,
      ),

      // BODY
      bodyLarge: _primaryTextStyle.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      bodyMedium: _primaryTextStyle.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodySmall: _primaryTextStyle.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),

      // DISPLAY
      displayLarge: _primaryTextStyle.copyWith(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      displayMedium: _primaryTextStyle.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      displaySmall: _primaryTextStyle.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}
