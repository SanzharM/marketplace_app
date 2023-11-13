import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketplace_app/src/common/state_status.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEvent>((event, emit) {});
  }
}
