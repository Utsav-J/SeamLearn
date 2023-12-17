import 'package:bloc_app/common/routes/names.dart';
import 'package:bloc_app/common/values/colors.dart';
import 'package:bloc_app/common/values/constants.dart';
import 'package:bloc_app/screens/app_page/bloc/app_bloc.dart';
import 'package:bloc_app/screens/app_page/bloc/app_event.dart';
import 'package:bloc_app/screens/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildSettingsAppBar() {
  return AppBar(
    title: Text(
      "Settings",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryText.withOpacity(0.8),
          fontSize: 16.sp),
    ),
    centerTitle: true,
  );
}

void handleUserLogOut(BuildContext context) {
  context.read<AppBloc>().add(const NavBarTriggerEvent(index: 0));
  // resets the nav bar counter before logging out
  Global.storageService.removeValue(AppConstants.STORAGE_USER_TOKEN_KEY);
  Navigator.of(context)
      .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
}

Widget buildLogOutButton(BuildContext context) {
  return TextButton.icon(
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Confirm Log Out?"),
            actions: [
              TextButton(
                child: const Text(
                  "Ok",
                  style: TextStyle(
                    color: AppColors.primaryElement,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => handleUserLogOut(context),
              ),
              TextButton(
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: AppColors.primaryElementBg,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
    style: const ButtonStyle(
      elevation: MaterialStatePropertyAll(2),
    ),
    icon: const Icon(Icons.logout),
    label: const Text("Log Out"),
  );
}
