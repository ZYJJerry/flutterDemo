import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new SizedBox(
        width: 30.0,
        height: 30.0,
        child: new CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation(Colors.black)
        ),
      ),
    );
  }
}
