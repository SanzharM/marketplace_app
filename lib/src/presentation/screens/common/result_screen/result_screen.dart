import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/presentation/widgets/buttons/app_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    this.widget,
    required this.title,
    this.text,
    this.buttonTitle,
    this.onPressed,
  });

  final Widget? widget;
  final String title;
  final String? text;
  final String? buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            if (widget != null) ...[
              widget!,
              SizedBox(height: 24.h),
            ],
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (text?.isNotEmpty ?? false) ...[
              SizedBox(height: 16.h),
              Text(
                text!,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.bodyMedium,
              ),
            ],
            const Spacer(),
            SizedBox(height: kBottomNavigationBarHeight.h * 2),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: onPressed == null
          ? null
          : Padding(
              padding: EdgeInsets.all(16.w),
              child: AppButton(
                title: buttonTitle ?? L10n.of(context).done,
                onPressed: onPressed,
              ),
            ),
    );
  }
}
