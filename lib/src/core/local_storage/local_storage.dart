import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/domain/entities/authorization/token_entity.dart';

class LocalStorage {
  const LocalStorage();

  final _storage = const FlutterSecureStorage();

  FlutterSecureStorage get storage => _storage;

  static const String _accessTokenKey = 'MarketplaceAppAccessTokenKey';
  static const String _refershTokenKey = 'MarketplaceAppRefreshTokenKey';
  static const String _themeModeKey = 'MarketplaceAppThemeModeKey';
  static const String _localeKey = 'MarketplaceAppLocaleKey';

  // TOKEN
  Future<void> setToken({String? access, String? refresh}) async {
    if (access?.isNotEmpty ?? false) {
      return _storage.write(key: _accessTokenKey, value: access!);
    }
    if (refresh?.isNotEmpty ?? false) {
      return _storage.write(key: _refershTokenKey, value: refresh!);
    }
    return;
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refershTokenKey);
    return;
  }

  Future<TokenEntity?> getToken() async {
    final String? access = await _storage.read(key: _accessTokenKey);
    final String? refresh = await _storage.read(key: _refershTokenKey);
    if (access == null && refresh == null) {
      return null;
    }
    return TokenEntity(access: access, refresh: refresh);
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
