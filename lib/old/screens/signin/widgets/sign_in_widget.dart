// import 'package:flutter/cupertino.dart';
import 'package:bloc_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//context for accesing the bloc
Widget buildTPLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _reusableIcons('google'),
      _reusableIcons('apple'),
      _reusableIcons('facebook')
    ]),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 40.w,
      width: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.h),
    child: Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.w400, color: AppColors.primaryThirdElement),
    ),
  );
}

Widget buildTextField(String text, String hintText, String textType,
    void Function(String value)? eventHandler) {
  return Container(
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: AppColors.primaryThirdElement),
      ),
      child: Row(
        children: [
          Container(
            width: 16.w,
            height: 16.w,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Image.asset('assets/icons/user.png'),
          ),
          SizedBox(
            width: 260.w,
            height: 50.h,
            child: TextField(
              onChanged: (value) => eventHandler!(value),
              style: TextStyle(
                fontFamily: "Avenir",
                color: AppColors.primaryText,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    const TextStyle(color: AppColors.primaryThirdElement),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
              autocorrect: false,
              obscureText: textType == "password" ? true : false,
            ),
          )
        ],
      ));
}

Widget forgotPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    margin: EdgeInsets.only(top: 25.w),
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot password",
        style: TextStyle(
          color: AppColors.primaryElement,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryElement,
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(
    String buttonName, String buttonType, void Function()? loginHandler) {
  return GestureDetector(
    onTap: loginHandler,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h),
      decoration: BoxDecoration(
        color: buttonType == 'login'
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        border: buttonType == "register"
            ? Border.all(
                width: 1, color: const Color.fromARGB(255, 212, 212, 212))
            : Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(15.w),
        boxShadow: [
          BoxShadow(
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 10),
              color: Colors.grey.withOpacity(0.2))
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: buttonType == 'login'
                  ? AppColors.primaryBackground
                  : AppColors.primaryThirdElement),
        ),
      ),
    ),
  );
}
