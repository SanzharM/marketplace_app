import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:marketplace_app/src/common/state_status.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/core/utils/utils.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/register_usecase.dart';
import 'package:marketplace_app/src/domain/usecases/authorization/save_token_usecase.dart';
import 'package:marketplace_app/src/service_locator.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  void update({
    String? username,
    String? password,
    bool? isPasswordObscured,
    String? firstName,
    String? lastName,
    String? email,
  }) =>
      add(RegistrationUpdateEvent(
        username,
        password,
        isPasswordObscured,
        firstName,
        lastName,
        email,
      ));

  void submit() => add(RegistrationSubmitEvent());

  RegistrationBloc() : super(const RegistrationState()) {
    on<RegistrationUpdateEvent>(_onUpdate);
    on<RegistrationSubmitEvent>(_submit);
  }

  void _onUpdate(
    RegistrationUpdateEvent event,
    Emitter<RegistrationState> emit,
  ) {
    emit(state.copyWith(
      status: StateStatus.initial,
      username: event.username,
      password: event.password,
      isPasswordObscured: event.isObscured,
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.email,
    ));
  }

  void _submit(
    RegistrationSubmitEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    if (state.isCredentialsValid) {
      return;
    }
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    try {
      final params = RegisterParams(
        password: state.password,
        username: state.username,
        firstName: state.firstName,
        lastName: state.lastName,
        email: state.email,
      );
      final token = await sl<RegisterUseCase>().call(
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
      debugPrint('RegistrationSubmitEvent error: $e');
      emit(state.copyWith(
        status: StateStatus.error,
        message: L10n.current.somethingWentWrong,
      ));
    }
  }
}
