part of 'nav_bar_bloc.dart';

abstract class NavBarEvent extends Equatable {
  const NavBarEvent();

  @override
  List<Object> get props => [];
}

class NavBarUpdateEvent extends NavBarEvent {
  final int index;

  const NavBarUpdateEvent(this.index);

  @override
  List<Object> get props => [index];
}
