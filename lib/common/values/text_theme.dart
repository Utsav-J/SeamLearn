import 'package:bloc_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText {
  static Widget largeHomeText(String mainText,
      {Color? colorName = AppColors.primaryText}) {
    return Text(
      mainText,
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: colorName,
      ),
    );
  }
}
