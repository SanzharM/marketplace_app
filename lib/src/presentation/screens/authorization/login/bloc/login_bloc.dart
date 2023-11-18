import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:marketplace_app/src/common/state_status.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/core/utils/utils.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/login_usecase.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/save_token_usecase.dart';
import 'package:marketplace_app/src/service_locator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  void update({String? username, String? password, bool? isObscured}) =>
      add(LoginUpdateEvent(username, password, isObscured));
  void auth() => add(LoginAuthEvent());

  LoginBloc() : super(const LoginState()) {
    on<LoginUpdateEvent>(_onUpdate);
    on<LoginAuthEvent>(_auth);
  }

  void _onUpdate(
    LoginUpdateEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      status: StateStatus.initial,
      username: event.username,
      password: event.password,
      isPasswordObscured: event.isObscured,
    ));
  }

  void _auth(LoginAuthEvent event, Emitter<LoginState> emit) async {
    if (state.username.isEmpty) {
      return emit(state.copyWith(
        status: StateStatus.error,
        message: L10n.current.incorrectUsername,
      ));
    }
    if (state.password.length < 6) {
      return emit(state.copyWith(
        status: StateStatus.error,
        message: L10n.current.incorrectPassword,
      ));
    }
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    try {
      final params = LoginParams(
        password: state.password,
        username: state.username,
      );
      final token = await sl<LoginUseCase>().call(
        params: params,
      );
      await token.fold(
        (failure) async => emit(state.copyWith(
          status: StateStatus.error,
          message: failure.message,
        )),
        (token) async {
          final tokenParams = SaveTokenParams(token);
          final result = await sl<SaveTokenUseCase>().call(
            params: tokenParams,
          );
          result.fold(
            (failure) => emit(state.copyWith(
              status: StateStatus.error,
              message: failure.message,
            )),
            (success) => emit(state.copyWith(
              status: StateStatus.success,
            )),
          );
        },
      );
    } catch (e) {
      debugPrint('LoginAuthEvent error: $e');
      emit(state.copyWith(
        status: StateStatus.error,
        message: L10n.current.somethingWentWrong,
      ));
    }
  }
}
