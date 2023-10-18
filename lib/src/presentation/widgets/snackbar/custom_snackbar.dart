import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/presentation/widgets/buttons/app_icon_button.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            message,
            textAlign: TextAlign.left,
            style: context.theme.textTheme.bodyMedium?.apply(
              color: context.theme.scaffoldBackgroundColor,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        SizedBox(
          width: 18.w,
          height: 18.w,
          child: AppIconButton.close(
            color: context.theme.scaffoldBackgroundColor,
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
          ),
        ),
      ],
    );
  }
}
