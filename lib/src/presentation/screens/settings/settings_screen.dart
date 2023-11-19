import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/flutter_gen/generated/assets.gen.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/core/utils/utils.dart';
import 'package:marketplace_app/src/presentation/screens/settings/bloc/settings_bloc.dart';
import 'package:marketplace_app/src/presentation/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:marketplace_app/src/presentation/widgets/buttons/app_icon_button.dart';
import 'package:marketplace_app/src/presentation/widgets/buttons/app_text_button.dart';
import 'package:marketplace_app/src/presentation/widgets/common/custom_app_bar.dart';
import 'package:marketplace_app/src/presentation/widgets/language/language_mixin.dart';

class SettingsScreen extends StatelessWidget with LanguageMixin, CustomBottomSheetMixin {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String mobileGit = 'https://github.com/SanzharM/marketplace_app';
    const String backendGit = 'https://github.com/ayananygmetova/BFDjango-Endterm';
    const String inspiration = 'https://technodom.kz';
    const String figma = 'https://www.figma.com/community/file/1161536955234903894';
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: L10n.of(context).settings,
          ),
          body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: DecoratedBox(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                          side: BorderSide(
                            color: context.theme.hintColor.withOpacity(0.33),
                          ),
                        ),
                      ),
                      child: FlutterLogo(
                        size: 128.h,
                        style: FlutterLogoStyle.markOnly,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    '${state.appVersion} (${state.buildNumber})',
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.bodySmall,
                  ),
                  SizedBox(height: 24.h),

                  // Languages
                  Text(
                    L10n.of(context).appLanguage,
                    textAlign: TextAlign.left,
                    style: context.theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.h),
                  AppTextButton(
                    text: state.currentLocale.languageName,
                    textAlign: TextAlign.left,
                    buttonAlignment: Alignment.centerLeft,
                    onPressed: () => showLanguages(context),
                  ),
                  SizedBox(height: 24.h),

                  // ThemeModes
                  Text(
                    L10n.of(context).appTheme,
                    textAlign: TextAlign.left,
                    style: context.theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.h),
                  AppTextButton(
                    text: state.themeMode.localizedName,
                    textAlign: TextAlign.left,
                    buttonAlignment: Alignment.centerLeft,
                    onPressed: () => showThemeModes(context),
                  ),
                  SizedBox(height: 24.h),

                  // References
                  Text(
                    L10n.of(context).references,
                    textAlign: TextAlign.left,
                    style: context.theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 20.h),
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    runSpacing: 32.h,
                    spacing: 16.w,
                    children: <Widget>[
                      ReferenceWidget(
                        icon: Assets.icons.mobile.svg(
                          height: 48.h,
                          color: context.theme.primaryColor,
                        ),
                        title: 'Mobile',
                        value: 'Sanjar Manabayev',
                        valueLeading: Assets.icons.github.svg(
                          color: context.theme.iconTheme.color,
                          width: 22.w,
                        ),
                        onPressed: () => Utils.launchLinkString(mobileGit),
                      ),
                      ReferenceWidget(
                        icon: Assets.icons.server.svg(
                          height: 48.h,
                          color: context.theme.primaryColor,
                        ),
                        title: 'Back-end',
                        value: 'Ayana Nygmetova',
                        valueLeading: Assets.icons.github.svg(
                          color: context.theme.iconTheme.color,
                          width: 22.w,
                        ),
                        onPressed: () => Utils.launchLinkString(backendGit),
                      ),
                      ReferenceWidget(
                        icon: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Assets.icons.technodom.image(height: 48.h),
                        ),
                        title: L10n.of(context).inspiredBy,
                        value: 'TechnoDom.kz',
                        onPressed: () => Utils.launchLinkString(inspiration),
                      ),
                      ReferenceWidget(
                        icon: Assets.icons.figma.svg(height: 48.h),
                        title: 'UI components',
                        value: 'Figma',
                        onPressed: () => Utils.launchLinkString(figma),
                      ),
                    ],
                  ),
                  SizedBox(height: kBottomNavigationBarHeight.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showThemeModes(BuildContext context) async {
    final List<ThemeMode> themeModes = List<ThemeMode>.from(ThemeMode.values)
      ..remove(ThemeMode.system);
    return showCustomBottomSheet<void>(
      context: context,
      builder: (_) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                L10n.of(context).appTheme,
                textAlign: TextAlign.left,
                style: context.theme.textTheme.titleLarge,
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: AppIconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context.read<SettingsBloc>().update(
                              themeMode: ThemeMode.system,
                            );
                        context.router.pop<void>();
                      },
                      icon: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            ThemeMode.system.localizedName,
                            textAlign: TextAlign.center,
                            style: context.theme.textTheme.bodyMedium?.apply(
                              color: context.themeMode.isSystem
                                  ? context.theme.primaryColor
                                  : null,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            L10n.current.sameAsOnTheDevice,
                            textAlign: TextAlign.center,
                            style: context.theme.textTheme.bodySmall?.copyWith(
                              color: context.theme.hintColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  for (var theme in themeModes) ...[
                    SizedBox(width: 16.w),
                    Flexible(
                      flex: 2,
                      child: AppIconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          context.read<SettingsBloc>().update(
                                themeMode: theme,
                              );
                          context.router.pop<void>();
                        },
                        icon: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              theme == ThemeMode.dark
                                  ? CupertinoIcons.moon
                                  : CupertinoIcons.sun_min,
                              color: theme == context.themeMode
                                  ? context.theme.primaryColor
                                  : null,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              theme.localizedName,
                              textAlign: TextAlign.center,
                              style: context.theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReferenceWidget extends StatelessWidget {
  const ReferenceWidget({
    Key? key,
    required this.title,
    required this.value,
    this.valueLeading,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  final String title;
  final String value;
  final Widget? valueLeading;
  final void Function() onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (icon != null) ...[
            icon!,
            SizedBox(height: 12.h),
          ],
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (valueLeading != null) ...[
                valueLeading!,
                SizedBox(width: 8.w),
              ],
              Flexible(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.bodySmall?.apply(
                    color: context.theme.hintColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
