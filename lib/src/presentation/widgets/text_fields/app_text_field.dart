import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:marketplace_app/src/core/utils/utils.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.textStyle,
    this.enabled = true,
    this.readOnly = false,
    this.isObscured = false,
    this.autofocus = false,
    this.hintText,
    this.hintColor,
    this.labelText,
    this.labelColor,
    this.withBorder = true,
    this.maxLength = 300,
    this.maxLines = 1,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.needValidator = true,
    this.validator,
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.prefixIcon,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final TextStyle? textStyle;
  final bool enabled;
  final bool readOnly;
  final bool isObscured;
  final bool autofocus;
  final String? hintText;
  final Color? hintColor;
  final String? labelText;
  final Color? labelColor;
  final bool withBorder;
  final int? maxLength;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;

  final bool needValidator;
  final String? Function(String? value)? validator;

  final void Function()? onTap;
  final void Function(String? value)? onChanged;
  final void Function()? onEditingComplete;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        TextFormField(
          controller: controller,
          enabled: enabled,
          readOnly: readOnly,
          obscureText: isObscured,
          autofocus: autofocus,
          cursorColor: context.theme.primaryColor,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          maxLines: maxLines,
          style: textStyle ?? context.theme.textTheme.bodyMedium,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          validator:
              needValidator ? (validator ?? AppValidators.nullCheckValidator) : null,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            // BORDERS
            border: withBorder
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: ColorName.lightGrey),
                  )
                : InputBorder.none,
            enabledBorder: withBorder
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: ColorName.lightGrey),
                  )
                : InputBorder.none,
            disabledBorder: withBorder
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: ColorName.lightGrey),
                  )
                : InputBorder.none,
            focusedBorder: withBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: context.theme.primaryColor),
                  )
                : InputBorder.none,
            errorBorder: withBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: context.theme.colorScheme.error),
                  )
                : InputBorder.none,
            focusedErrorBorder: withBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: context.theme.colorScheme.error),
                  )
                : InputBorder.none,
            counterText: '',
            counter: null,
            errorMaxLines: 3,
            errorStyle: context.theme.textTheme.displaySmall?.apply(
              color: context.theme.colorScheme.error,
            ),
            hintText: hintText,
            hintMaxLines: maxLines,
            hintStyle: context.theme.textTheme.bodyMedium?.apply(
              color: hintColor ?? ColorName.darkGrey,
            ),
            labelText: labelText,
            labelStyle: context.theme.textTheme.displaySmall?.apply(
              color: labelColor ?? ColorName.darkGrey,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.w,
              horizontal: 12.w,
            ).copyWith(
              left: prefixIcon != null ? 32.w : null,
              right: suffixIcon != null ? 32.w : null,
            ),
          ),
        ),
        if (prefixIcon != null) ...[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: prefixIcon!,
            ),
          ),
        ],
        if (suffixIcon != null) ...[
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: suffixIcon!,
            ),
          ),
        ],
      ],
    );
  }
}
