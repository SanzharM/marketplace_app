import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppFormatters {
  static final MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static final TextInputFormatter nameFormatter = FilteringTextInputFormatter.allow(
    RegExp(r'[\sA-Za-zА-Яа-я]'),
  );
  static final TextInputFormatter numberFormatter = FilteringTextInputFormatter.allow(
    RegExp('[0-9]'),
  );
}
