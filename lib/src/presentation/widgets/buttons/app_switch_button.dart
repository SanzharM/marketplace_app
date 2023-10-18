import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';

class AppSwitchButton extends StatelessWidget {
  const AppSwitchButton({
    super.key,
    required this.value,
    this.onChanged,
    this.text,
    this.child,
    this.padding = EdgeInsets.zero,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final bool value;
  final void Function(bool newValue)? onChanged;

  final String? text;
  final Widget? child;

  final EdgeInsets padding;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: padding,
      onPressed: onChanged == null ? null : () => onChanged!(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeColor: context.theme.primaryColor,
          ),
          if (text?.isNotEmpty ?? false) ...[
            SizedBox(width: 8.w),
            Flexible(
              child: Text(
                text!,
                textAlign: TextAlign.left,
                style: context.theme.textTheme.bodyMedium,
              ),
            ),
          ] else if (child != null) ...[
            SizedBox(width: 8.w),
            Flexible(
              child: child!,
            ),
          ],
        ],
      ),
    );
  }
}
