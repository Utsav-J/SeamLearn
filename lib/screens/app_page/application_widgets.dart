import 'package:flutter/widgets.dart';

Widget buildPage(int index) {
  const List<Widget> _widgets = [
    Center(child: Text("Home")),
    Center(child: Text("Search")),
    Center(child: Text("Course")),
    Center(child: Text("Chats")),
    Center(child: Text("Profile")),
  ];
  return _widgets[index];
}
