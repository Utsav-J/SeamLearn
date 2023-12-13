abstract class HomePageEvents {
  const HomePageEvents();
}

class ParallaxScrollEvent extends HomePageEvents {
  final int index;
  // const ParallaxScrollEvent({this.index = 0}) : super();
  ParallaxScrollEvent(this.index);
}
