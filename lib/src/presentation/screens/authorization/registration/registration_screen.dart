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
import 'package:marketplace_app/src/presentation/screens/authorization/registration/bloc/registration_bloc.dart';
import 'package:marketplace_app/src/presentation/widgets/buttons/app_button.dart';
import 'package:marketplace_app/src/presentation/widgets/buttons/app_text_button.dart';
import 'package:marketplace_app/src/presentation/widgets/common/custom_app_bar.dart';
import 'package:marketplace_app/src/presentation/widgets/text_fields/app_text_field.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _loginController;
  late TextEditingController _passwordController;
  late TextEditingController _emailController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;

  @override
  void initState() {
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
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
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
              title: L10n.of(context).registration,
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
                      L10n.of(context).whatIsYourName,
                      textAlign: TextAlign.left,
                      style: context.theme.textTheme.bodySmall,
                    ),
                    SizedBox(height: 16.h),
                    // FIRST NAME
                    AppTextField(
                      controller: _firstNameController,
                      labelText: L10n.of(context).firstName,
                      autofocus: true,
                      enabled: !state.status.isLoading,
                      onChanged: (value) {
                        context.read<RegistrationBloc>().update(
                              firstName: value,
                            );
                      },
                      validator: AppValidators.nullCheckValidator,
                    ),
                    SizedBox(height: 16.h),

                    // LAST NAME
                    AppTextField(
                      controller: _lastNameController,
                      labelText: L10n.of(context).lastName,
                      enabled: !state.status.isLoading,
                      onChanged: (value) {
                        context.read<RegistrationBloc>().update(
                              lastName: value,
                            );
                      },
                      validator: AppValidators.nullCheckValidator,
                    ),
                    Divider(height: 32.h),
                    Text(
                      L10n.of(context).yourEmailToSendReceipts.split(',').first,
                      textAlign: TextAlign.left,
                      style: context.theme.textTheme.bodySmall,
                    ),
                    SizedBox(height: 16.h),

                    // EMAIL
                    AppTextField(
                      controller: _emailController,
                      labelText: L10n.of(context).email,
                      enabled: !state.status.isLoading,
                      onChanged: (value) {
                        context.read<RegistrationBloc>().update(
                              email: value,
                            );
                      },
                      validator: AppValidators.emailValidator,
                    ),
                    Divider(height: 32.h),
                    Text(
                      L10n.of(context).credentialsToFurtherAuthorization,
                      textAlign: TextAlign.left,
                      style: context.theme.textTheme.bodySmall,
                    ),
                    SizedBox(height: 16.h),

                    // USERNAME
                    AppTextField(
                      controller: _loginController,
                      labelText: L10n.of(context).username,
                      enabled: !state.status.isLoading,
                      onChanged: (value) {
                        context.read<RegistrationBloc>().update(
                              username: value,
                            );
                      },
                      validator: AppValidators.nullCheckValidator,
                    ),
                    SizedBox(height: 16.h),

                    // PASSWORD
                    AppTextField(
                      controller: _passwordController,
                      labelText: L10n.of(context).password,
                      enabled: !state.status.isLoading,
                      isObscured: state.isPasswordObscured,
                      suffixIcon: GestureDetector(
                        onTap: () => context.read<RegistrationBloc>().update(
                              isPasswordObscured: !state.isPasswordObscured,
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
                        context.read<RegistrationBloc>().update(
                              password: value,
                            );
                      },
                      onEditingComplete: state.isCredentialsValid ? _submit : null,
                    ),
                    SizedBox(height: kBottomNavigationBarHeight.h * 6),
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
                            L10n.of(context).haveAlreadyAccount,
                            style: context.theme.textTheme.bodySmall?.apply(
                              color: context.theme.hintColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Flexible(
                          child: AppTextButton(
                            text: L10n.of(context).toLogin,
                            textStyle: context.theme.textTheme.bodySmall?.apply(
                              color: context.theme.primaryColor,
                            ),
                            onPressed: state.status.isLoading
                                ? null
                                : () {
                                    context.router.replace<void>(
                                      const LoginRoute(),
                                    );
                                  },
                          ),
                        ),
                      ],
                    ),
                    AppButton(
                      title: L10n.of(context).toRegister,
                      isLoading: state.status.isLoading,
                      onPressed: state.isCredentialsValid ? _submit : null,
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

  void _submit() {
    if (context.focus.hasFocus) {
      context.focus.unfocus();
    }
    if (_formKey.currentState?.validate() ?? false) {
      context.read<RegistrationBloc>().submit();
    }
  }
}
