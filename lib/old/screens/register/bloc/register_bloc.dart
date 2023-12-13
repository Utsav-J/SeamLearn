import 'package:bloc_app/screens/register/bloc/register_events.dart';
import 'package:bloc_app/screens/register/bloc/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc() : super(const RegisterStates()) {
    on<UsernameEvent>(_usernameEventHandler);
    on<EmailEvent>(_emailEventHandler);
    on<PasswordEvent>(_passwordEventHandler);
    on<RePasswordEvent>(_rePasswordEventHandler);
  }

  void _usernameEventHandler(
      UsernameEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _emailEventHandler(EmailEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEventHandler(
      PasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEventHandler(
      RePasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
