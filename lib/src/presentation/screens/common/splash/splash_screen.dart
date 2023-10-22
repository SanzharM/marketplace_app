import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_app/src/core/app_router/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 800)).then(
      (value) => context.router.replaceAll([const NavBarRoute()]),
    );
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
