//will unify the bloc provider, routes, pages
import 'package:bloc_app/common/routes/names.dart';
import 'package:bloc_app/screens/app_page/application_page.dart';
import 'package:bloc_app/screens/app_page/bloc/app_bloc.dart';
import 'package:bloc_app/screens/global.dart';
import 'package:bloc_app/screens/home/bloc/homepage_bloc.dart';
import 'package:bloc_app/screens/home/homepage.dart';
import 'package:bloc_app/screens/profile_page/settings/bloc/settings_bloc.dart';
import 'package:bloc_app/screens/profile_page/settings/settings.dart';
import 'package:bloc_app/screens/register/bloc/register_bloc.dart';
import 'package:bloc_app/screens/register/register.dart';
import 'package:bloc_app/screens/signin/bloc/sign_in_bloc.dart';
import 'package:bloc_app/screens/signin/sign_in.dart';
import 'package:bloc_app/screens/welcome/bloc/welcome_bloc.dart';
import 'package:bloc_app/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> Routes() {
    return [
      PageEntity(
        route: AppRoutes.INTIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => HomePageBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        page: const SettingsPage(),
        bloc: BlocProvider(
          create: (_) => SettingsBloc(),
        ),
      ),
    ];
  }

  static List<dynamic> allProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var r in Routes()) {
      blocProviders.add(r.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = Routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        // print("Valid route name: ${settings.name}");
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        bool isLoggedIn = Global.storageService.getIsLoggedIn();
        if ((result.first.route == AppRoutes.INTIAL) && deviceFirstOpen) {
          //user is logged in
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          // app has already been opened once
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    // print("Invalid route name: ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
    // we get the list from the Routes function
    // as the navigator objects's function gets triggered,
    // the name that we pass for the route, will be passed here as settings
    // if the name exists and matches the routes that we have on the app, the function will be executed successfully
    // thats how the routing will be done
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
