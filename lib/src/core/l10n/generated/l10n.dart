// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Ошибка`
  String get error {
    return Intl.message(
      'Ошибка',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Что-то пошло не так`
  String get somethingWentWrong {
    return Intl.message(
      'Что-то пошло не так',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Время сессия истекло`
  String get sessionExpired {
    return Intl.message(
      'Время сессия истекло',
      name: 'sessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Нет подключения к Интернету`
  String get noInternetConnection {
    return Intl.message(
      'Нет подключения к Интернету',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Заполните поле`
  String get fillTheField {
    return Intl.message(
      'Заполните поле',
      name: 'fillTheField',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось открыть ссылку`
  String get unableToLoadTheLink {
    return Intl.message(
      'Не удалось открыть ссылку',
      name: 'unableToLoadTheLink',
      desc: '',
      args: [],
    );
  }

  /// `Список пуст`
  String get listIsEmpty {
    return Intl.message(
      'Список пуст',
      name: 'listIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Некорректный номер телефона`
  String get incorrectPhone {
    return Intl.message(
      'Некорректный номер телефона',
      name: 'incorrectPhone',
      desc: '',
      args: [],
    );
  }

  /// `Русский`
  String get russian {
    return Intl.message(
      'Русский',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `Қазақша`
  String get kazakh {
    return Intl.message(
      'Қазақша',
      name: 'kazakh',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Да`
  String get yes {
    return Intl.message(
      'Да',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Нет`
  String get no {
    return Intl.message(
      'Нет',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Далее`
  String get next {
    return Intl.message(
      'Далее',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Назад`
  String get back {
    return Intl.message(
      'Назад',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Готово`
  String get done {
    return Intl.message(
      'Готово',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Завершить`
  String get complete {
    return Intl.message(
      'Завершить',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Отмена`
  String get cancel {
    return Intl.message(
      'Отмена',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Отменить`
  String get toCancel {
    return Intl.message(
      'Отменить',
      name: 'toCancel',
      desc: '',
      args: [],
    );
  }

  /// `Продолжить`
  String get toContinue {
    return Intl.message(
      'Продолжить',
      name: 'toContinue',
      desc: '',
      args: [],
    );
  }

  /// `Оплатить`
  String get toPay {
    return Intl.message(
      'Оплатить',
      name: 'toPay',
      desc: '',
      args: [],
    );
  }

  /// `Оплата`
  String get payment {
    return Intl.message(
      'Оплата',
      name: 'payment',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
