import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_app/src/core/app_router/app_router.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/presentation/screens/common/result_screen/result_screen.dart';

class UnauthorizedProfileWidget extends StatelessWidget {
  const UnauthorizedProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResultScreen(
      title: L10n.of(context).toLogin,
      text: L10n.of(context).needToLoginText,
      buttonTitle: L10n.of(context).next,
      onPressed: () {
        context.router.push<void>(const LoginRoute());
      },
    );
  }
}
