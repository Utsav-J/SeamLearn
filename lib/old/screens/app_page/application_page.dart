import 'package:bloc_app/common/values/colors.dart';
import 'package:bloc_app/screens/app_page/application_widgets.dart';
import 'package:bloc_app/screens/app_page/bloc/app_bloc.dart';
import 'package:bloc_app/screens/app_page/bloc/app_event.dart';
import 'package:bloc_app/screens/app_page/bloc/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) => Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: buildPage(state.index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.h),
                  topRight: Radius.circular(10.h),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10),
                ],
              ),
              child: BottomNavigationBar(
                  currentIndex: state.index,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  enableFeedback: true,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourthElement,
                  onTap: (value) {
                    context.read<AppBloc>().add(
                          NavBarTriggerEvent(index: value),
                        );
                  },
                  items: bottomTabs,
                  elevation: 0),
            ),
          ),
        ),
      ),
    );
  }
}
