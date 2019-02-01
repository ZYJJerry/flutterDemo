import 'package:flutter/material.dart';

class NagivationView{
  final BottomNavigationBarItem item;
  final AnimationController controller;

  NagivationView({Widget icon,Widget title,TickerProvider vsync}):
      item = new BottomNavigationBarItem(
          icon: icon,
          title: title
      ),
  controller = new AnimationController(
    duration: kThemeAnimationDuration,
      vsync: vsync
  );
}