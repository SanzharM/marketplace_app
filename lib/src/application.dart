import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/core/app_router/app_router.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/core/utils/utils.dart';
import 'package:marketplace_app/src/presentation/screens/settings/bloc/settings_bloc.dart';
import 'package:marketplace_app/src/presentation/theme/app_theme.dart';
import 'package:marketplace_app/src/service_locator.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  static const String title = 'MarketPlace';

  static void resetGlobalBlocs(
    BuildContext context, {
    bool resetUserBloc = true,
  }) {
    return;
  }

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final AppRouter _appRouter = sl<AppRouter>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<SettingsBloc>(
          lazy: false,
          create: (_) => SettingsBloc()..initial(),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(872, 365),
            splitScreenMode: true,
            child: MaterialApp.router(
              title: Application.title,
              debugShowCheckedModeBanner: false,
              // Routing
              routeInformationParser: _appRouter.defaultRouteParser(),
              routerDelegate: _appRouter.delegate(),
              routeInformationProvider: _appRouter.routeInfoProvider(),

              // Theme
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: state.themeMode,
              themeAnimationCurve: Curves.easeInOut,
              themeAnimationDuration: Utils.animationDuration,

              // Localization
              locale: state.currentLocale,
              supportedLocales: L10n.supportedLocales,
              localizationsDelegates: L10n.delegates,
            ),
          );
        },
      ),
    );
  }
}
