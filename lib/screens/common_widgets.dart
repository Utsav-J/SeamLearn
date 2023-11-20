// import 'package:flutter/cupertino.dart';
import 'package:bloc_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0, // refers to the thickness of the line
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 18.sp,
        fontWeight: FontWeight.w300,
      ),
    ),
    centerTitle: true,
  );
}
