import 'package:flutter/material.dart';
import 'package:flutter_app/home/navigation_icon_view.dart';
import 'package:flutter_app/home/page/index.dart';
import 'package:flutter_app/home/page/find.dart';
import 'package:flutter_app/home/page/more.dart';
import 'package:flutter_app/home/page/notification.dart';

class home extends StatefulWidget {
  //  固定的写法
  @override
  State<StatefulWidget> createState()  => new _home();
}


class _home extends State<home> with TickerProviderStateMixin {

  int _currentIndex = 0;
  List<NagivationView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  void _rebuild() {
    setState(() {

    });
  }

  initData(){
    _pageList = <StatefulWidget>[
      new Index(),
      new Notification_Home(),
      new Find(),
      new LoginPage()
    ];
    _currentPage = _pageList[_currentIndex];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationViews = <NagivationView>[
      new NagivationView(
          icon: new Icon(Icons.home), title: new Text("首页"), vsync: this),
      new NagivationView(icon: new Icon(Icons.notifications),
          title: new Text("文章"),
          vsync: this),
      new NagivationView(
          icon: new Icon(Icons.dashboard), title: new Text("电影"), vsync: this),
      new NagivationView(
          icon: new Icon(Icons.menu), title: new Text("我的"), vsync: this),
    ];
    for (NagivationView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

  }

  @override
  Widget build(BuildContext context) {
    initData();
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: _navigationViews
            .map((NagivationView navigationIconView) => navigationIconView.item)
            .toList(),  // 添加 icon 按钮
        currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
          setState(() {
            _navigationViews[_currentIndex].controller.reverse;
            _currentIndex = index;
            _navigationViews[_currentIndex].controller.forward();
            _currentPage = _pageList[_currentIndex];
          });
      },
    );
    return new MaterialApp (
      home: new Scaffold(
        body: new Center(
          child: _currentPage,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(250, 140, 0,1.0),
      ),
//      body: _buildSuggestions(),
    );
  }

}
