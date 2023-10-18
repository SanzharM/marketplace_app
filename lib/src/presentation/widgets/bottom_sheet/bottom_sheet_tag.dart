import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/flutter_gen/generated/colors.gen.dart';

class BottomSheetTag extends StatelessWidget {
  const BottomSheetTag({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 39.w,
          height: 4.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: color ?? AppColors.lightGrey,
          ),
        ),
      ],
    );
  }
}
