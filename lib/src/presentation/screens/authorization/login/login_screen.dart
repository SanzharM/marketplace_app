import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace_app/src/common/state_status.dart';
import 'package:marketplace_app/src/core/app_router/app_router.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/flutter_gen/generated/assets.gen.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/core/utils/utils.dart';
import 'package:marketplace_app/src/presentation/screens/authorization/login/bloc/login_bloc.dart';
import 'package:marketplace_app/src/presentation/widgets/buttons/app_button.dart';
import 'package:marketplace_app/src/presentation/widgets/buttons/app_text_button.dart';
import 'package:marketplace_app/src/presentation/widgets/common/custom_app_bar.dart';
import 'package:marketplace_app/src/presentation/widgets/text_fields/app_text_field.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isError) {
          return context.showSnackBar(state.message);
        }

        if (state.status.isSuccess) {
          context.router.pop<void>();
          return;
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: context.focus.hasFocus ? context.focus.unfocus : null,
          child: Scaffold(
            appBar: CustomAppBar(
              title: L10n.of(context).authorization,
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      L10n.of(context).needToLoginText,
                      textAlign: TextAlign.left,
                      style: context.theme.textTheme.bodySmall?.apply(
                        color: context.theme.hintColor,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    AppTextField(
                      controller: _loginController,
                      labelText: L10n.of(context).username,
                      autofocus: true,
                      enabled: !state.status.isLoading,
                      onChanged: (value) {
                        context.read<LoginBloc>().update(
                              username: value,
                            );
                      },
                      validator: AppValidators.nullCheckValidator,
                    ),
                    SizedBox(height: 16.h),
                    AppTextField(
                      controller: _passwordController,
                      labelText: L10n.of(context).password,
                      enabled: !state.status.isLoading,
                      isObscured: state.isPasswordObscured,
                      suffixIcon: GestureDetector(
                        onTap: () => context.read<LoginBloc>().update(
                              isObscured: !state.isPasswordObscured,
                            ),
                        child: AnimatedSwitcher(
                          duration: Utils.animationDuration,
                          child: state.isPasswordObscured
                              ? Assets.icons.eyeSlash.svg(
                                  width: 20.w,
                                  height: 20.w,
                                )
                              : SizedBox(
                                  child: Assets.icons.eye.svg(
                                    width: 20.w,
                                    height: 20.w,
                                  ),
                                ),
                        ),
                      ),
                      onChanged: (value) {
                        context.read<LoginBloc>().update(
                              password: value,
                            );
                      },
                      onEditingComplete: state.isCredentialsValid ? _auth : null,
                    ),
                    SizedBox(height: kBottomNavigationBarHeight.h * 2),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            L10n.of(context).doesNotHaveAccountYet,
                            style: context.theme.textTheme.bodySmall?.apply(
                              color: context.theme.hintColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Flexible(
                          child: AppTextButton(
                            text: L10n.of(context).toRegister,
                            textStyle: context.theme.textTheme.bodySmall?.apply(
                              color: context.theme.primaryColor,
                            ),
                            onPressed: state.status.isLoading
                                ? null
                                : () {
                                    context.router.replace(
                                      const RegistrationRoute(),
                                    );
                                  },
                          ),
                        ),
                      ],
                    ),
                    AppButton(
                      title: L10n.of(context).toLogin,
                      isLoading: state.status.isLoading,
                      onPressed: state.isCredentialsValid ? _auth : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _auth() {
    if (context.focus.hasFocus) {
      context.focus.unfocus();
    }
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginBloc>().auth();
    }
  }
}
