import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

export 'app_formatters.dart';
export 'app_validators.dart';

class Utils {
  static const Duration animationDuration = Duration(milliseconds: 200);
  static const Duration delayDuration = Duration(milliseconds: 500);

  static DateTime? parseDate(dynamic value, {String format = 'yyyy.MM.dd'}) {
    if (value == null || value == 'null' || value == '') {
      return null;
    }
    try {
      return DateFormat(format).parse(value.toString());
    } catch (e) {
      return null;
    }
  }

  static String formatDate(DateTime date, {String format = 'yyyy.MM.dd'}) {
    return DateFormat(format).format(date);
  }

  static String? numbersOnly(String? value) {
    if (value == null) return null;
    String temp = value.replaceAll(RegExp(r'[^0-9]'), '');
    return temp;
  }

  static String? formatPhone(String? phone) {
    if ((phone?.length ?? 0) < 11) {
      return phone;
    }
    phone = Utils.numbersOnly(phone);
    return '+${phone!.substring(0, 1)} '
        '(${phone.substring(1, 4)}) '
        '${phone.substring(4, 7)}-'
        '${phone.substring(7, 9)}-'
        '${phone.substring(9)}';
  }

  static bool? tryParseBoolean(String? value) {
    if ((value?.isEmpty ?? true) || value?.toLowerCase() == 'null') {
      return null;
    }
    if (value!.toLowerCase() == 'true') {
      return true;
    }
    if (value.toLowerCase() == '1') {
      return true;
    }
    return false;
  }

  static Future<void> launchLinkString(
    String url, {
    /// if Android -> LaunchMode.externalApplication
    /// if iOS -> LaunchMode.inAppWebView
    LaunchMode? launchMode,

    /// if launch failed -> shows snackbar
    BuildContext? context,
  }) async {
    return await canLaunchUrlString(url).then<void>(
      (bool canLaunch) async {
        if (canLaunch) {
          final mode = launchMode ??
              (Platform.isAndroid
                  ? LaunchMode.externalApplication
                  : LaunchMode.inAppWebView);
          await launchUrlString(url, mode: mode);
          return;
        }
        if (context != null) {
          context.showSnackBar(L10n.current.unableToLoadTheLink);
        }
      },
    );
  }

  static Future<void> callPhone(
    String? phone, {
    /// if launch failed -> shows snackbar
    BuildContext? context,
  }) async {
    String url = 'tel:';
    if (Utils.numbersOnly(phone)?.length == phone?.length) {
      url += phone ?? '';
    } else {
      url += Utils.numbersOnly(phone) ?? '';
    }
    return await canLaunchUrlString(url).then<void>(
      (bool canLaunch) async {
        if (canLaunch) {
          await launchUrlString(url);
          return;
        }
        if (context != null) {
          context.showSnackBar(L10n.current.unableToLoadTheLink);
        }
      },
    );
  }

  static Future<bool> copyToClipboard(String data) async {
    try {
      await Clipboard.setData(ClipboardData(text: data));
      return true;
    } catch (e) {
      return false;
    }
  }
}
