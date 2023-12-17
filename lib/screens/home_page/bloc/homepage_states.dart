class HomePageStates {
  const HomePageStates({this.index = 0});
  final int index;

  HomePageStates copyWith({int? newIndex}) {
    return HomePageStates(index: newIndex ?? index);
  }
}
