import 'package:bloc_app/common/values/colors.dart';
import 'package:bloc_app/common/routes/routes.dart';
import 'package:bloc_app/screens/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(315, 812),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppPages.generateRouteSettings,
          initialRoute: "/",
          theme: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: AppColors.primaryText),
                elevation: 0,
                backgroundColor: Colors.white,
              )),
        ),
      ),
    );
  }
}
