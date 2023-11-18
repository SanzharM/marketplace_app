import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/core/utils/utils.dart';

class AppValidators {
  static String? nullCheckValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return L10n.current.fillTheField;
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    final String? rawPhoneNumber = Utils.numbersOnly(value);
    if ((rawPhoneNumber?.length ?? 0) < 11) {
      return L10n.current.incorrectPhone;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return L10n.current.fillTheField;
    }
    if (value!.length < 6) {
      return L10n.current.incorrectPassword;
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return L10n.current.fillTheField;
    }
    if (!value!.contains('@')) {
      return L10n.current.incorrectEmail;
    }
    return null;
  }
}
