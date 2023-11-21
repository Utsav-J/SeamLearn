class AppState {
  final int index;
  const AppState({this.index = 0});

  AppState copyWith(int? index) {
    return AppState(index: index ?? this.index);
  }
}
