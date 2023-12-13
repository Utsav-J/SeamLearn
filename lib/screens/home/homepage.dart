import 'package:bloc_app/screens/home/bloc/homepage_bloc.dart';
import 'package:bloc_app/screens/home/bloc/homepage_states.dart';
import 'package:bloc_app/screens/home/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            generateHomeText("user"),
            buildSearchBar(),
            buildParallaxView(context, state),
            buildCatalogView(),
          ],
        ),
      ),
    );
  }
}
