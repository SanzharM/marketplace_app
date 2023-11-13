part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  const RegistrationState({
    this.login = '',
    this.password = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.status = StateStatus.initial,
    this.message = '',
  });

  final String login;
  final String password;
  final String firstName;
  final String lastName;
  final String email;
  final StateStatus status;
  final String message;

  @override
  List<Object> get props {
    return [
      login,
      password,
      firstName,
      lastName,
      email,
      status,
      message,
    ];
  }

  RegistrationState copyWith({
    String? login,
    String? password,
    String? firstName,
    String? lastName,
    String? email,
    StateStatus? status,
    String? message,
  }) {
    return RegistrationState(
      login: login ?? this.login,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      status: status ?? this.status,
      message: message ?? '',
    );
  }
}
