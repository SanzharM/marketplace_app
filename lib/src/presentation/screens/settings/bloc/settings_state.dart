part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.themeMode = ThemeMode.system,
    this.currentLocale = const Locale('ru'),
    this.appVersion = '',
    this.buildNumber = '',
  });

  final ThemeMode themeMode;
  final Locale currentLocale;
  final String appVersion;
  final String buildNumber;

  @override
  List<Object> get props => [
        themeMode,
        currentLocale,
        appVersion,
        buildNumber,
      ];

  SettingsState copyWith({
    ThemeMode? themeMode,
    Locale? currentLocale,
    String? appVersion,
    String? buildNumber,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      currentLocale: currentLocale ?? this.currentLocale,
      appVersion: appVersion ?? this.appVersion,
      buildNumber: buildNumber ?? this.buildNumber,
    );
  }
}
