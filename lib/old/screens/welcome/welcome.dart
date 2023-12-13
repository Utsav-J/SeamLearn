import 'package:bloc_app/common/values/colors.dart';
import 'package:bloc_app/common/values/constants.dart';
import 'package:bloc_app/screens/global.dart';
import 'package:bloc_app/screens/welcome/bloc/welcome_bloc.dart';
import 'package:bloc_app/screens/welcome/bloc/welcome_events.dart';
import 'package:bloc_app/screens/welcome/bloc/welcome_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          body: BlocBuilder<WelcomeBloc, WelcomeStates>(
        builder: ((context, state) => Container(
              margin: EdgeInsets.only(top: 35.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context)
                          .add(WelcomeEvents());
                    },
                    children: [
                      _pageColumn(
                          0,
                          context,
                          "Next",
                          "First See Learning",
                          "Revolutionalize the way of learning in classrooms",
                          "assets/images/reading.png"),
                      _pageColumn(
                          1,
                          context,
                          "Next",
                          "Connect with everyone",
                          "Always keep in touch with your tutors",
                          "assets/images/boy.png"),
                      _pageColumn(
                        2,
                        context,
                        "Get Started",
                        "Always Fascinated Learning",
                        "Anywhere and Anytime. Study whenever you want",
                        "assets/images/man.png",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 80.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          activeColor: AppColors.primaryElement,
                          color: AppColors.primaryThirdElement,
                          size: const Size.square(8),
                          activeSize: const Size(18, 8),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              ),
            )),
      )),
    );
  }

  Widget _pageColumn(int index, BuildContext context, String buttonTitle,
      String title, String subtitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryThirdElement),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 2) {
              //goto next page
              pageController.animateToPage(
                index + 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            } else {
              //jump to the new screen
              // we need to make changes so that we dont have a go back button to the previous page anymore
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyHomePage()));
              Global.storageService!
                  .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              // print(
              //     "The value is: ${Global.storageService.getDeviceFirstOpen()}");
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/sign_in", (route) => false);
              // once we hit the myhomepage route, every other route will be removed, til now we have only explored the welcome page
            }
          },
          child: Container(
            height: 50.h,
            width: 250.w,
            margin: EdgeInsets.only(top: 100.h, left: 25.h, right: 25.h),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(0, 15)),
                ]),
            child: Center(
              child: Text(buttonTitle,
                  style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBackground)),
            ),
          ),
        ),
      ],
    );
  }
}
