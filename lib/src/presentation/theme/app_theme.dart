import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplace_app/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:marketplace_app/src/presentation/theme/text_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.blue,
      scaffoldBackgroundColor: AppColors.white,
      hintColor: AppColors.darkGrey,
      colorScheme: const ColorScheme.light(
        primary: AppColors.blue,
        error: AppColors.red,
        secondary: AppColors.darkGrey,
        background: AppColors.white,
      ),

      // Text
      fontFamily: AppTextTheme.fontFamily,
      textTheme: AppTextTheme.getTextTheme(
        color: AppColors.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: AppTextTheme.getTextTheme(color: AppColors.black).headlineMedium,
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        primaryColor: AppColors.black,
        scaffoldBackgroundColor: AppColors.white,
        textTheme: CupertinoTextThemeData(
          primaryColor: AppColors.white,
          textStyle: AppTextTheme.getTextTheme(color: AppColors.white).bodyLarge,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.black,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.blue,
      scaffoldBackgroundColor: AppColors.white,
      hintColor: AppColors.darkGrey,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.blue,
        error: AppColors.red,
        secondary: AppColors.lightGrey,
        background: AppColors.white,
      ),

      // Text
      fontFamily: AppTextTheme.fontFamily,
      textTheme: AppTextTheme.getTextTheme(
        color: AppColors.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: AppTextTheme.getTextTheme(color: AppColors.black).headlineMedium,
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        primaryColor: AppColors.black,
        scaffoldBackgroundColor: AppColors.white,
        textTheme: CupertinoTextThemeData(
          primaryColor: AppColors.white,
          textStyle: AppTextTheme.getTextTheme(color: AppColors.white).bodyLarge,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.black,
      ),
    );
  }
}
