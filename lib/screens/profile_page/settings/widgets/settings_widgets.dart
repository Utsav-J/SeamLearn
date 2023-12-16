import 'package:bloc_app/common/values/colors.dart';
import 'package:bloc_app/common/values/constants.dart';
import 'package:bloc_app/old/screens/global.dart';
import 'package:flutter/material.dart';
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

Widget buildLogOutButton(BuildContext context) {
  return TextButton.icon(
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Confirm Log Out?"),
            actions: [
              TextButton(
                child: const Text(
                  "Ok",
                  style: TextStyle(
                    color: AppColors.primaryElement,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Global.storageService!
                      .removeValue(AppConstants.STORAGE_USER_TOKEN_KEY);
                },
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
