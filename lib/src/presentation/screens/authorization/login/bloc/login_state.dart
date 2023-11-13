part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.login = '',
    this.password = '',
    this.status = StateStatus.initial,
    this.message = '',
  });

  final String login;
  final String password;
  final StateStatus status;
  final String message;

  @override
  List<Object> get props => [login, password, status, message];

  LoginState copyWith({
    String? login,
    String? password,
    StateStatus? status,
    String? message,
  }) {
    return LoginState(
      login: login ?? this.login,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? '',
    );
  }
}
