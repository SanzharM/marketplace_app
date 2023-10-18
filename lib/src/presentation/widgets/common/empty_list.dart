import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Text(
          L10n.of(context).listIsEmpty,
          style: context.theme.textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class EmptyListScrollable extends StatelessWidget {
  const EmptyListScrollable({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: EdgeInsets.all(16.w),
        child: Container(
          height: context.mediaQuery.size.height / 1.5,
          width: double.maxFinite,
          alignment: Alignment.center,
          child: Text(
            L10n.of(context).listIsEmpty,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
