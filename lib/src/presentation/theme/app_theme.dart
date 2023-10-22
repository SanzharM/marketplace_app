import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplace_app/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:marketplace_app/src/presentation/theme/text_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: ColorName.blue,
      scaffoldBackgroundColor: ColorName.white,
      hintColor: ColorName.darkGrey,
      colorScheme: const ColorScheme.light(
        primary: ColorName.blue,
        error: ColorName.red,
        secondary: ColorName.darkGrey,
        background: ColorName.white,
      ),

      // Text
      fontFamily: AppTextTheme.fontFamily,
      textTheme: AppTextTheme.getTextTheme(
        color: ColorName.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorName.white,
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: AppTextTheme.getTextTheme(color: ColorName.black).headlineMedium,
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        primaryColor: ColorName.black,
        scaffoldBackgroundColor: ColorName.white,
        textTheme: CupertinoTextThemeData(
          primaryColor: ColorName.white,
          textStyle: AppTextTheme.getTextTheme(color: ColorName.white).bodyLarge,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ColorName.black,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: ColorName.blue,
      scaffoldBackgroundColor: ColorName.white,
      hintColor: ColorName.darkGrey,
      colorScheme: const ColorScheme.dark(
        primary: ColorName.blue,
        error: ColorName.red,
        secondary: ColorName.lightGrey,
        background: ColorName.white,
      ),

      // Text
      fontFamily: AppTextTheme.fontFamily,
      textTheme: AppTextTheme.getTextTheme(
        color: ColorName.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorName.white,
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: AppTextTheme.getTextTheme(color: ColorName.white).headlineMedium,
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        primaryColor: ColorName.black,
        scaffoldBackgroundColor: ColorName.white,
        textTheme: CupertinoTextThemeData(
          primaryColor: ColorName.white,
          textStyle: AppTextTheme.getTextTheme(color: ColorName.white).bodyLarge,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ColorName.black,
      ),
    );
  }
}
