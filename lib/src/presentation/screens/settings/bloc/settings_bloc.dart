import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketplace_app/src/core/local_storage/local_storage.dart';
import 'package:marketplace_app/src/service_locator.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/material.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  void initial() => add(SettingsInitialEvent());
  void update({ThemeMode? themeMode, Locale? locale}) =>
      add(SettingsUpdateEvent(themeMode: themeMode, locale: locale));

  SettingsBloc() : super(const SettingsState()) {
    on<SettingsInitialEvent>(_initial);
    on<SettingsUpdateEvent>(_update);
  }

  void _initial(
    SettingsInitialEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final LocalStorage localStorage = sl<LocalStorage>();
    emit(state.copyWith(
      themeMode: await localStorage.getThemeMode(),
      currentLocale: await localStorage.getLocale(),
    ));

    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    emit(state.copyWith(
      appVersion: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
    ));
  }

  void _update(
    SettingsUpdateEvent event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(
      themeMode: event.themeMode,
      currentLocale: event.locale,
      appVersion: event.appVersion,
      buildNumber: event.buildNumber,
    ));
  }
}
