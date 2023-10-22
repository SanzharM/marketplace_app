import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/flutter_gen/generated/assets.gen.dart';
import 'package:marketplace_app/src/core/utils/utils.dart';
import 'package:marketplace_app/src/presentation/screens/cart/cart_screen.dart';
import 'package:marketplace_app/src/presentation/screens/home/home_screen.dart';
import 'package:marketplace_app/src/presentation/screens/nav_bar/bloc/nav_bar_bloc.dart';
import 'package:marketplace_app/src/presentation/screens/profile/profile_screen.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  static const List<Widget> _tabs = <Widget>[
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarBloc, NavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: AnimatedSwitcher(
            duration: Utils.animationDuration,
            child: _tabs.elementAt(state.currentIndex),
          ),
          bottomNavigationBar: CupertinoTabBar(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            currentIndex: state.currentIndex,
            onTap: context.read<NavBarBloc>().changeIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Assets.icons.squares.svg(),
                activeIcon: Assets.icons.squaresFilled.svg(
                  color: context.theme.primaryColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.shoppingCart.svg(),
                activeIcon: Assets.icons.shoppingCartFilled.svg(
                  color: context.theme.primaryColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.user.svg(),
                activeIcon: Assets.icons.userFilled.svg(
                  color: context.theme.primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
