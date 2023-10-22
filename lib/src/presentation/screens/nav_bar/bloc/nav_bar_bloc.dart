import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  void changeIndex(int value) => add(NavBarUpdateEvent(value));

  NavBarBloc() : super(const NavBarState()) {
    on<NavBarUpdateEvent>(_update);
  }

  void _update(
    NavBarUpdateEvent event,
    Emitter<NavBarState> emit,
  ) async {
    emit(state.copyWith(currentIndex: event.index));
  }
}
