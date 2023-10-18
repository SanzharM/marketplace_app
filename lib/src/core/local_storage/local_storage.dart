import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';

class LocalStorage {
  const LocalStorage();

  final _storage = const FlutterSecureStorage();

  FlutterSecureStorage get storage => _storage;

  static const String _tokenKey = 'MarketplaceAppTokenKey';
  static const String _themeModeKey = 'MarketplaceAppThemeModeKey';
  static const String _localeKey = 'MarketplaceAppLocaleKey';

  // TOKEN
  Future<void> setToken(String? token) {
    if (token?.isEmpty ?? true) {
      return _storage.delete(key: _tokenKey);
    }
    return _storage.write(key: _tokenKey, value: token!);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  // THEME MODE
  Future<void> setThemeMode(ThemeMode themeMode) async {
    return await _storage.write(
      key: _themeModeKey,
      value: themeMode.name,
    );
  }

  Future<ThemeMode> getThemeMode() async {
    final String? value = await _storage.read(key: _themeModeKey);
    if (value == ThemeMode.light.name) {
      return ThemeMode.light;
    } else if (value == ThemeMode.dark.name) {
      return ThemeMode.dark;
    }
    return ThemeMode.system;
  }

  // LOCALE
  Future<void> setLocale(Locale locale) async {
    return await _storage.write(
      key: _localeKey,
      value: locale.languageCode,
    );
  }

  Future<Locale> getLocale() async {
    final String? value = await _storage.read(key: _localeKey);
    Locale matchingLocale = L10n.supportedLocales.first;
    if (L10n.supportedLocales.any((locale) => locale.languageCode == value)) {
      matchingLocale = L10n.supportedLocales.firstWhere(
        (locale) => locale.languageCode == value,
      );
    }
    return matchingLocale;
  }
}
