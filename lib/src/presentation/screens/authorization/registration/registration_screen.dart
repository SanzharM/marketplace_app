import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/presentation/screens/authorization/registration/bloc/registration_bloc.dart';
import 'package:marketplace_app/src/presentation/widgets/common/custom_app_bar.dart';

class RegistrationScreen extends StatefulWidget with AutoRouteWrapper {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<RegistrationBloc>(
      create: (_) => RegistrationBloc(),
      child: this,
    );
  }
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
          title: L10n.of(context).registration,
        ),
      ),
    );
  }
}
