part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class SettingsInitialEvent extends SettingsEvent {}

class SettingsUpdateEvent extends SettingsEvent {
  final ThemeMode? themeMode;
  final Locale? locale;
  final String? appVersion;
  final String? buildNumber;

  const SettingsUpdateEvent({
    this.themeMode,
    this.locale,
    this.appVersion,
    this.buildNumber,
  });

  @override
  List<Object?> get props => [themeMode, locale, appVersion, buildNumber];
}
