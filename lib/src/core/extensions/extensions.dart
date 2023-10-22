import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/presentation/screens/settings/bloc/settings_bloc.dart';
import 'package:marketplace_app/src/presentation/widgets/snackbar/custom_snackbar.dart';

extension XBuildContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  NavigatorState get navigator => Navigator.of(this);

  // StackRouter get router => AutoRouter.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get sizeOf => MediaQuery.sizeOf(this);

  FocusScopeNode get focus => FocusScope.of(this);

  ThemeMode get themeMode => read<SettingsBloc>().state.themeMode;

  Locale get locale => read<SettingsBloc>().state.currentLocale;

  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: theme.textTheme.bodyMedium?.color?.withOpacity(0.85),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 2000),
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.all(16.w),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        content: CustomSnackbar(message: message),
      ),
    );
  }
}

extension XLocale on Locale {
  String get languageName {
    switch (languageCode) {
      case 'ru':
        return L10n.current.russian;
      case 'kk':
        return L10n.current.kazakh;
      case 'en':
        return L10n.current.english;
      default:
        return languageCode;
    }
  }
}

extension XThemeMode on ThemeMode {
  bool get isSystem => this == ThemeMode.system;
  bool get isLight => this == ThemeMode.light;
  bool get isDark => this == ThemeMode.dark;
}

extension XResponse on Response {
  bool get isSuccess {
    if (statusCode == null) return false;
    return statusCode! >= 200 && statusCode! <= 299;
  }

  bool get isNotSuccess => !isSuccess;

  bool get isDataMap => data is Map;

  bool get isDataNotMap => data is! Map;

  String? get detail {
    if (isDataNotMap) return null;
    if (data['detail'] is! String) return null;
    return data['detail'] as String;
  }
}
