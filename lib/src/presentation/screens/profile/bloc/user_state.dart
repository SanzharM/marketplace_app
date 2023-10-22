part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState({
    required this.user,
    this.status = StateStatus.initial,
    this.message = '',
  });

  final dynamic user;
  final StateStatus status;
  final String message;

  bool get isAuthorized => user.isAuthorized;
  bool get isNotAuthorized => user.isNotAuthorized;

  @override
  List<Object> get props => [user, status, message];

  UserState copyWith({
    dynamic user,
    StateStatus? status,
    String? message,
  }) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
      message: message ?? '',
    );
  }
}

class UserLogoutSuccessState extends UserState {
  final dynamic loggedOutUser;

  const UserLogoutSuccessState({
    required this.loggedOutUser,
    super.user = const Object(),
    super.status = StateStatus.initial,
  });

  factory UserLogoutSuccessState.fromState(UserState state) {
    return UserLogoutSuccessState(
      loggedOutUser: state.user,
      user: const Object(),
    );
  }
}
