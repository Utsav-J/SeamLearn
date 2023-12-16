import 'package:bloc_app/screens/profile_page/settings/bloc/settings_events.dart';
import 'package:bloc_app/screens/profile_page/settings/bloc/settings_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<SettingsEvents, SettingsStates> {
  SettingsBloc() : super(const SettingsStates()) {
    on<SettingsTrigger>(settingsTriggerHandler);
  }

  settingsTriggerHandler(SettingsTrigger event, Emitter emit) {
    emit(const SettingsStates());
  }
}
