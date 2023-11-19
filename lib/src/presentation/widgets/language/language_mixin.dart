import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/presentation/screens/settings/bloc/settings_bloc.dart';
import 'package:marketplace_app/src/presentation/widgets/bottom_sheet/bottom_sheet_tag.dart';
import 'package:marketplace_app/src/presentation/widgets/buttons/app_text_button.dart';

mixin LanguageMixin {
  void showLanguages(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        minWidth: context.sizeOf.height * 0.3,
        maxHeight: context.sizeOf.height * 0.87,
      ),
      enableDrag: true,
      elevation: 0,
      useSafeArea: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: const BottomSheetTag(),
            ),
            Padding(
              padding: EdgeInsets.all(16.h),
              child: Text(
                L10n.of(context).appLanguage,
                textAlign: TextAlign.left,
                style: context.theme.textTheme.titleLarge,
              ),
            ),
            Flexible(
              child: BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    padding: EdgeInsets.all(16.w),
                    itemCount: L10n.supportedLocales.length,
                    separatorBuilder: (_, __) => SizedBox(height: 16.h),
                    itemBuilder: (_, i) {
                      final Locale locale = L10n.supportedLocales[i];
                      return AppTextButton(
                        text: locale.languageName,
                        textAlign: TextAlign.left,
                        buttonAlignment: Alignment.centerLeft,
                        onPressed: () {
                          context.read<SettingsBloc>().update(
                                locale: locale,
                              );
                          context.router.pop<void>();
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
