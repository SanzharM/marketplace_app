import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:marketplace_app/src/common/state_status.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/domain/entities/user/user_entity.dart';
import 'package:marketplace_app/src/domain/usecases/user/get_user_usecase.dart';
import 'package:marketplace_app/src/domain/usecases/user/logout_usecase.dart';
import 'package:marketplace_app/src/service_locator.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  void get() => add(UserGetEvent());
  void changeUser(dynamic user) => add(UserChangeEvent(user));
  void logout() => add(UserLogoutEvent());

  UserBloc() : super(const UserState(user: UserEntity())) {
    on<UserGetEvent>(_get);
    on<UserChangeEvent>(_change);
    on<UserLogoutEvent>(_logout);
  }

  final _getUserUseCase = sl<GetUserUseCase>();
  final _logoutUseCase = sl<LogoutUseCase>();

  void _get(
    UserGetEvent event,
    Emitter<UserState> emit,
  ) async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    final result = await _getUserUseCase.call();
    result.fold(
      (failure) => emit(state.copyWith(
        status: StateStatus.error,
        message: failure.message,
      )),
      (user) => emit(state.copyWith(
        status: StateStatus.success,
        user: user,
      )),
    );
  }

  void _change(
    UserChangeEvent event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(user: event.user));
  }

  void _logout(
    UserLogoutEvent event,
    Emitter<UserState> emit,
  ) async {
    if (!state.status.isSuccess) return;

    emit(state.copyWith(status: StateStatus.loading));
    try {
      final result = await _logoutUseCase.call();
      result.fold(
        (failure) => emit(state.copyWith(
          status: StateStatus.error,
          message: failure.message,
        )),
        (_) => emit(UserLogoutSuccessState.fromState(
          state,
        )),
      );
    } catch (e) {
      debugPrint('UserLogoutEvent error: $e');
      emit(state.copyWith(
        status: StateStatus.error,
        message: L10n.current.somethingWentWrong,
      ));
    }
  }
}
