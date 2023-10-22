import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/presentation/widgets/buttons/app_button.dart';

mixin CustomDialog {
  Future<T?> showCustomDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    bool useSafeArea = true,
    required Widget child,
  }) async {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
      builder: (_) => Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(14.0)),
        ),
        child: child,
      ),
    );
  }

  Future<T?> showDecisionDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    bool useSafeArea = true,
    String? title,
    required String text,
    void Function()? onNo,
    void Function()? onYes,
  }) async {
    return showCustomDialog<T>(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (title?.isNotEmpty ?? true) ...[
            Text(
              title!,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.titleSmall,
            ),
            SizedBox(height: 4.h),
          ],
          Text(
            text,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32.h),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              AppButton(
                title: L10n.of(context).no,
                backgroundColor: ColorName.transparent,
                needBorder: true,
                borderColor: context.theme.primaryColor,
                color: context.theme.primaryColor,
                onPressed: onNo ?? context.router.pop<void>,
              ),
              SizedBox(width: 16.w),
              AppButton(
                title: L10n.of(context).yes,
                onPressed: onYes,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
