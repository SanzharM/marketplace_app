part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];
}

class RegistrationUpdateEvent extends RegistrationEvent {
  final String? username;
  final String? password;
  final bool? isObscured;
  final String? firstName;
  final String? lastName;
  final String? email;

  const RegistrationUpdateEvent(
    this.username,
    this.password,
    this.isObscured,
    this.firstName,
    this.lastName,
    this.email,
  );

  @override
  List<Object?> get props => [
        username,
        password,
        isObscured,
        firstName,
        lastName,
        email,
      ];
}

class RegistrationSubmitEvent extends RegistrationEvent {}
