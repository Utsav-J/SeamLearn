import 'package:bloc_app/common/routes/names.dart';
import 'package:bloc_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 20.h,
          width: 20.w,
          child: GestureDetector(
            child: Image.asset("assets/icons/menu.png"),
          ),
        ),
        Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText.withOpacity(0.8),
              fontSize: 16.sp),
        ),
        SizedBox(
          height: 20.h,
          width: 20.w,
          child: GestureDetector(
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ),
      ],
    ),
    // centerTitle: true,
  );
}

var imageInfo = <String, String>{
  "settings.png": "Settings",
  "credit-card.png": "Payment Details",
  "award.png": "Achievements",
  "heart(1).png": "Love",
  "cube.png": "Learning Reminders"
};

Widget buildProfileImageHeader() {
  return Container(
    alignment: Alignment.bottomRight,
    height: 80.h,
    width: 80.w,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/icons/img.png"),
      ),
      // color: Colors.red,
      shape: BoxShape.circle,
    ),
    child: Image(
      height: 28.h,
      width: 28.w,
      image: const AssetImage(
        "assets/icons/edit_3.png",
      ),
    ),
  );
}

Widget buildActionsListView(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...List.generate(
          imageInfo.length,
          (index) => _singleActionForListView(imageInfo.keys.elementAt(index),
              imageInfo.values.elementAt(index), context),
        )
        // _singleActionForListView("settings", "Settings"),
        // _singleActionForListView("credit-card", "Payment Details"),
        // _singleActionForListView("award", "Achievements"),
        // _singleActionForListView("heart(1)", "Love"),
        // _singleActionForListView("cube", "Learning Reminders"),
      ],
    ),
  );
}

var onTapActionForSingles = <String, Function>{
  "Settings": (BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
  },
  "Payment Details": () {},
  "Achievements": () {},
  "Love": () {},
  "Learning Reminders": () {},
};

Widget _singleActionForListView(
    String iconName, String actionName, BuildContext context) {
  return GestureDetector(
    onTap: () {
      onTapActionForSingles[actionName]!(context);
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Container(
            height: 45.h,
            width: 40.w,
            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 5.w),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Image(
              height: 32.h,
              width: 32.w,
              image: AssetImage("assets/icons/$iconName"),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Text(
            actionName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
        ],
      ),
    ),
  );
}
