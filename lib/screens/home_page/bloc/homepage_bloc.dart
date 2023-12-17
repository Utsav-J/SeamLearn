import 'package:bloc_app/screens/home_page/bloc/homepage_events.dart';
import 'package:bloc_app/screens/home_page/bloc/homepage_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBloc() : super(const HomePageStates()) {
    on<ParallaxScrollEvent>(_parallaxHandler);
  }

  void _parallaxHandler(
      ParallaxScrollEvent event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(newIndex: event.index));
  }
}
