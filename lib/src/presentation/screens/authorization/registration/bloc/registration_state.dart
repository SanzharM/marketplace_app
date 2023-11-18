part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  const RegistrationState({
    this.username = '',
    this.password = '',
    this.isPasswordObscured = true,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.status = StateStatus.initial,
    this.message = '',
  });

  final String username;
  final String password;
  final bool isPasswordObscured;
  final String firstName;
  final String lastName;
  final String email;
  final StateStatus status;
  final String message;

  @override
  List<Object> get props {
    return [
      username,
      password,
      isPasswordObscured,
      firstName,
      lastName,
      email,
      status,
      message,
    ];
  }

  bool get isCredentialsValid {
    if (username.isEmpty) {
      return false;
    }
    if (AppValidators.passwordValidator(password) != null) {
      return false;
    }
    if (firstName.isEmpty || lastName.isEmpty) {
      return false;
    }
    if (email.isEmpty || !(email.contains('@'))) {
      return false;
    }

    return true;
  }

  RegistrationState copyWith({
    String? username,
    String? password,
    bool? isPasswordObscured,
    String? firstName,
    String? lastName,
    String? email,
    StateStatus? status,
    String? message,
  }) {
    return RegistrationState(
      username: username ?? this.username,
      password: password ?? this.password,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      status: status ?? this.status,
      message: message ?? '',
    );
  }
}
