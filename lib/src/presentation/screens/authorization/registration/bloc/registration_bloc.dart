import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketplace_app/src/common/state_status.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(const RegistrationState()) {
    on<RegistrationEvent>((event, emit) {});
  }
}
