import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/presentation/widgets/buttons/app_icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.titleStyle,
    this.automaticallyImplyLeading = true,
    this.actions = const [],
    this.backgroundColor,
    this.needLeading = true,
    this.leading,
  });

  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final String? title;
  final TextStyle? titleStyle;
  final List<Widget> actions;
  final bool needLeading;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: AppBar(
            elevation: 0.0,
            backgroundColor: backgroundColor,
            automaticallyImplyLeading: automaticallyImplyLeading,
            leading: needLeading
                ? leading ??
                    AppIconButton.back(
                      onPressed: context.router.pop<void>,
                    )
                : null,
            centerTitle: true,
            title: title == null
                ? null
                : Text(
                    title!,
                    style: titleStyle ?? context.theme.textTheme.headlineSmall,
                  ),
            titleTextStyle: titleStyle ?? context.theme.textTheme.headlineSmall,
            actions: [
              ...actions,
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
