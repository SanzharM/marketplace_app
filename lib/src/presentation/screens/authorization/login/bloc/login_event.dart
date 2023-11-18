part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginUpdateEvent extends LoginEvent {
  final String? username;
  final String? password;
  final bool? isObscured;

  const LoginUpdateEvent(
    this.username,
    this.password,
    this.isObscured,
  );

  @override
  List<Object?> get props => [username, password, isObscured];
}

class LoginAuthEvent extends LoginEvent {}
