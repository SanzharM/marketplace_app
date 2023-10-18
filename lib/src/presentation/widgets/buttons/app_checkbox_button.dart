import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';

class AppCheckboxButton extends StatelessWidget {
  const AppCheckboxButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.text,
    this.child,
    this.padding = EdgeInsets.zero,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final bool value;
  final void Function(bool newValue) onChanged;
  final String? text;
  final Widget? child;

  final EdgeInsets padding;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => onChanged(!value),
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          // TODO: Add svg icons
          // AnimatedSwitcher(
          //   duration: Utils.animationDuration,
          //   child: value
          //       ? Assets.icons.checkboxMarked.svg()
          //       : SizedBox(
          //           child: Assets.icons.checkbox.svg(),
          //         ),
          // ),
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
