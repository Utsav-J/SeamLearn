import 'package:bloc_app/screens/home/bloc/homepage_bloc.dart';
import 'package:bloc_app/screens/home/bloc/homepage_states.dart';
import 'package:bloc_app/screens/home/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                child: generateHomeText("user"),
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
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.transparent, Colors.black],
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                            ),
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
                                margin: EdgeInsets.only(
                                    left: 8.w, right: 8.w, bottom: 5.w),
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
