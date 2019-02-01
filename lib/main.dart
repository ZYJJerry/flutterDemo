import 'package:flutter/material.dart';
import 'package:flutter_app/home/home.dart';
import 'home/page/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      routes: {
        '/home': (ctx) => home(),
      },
      home: new SplashPage(),
    );
  }
}




