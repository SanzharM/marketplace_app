part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.username = '',
    this.password = '',
    this.isPasswordObscured = true,
    this.status = StateStatus.initial,
    this.message = '',
  });

  final String username;
  final String password;
  final bool isPasswordObscured;
  final StateStatus status;
  final String message;

  @override
  List<Object> get props => [username, password, isPasswordObscured, status, message];

  bool get isCredentialsValid {
    if (username.isEmpty) {
      return false;
    }
    if (AppValidators.passwordValidator(password) != null) {
      return false;
    }
    return true;
  }

  LoginState copyWith({
    String? username,
    String? password,
    bool? isPasswordObscured,
    StateStatus? status,
    String? message,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      status: status ?? this.status,
      message: message ?? '',
    );
  }
}
