import 'package:bloc_app/screens/home_page/bloc/homepage_bloc.dart';
import 'package:bloc_app/screens/home_page/bloc/homepage_states.dart';
import 'package:bloc_app/screens/home_page/widgets/home_controller.dart';
import 'package:bloc_app/screens/home_page/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _homeController;
  @override
  void initState() {
    super.initState();
    _homeController = HomeController(context: context);
    _homeController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeAppBar(),
      body: BlocBuilder<HomePageBloc, HomePageStates>(
        builder: (context, state) => Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                // child: generateHomeText("user"),
                child: generateHomeText("${_homeController.userProfile.name}"),
              ),
              SliverToBoxAdapter(
                child: buildSearchBar(),
              ),
              SliverToBoxAdapter(
                child: buildParallaxView(context, state),
              ),
              SliverToBoxAdapter(
                child: buildCatalogView(),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.w,
                      crossAxisSpacing: 10.w,
                      childAspectRatio: 16 / 9),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return buildCourseGrid();
                    },
                    childCount: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
