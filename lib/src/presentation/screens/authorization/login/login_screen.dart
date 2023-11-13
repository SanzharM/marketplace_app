import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/presentation/screens/authorization/login/bloc/login_bloc.dart';
import 'package:marketplace_app/src/presentation/widgets/common/custom_app_bar.dart';

class LoginScreen extends StatefulWidget with AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _loginController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.focus.hasFocus ? context.focus.unfocus : null,
      child: Scaffold(
        appBar: CustomAppBar(
          title: L10n.of(context).authorization,
        ),
      ),
    );
  }
}
