import 'package:bloc_app/common/entities/entities.dart';
import 'package:bloc_app/screens/global.dart';
import 'package:flutter/material.dart';

class HomeController {
  final BuildContext context;
  HomeController({required this.context});
  UserItem userProfile = Global.storageService.getUserProfile();
  void init() {
    print("Home controller initialized!");
  }
}
