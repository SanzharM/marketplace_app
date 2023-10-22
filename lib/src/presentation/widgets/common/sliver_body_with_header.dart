import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';

class SliverBodyWithHeader extends StatelessWidget {
  const SliverBodyWithHeader({
    super.key,
    this.scrollPhysics,
    required this.title,
    this.leading,
    required this.body,
  });

  final ScrollPhysics? scrollPhysics;
  final String title;
  final Widget? leading;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: scrollPhysics ??
          const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          floating: true,
          stretch: true,
          expandedHeight: 56.h,
          leading: leading,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            expandedTitleScale: 1.3,
            stretchModes: const [StretchMode.zoomBackground],
            titlePadding: EdgeInsets.only(left: 16.w),
            title: Padding(
              padding: EdgeInsets.all(8.w).copyWith(left: 0),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: context.theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
      ],
      body: body,
    );
  }
}
