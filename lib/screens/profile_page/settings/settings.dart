import 'package:bloc_app/screens/profile_page/settings/bloc/settings_bloc.dart';
import 'package:bloc_app/screens/profile_page/settings/bloc/settings_states.dart';
import 'package:bloc_app/screens/profile_page/settings/widgets/settings_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSettingsAppBar(),
      body: SingleChildScrollView(
          child: BlocBuilder<SettingsBloc, SettingsStates>(
        builder: (context, state) {
          return Column(
            children: [
              Center(
                child: buildLogOutButton(context),
              ),
            ],
          );
        },
      )),
    );
  }
}
