abstract class AppEvent {
  const AppEvent();
}

class NavBarTriggerEvent extends AppEvent {
  final int index;
  const NavBarTriggerEvent({this.index = 0}) : super();
}
