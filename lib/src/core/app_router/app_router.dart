import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_app/src/presentation/screens/cart/cart_screen.dart';
import 'package:marketplace_app/src/presentation/screens/common/result_screen/result_screen.dart';
import 'package:marketplace_app/src/presentation/screens/home/home_screen.dart';
import 'package:marketplace_app/src/presentation/screens/home/features/product_screen.dart';
import 'package:marketplace_app/src/presentation/screens/nav_bar/nav_bar_screen.dart';
import 'package:marketplace_app/src/presentation/screens/profile/profile_screen.dart';
import 'package:marketplace_app/src/presentation/screens/settings/settings_screen.dart';
import 'package:marketplace_app/src/presentation/screens/common/splash/splash_screen.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(page: SplashScreen, initial: true),
    CustomRoute(
      page: ResultScreen,
      customRouteBuilder: TransitionsBuilders.slideBottom,
    ),
    AutoRoute(page: NavBarScreen),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: CartScreen),
    AutoRoute(page: ProfileScreen),
    AutoRoute(page: SettingsScreen),
    AutoRoute(page: ProductScreen),
  ],
)
class AppRouter extends _$AppRouter {}
