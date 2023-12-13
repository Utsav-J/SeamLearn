import 'package:bloc_app/common/values/colors.dart';
import 'package:bloc_app/screens/home/bloc/homepage_bloc.dart';
import 'package:bloc_app/screens/home/bloc/homepage_events.dart';
import 'package:bloc_app/screens/home/bloc/homepage_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildHomeAppBar() {
  return AppBar(
    title: Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20.w),
          height: 20.h,
          width: 20.w,
          child: Image.asset("assets/icons/menu.png"),
        ),
        const Spacer(),
        RawGestureDetector(
          child: Container(
            // margin: EdgeInsets.only(right: 10.w),
            height: 36.h,
            width: 36.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/person.png"),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget generateHomeText(
  String userName, {
  Color? usernameColor = AppColors.primaryText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(
          left: 20.w,
          top: 25.h,
        ),
        child: Text(
          "Hello,",
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryThirdElement,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          left: 20.w,
          top: 0,
        ),
        child: Text(
          userName,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: usernameColor,
          ),
        ),
      ),
    ],
  );
}

Widget buildSearchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        margin: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
        width: 240.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(
            color: AppColors.primaryThirdElement,
            width: 2.w,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 5.w,
            ),
            SizedBox(
              height: 24.h,
              width: 24.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5.h),
                  hintStyle: TextStyle(
                    color: AppColors.primaryText.withOpacity(0.5),
                  ),
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  fillColor: Colors.red,
                  hintText: "Search among courses",
                ),
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 15.w),
            width: 33.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Image.asset(
              "assets/icons/options.png",
            ),
          ),
        ),
      )
    ],
  );
}

Widget buildParallaxView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      SizedBox(
        height: 170.h,
        width: 300.w,
        child: PageView(
          onPageChanged: (value) =>
              context.read<HomePageBloc>().add(ParallaxScrollEvent(value)),
          children: [
            _sliderContainer(imagePath: "assets/icons/Image.png"),
            _sliderContainer(imagePath: "assets/icons/Image(1).png"),
            _sliderContainer(imagePath: "assets/icons/Image(2).png"),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: const DotsDecorator(
          activeColor: AppColors.primaryElement,
        ),
      )
    ],
  );
}

Widget _sliderContainer({String imagePath = "assets/icons/Image.png"}) {
  return Container(
    // same dimesions as the parent, so that it covers
    height: 170.h,
    width: 300.w,
    margin: EdgeInsets.only(left: 20.w),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.fill,
      ),
    ),
  );
}

class ParallaxRecipe extends StatelessWidget {
  const ParallaxRecipe({super.key});
  @override
  Widget build(context) {
    return SizedBox(
      height: 100.h,
      width: 275.w,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: 100.h,
          width: 275.w,
          child: const Row(
            children: [
              ListItemWidget(
                  title: "First", itemImageName: "Image", stateText: "Ongoing"),
            ],
          ),
        ),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final String title;
  final String itemImageName;
  final String stateText;
  const ListItemWidget({
    super.key,
    required this.title,
    required this.itemImageName,
    required this.stateText,
  });
  @override
  Widget build(context) {
    return Stack(
      children: [_buildBackgroundParallax(itemImageName)],
    );
  }
}

Widget _buildBackgroundParallax(String itemImageName) {
  return Positioned.fill(
    child: Image.asset(
      "assets/images/$itemImageName.png",
      fit: BoxFit.cover,
    ),
  );
}
