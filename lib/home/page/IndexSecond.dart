import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app/home/util/Config.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class IndexSecond extends StatefulWidget {
  String url;
  String title;

  IndexSecond({
    Key key,
    @optionalTypeArgs this.title,
    @required this.url,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _IndexSecond();
}

class _IndexSecond extends State<IndexSecond> {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue,
        title: new Text(
          widget.title,
          style: new TextStyle(color: Colors.white),
        ),
        actions: <Widget>[],
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      url: widget.url,
    );
  }
}
