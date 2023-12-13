import 'package:bloc_app/screens/app_page/bloc/app_event.dart';
import 'package:bloc_app/screens/app_page/bloc/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<NavBarTriggerEvent>(_navBarTriggerEventHandler);
  }

  void _navBarTriggerEventHandler(
      NavBarTriggerEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(event.index));
  }
}
