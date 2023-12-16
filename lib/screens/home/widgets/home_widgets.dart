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
          // left: 20.w,
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
      Text(
        userName,
        style: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          color: usernameColor,
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
        margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
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
            SizedBox(
              width: 200.w,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5.h),
                  hintStyle: TextStyle(
                    color: AppColors.primaryText.withOpacity(0.5),
                  ),
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  // fillColor: Colors.red,
                  hintText: "Search among courses",
                ),
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          print("Blue button tapped");
        },
        child: Container(
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
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget buildCatalogView() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Choose your course",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            GestureDetector(
              child: const Text(
                "See All",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryThirdElement),
              ),
            )
          ],
        ),
      ),
      Container(
        child: Row(
          children: [
            _reusableCatalogContainer(
              "All",
              AppColors.primaryElement,
            ),
            _reusableCatalogContainer(
              "Popular",
              AppColors.primaryBackground,
              textColor: AppColors.primaryThirdElement,
            ),
            _reusableCatalogContainer(
              "Newest",
              AppColors.primaryBackground,
              textColor: AppColors.primaryThirdElement,
            )
          ],
        ),
      )
    ],
  );
}

Widget _reusableCatalogContainer(String mainText, Color boxColor,
    {Color textColor = AppColors.primaryElementText}) {
  return Container(
    margin: EdgeInsets.only(right: 5.w),
    height: 28.h,
    // width: 40.w,
    // constraints: BoxConstraints(
    //   maxWidth: 80.w,
    // ),
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.w),
      // color: AppColors.primaryThirdElement.withOpacity(0.4),
      color: boxColor,
    ),
    child: Center(
      child: Text(
        mainText,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget buildCourseGrid() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/icons/Image.png"),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(8.w),
      ),
      constraints: BoxConstraints(maxHeight: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              "Flutter Course",
              // "This is a sample long text that you can try",
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white.withOpacity(0.85),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 1.w,
          ),
          Container(
            margin: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 5.w),
            child: Text(
              "Go to",
              // "This is a sample long text that you can try",
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 10.sp,
                overflow: TextOverflow.ellipsis,
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}



// class ParallaxRecipe extends StatelessWidget {
//   const ParallaxRecipe({super.key});
//   @override
//   Widget build(context) {
//     return SizedBox(
//       height: 100.h,
//       width: 275.w,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: SizedBox(
//           height: 100.h,
//           width: 275.w,
//           child: const Row(
//             children: [
//               ListItemWidget(
//                   title: "First", itemImageName: "Image", stateText: "Ongoing"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ListItemWidget extends StatelessWidget {
//   final String title;
//   final String itemImageName;
//   final String stateText;
//   const ListItemWidget({
//     super.key,
//     required this.title,
//     required this.itemImageName,
//     required this.stateText,
//   });
//   @override
//   Widget build(context) {
//     return Stack(
//       children: [_buildBackgroundParallax(itemImageName)],
//     );
//   }
// }

// Widget _buildBackgroundParallax(String itemImageName) {
//   return Positioned.fill(
//     child: Image.asset(
//       "assets/images/$itemImageName.png",
//       fit: BoxFit.cover,
//     ),
//   );
// }
