import 'package:bloc_app/screens/register/bloc/register_bloc.dart';
import 'package:bloc_app/screens/signin/bloc/sign_in_bloc.dart';
import 'package:bloc_app/screens/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        )
      ];
}
