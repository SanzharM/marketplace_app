import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_app/src/presentation/screens/splash/splash_screen.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(page: SplashScreen, initial: true),
  ],
)
class AppRouter extends _$AppRouter {}
