part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserGetEvent extends UserEvent {}

class UserChangeEvent extends UserEvent {
  final dynamic user;

  const UserChangeEvent(this.user);

  @override
  List<Object> get props => [user];
}

class UserLogoutEvent extends UserEvent {}
