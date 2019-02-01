import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app/home/util/Config.dart';
import 'package:flutter_app/home/page/Invite.dart';
import 'Bussiness.dart';


class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<Index> {
  bool select = false;
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home:
      new Scaffold(
         resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          title: new Text(
            '首页',
            style: new TextStyle(color: Colors.black),
          ),
          brightness: Brightness.light,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[new Container()],
          centerTitle: true,
        ),

        body: new Center(
          child: new ListView(
            //控制方向 默认是垂直的 //
            scrollDirection: Axis.vertical,
            children: <Widget>[
              _getBanner(),
              _getBtnItems(),
              _getDivider(10),
              _getScrollTextView(),
              _getDivider(1),
              _getEnterArea(),
              _showCount(),
              _getSelect(),
              _getSubmit(),
            ],
          ),
        ),
      ),
    );
  }

  _getDivider(double height) {
    return new Container(
      height: height, //      ListTile
      color: Color.fromRGBO(240, 240, 245, 1),
    );
  }

  Widget _getBtnItems() {
    var avatars = List.generate(
      btnImages.length,
      (int index) => Expanded(
            child: new Container(
//            color: Colors.red,
              child: Column(
                children: <Widget>[
                  new Container(
//                  color: Colors.green,
                    margin: EdgeInsets.only(
                        left: 30, top: 10, right: 30, bottom: 5),
                    child: new AspectRatio(
                      aspectRatio: 1 / 1,
                      child: GestureDetector(
                        child: Image.asset(btnImages[index]),
                        onTap: () {
                          Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                            if(index == 3){
                              return Bussiness();
                            }else{
                              return new Invite();
                            }
                          }));
                        },
                      ),
                    ),
                  ),
                  Text(
                    btnTitle[index],
                    style: new TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
    );
    return new Container(
        color: Colors.transparent,
        height: 80,
        margin: EdgeInsets.all(1),
        child: new Row(
          children: avatars,
        ));
  }

  Widget _getBanner() {
    return new Container(
      child: new AspectRatio(
        aspectRatio: 18 / 7,
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              images[index],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: 3,
          pagination:
          new SwiperPagination(
              margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
              builder: new DotSwiperPaginationBuilder(
                  color: Colors.white30,
                  activeColor: Colors.white,
                  size: 10.0,
                  activeSize: 10.0)),
//           control: new SwiperControl(),
          containerHeight: 100,
          onTap: (index) {
            print(images[index]);
          },
        ),
      ),
    );
  }

  Widget _getScrollTextView() {
    return new Container(
      height: 35,
      margin: EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
      child: new Row(
        children: <Widget>[
          new Icon(
            Icons.stars,
            color: Colors.orange,
          ),
          _getScrollText(),
        ],
      ),
    );
  }

  Widget _getScrollText() {
    return new Container(
      height: 20,
      margin: EdgeInsets.only(left: 10),
      child: new AspectRatio(
        aspectRatio: 15 / 1,
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Text(
              scrolltext[index],
              maxLines: 1,
            );
          },
          autoplay: true,
          itemCount: scrolltext.length,
          scrollDirection: Axis.vertical,
          containerHeight: 100,
          onTap: (index) {
            print(images[index]);
          },
        ),
      ),
    );
  }

  Widget _getEnterArea() {
    return new Container(
      height: 155,
//      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          new Expanded(
            flex: 3,
            child: new Container(
              child: Column(
                children: <Widget>[
                  new Container(
                    height: 74,
                    child: Row(
                      children: <Widget>[
                        new Expanded(
                            flex: 3,
                            child: new Container(
                              margin: EdgeInsets.only(left: 12, top: 15),
                              child: Text("选择换出积分",style: new TextStyle(color: Colors.grey,fontSize: 16),),
                            )),
                        new Expanded(
                            flex: 1,
                            child: new Container(
                              margin: EdgeInsets.only(right: 12, top: 15),
//                              color: Colors.red,
                              child: Icon(
                                Icons.navigate_next,
                                color: Colors.grey,
                              ),
                            )),
                      ],
                    ),
                  ),
                  new Center(
                    child: new Container(
                      color: Color.fromRGBO(235, 235, 235, 1),
                      margin: EdgeInsets.only(top: 0, left: 12, bottom: 1),
                      height: 1,
                    ),
                  ),
                  new Container(
                    height: 32,
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Text(
                            "换出数量",
                            textAlign: TextAlign.left,
                            style: new TextStyle(color: Colors.grey),
                          ),
                        ),
                        new GestureDetector(
                          child: new Container(
                            margin: EdgeInsets.only(left: 10),
                            constraints: new BoxConstraints.expand(
                                width: 50, height: 24),
                            decoration: new BoxDecoration(
                              color: Colors.red,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(12.0)),
                            ),
                            child: new Text(
                              "最大",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onTap: () {
                            _getMaxCount();
                          },
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    height: 39,
                    margin: EdgeInsets.only(left: 12),
                    child: TextField(
                      autocorrect: false,
                      controller: _controller,
                      style: new TextStyle(
                        fontSize: 17,
                      ),
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: '0',
                      ),
                    ),
                  ),
                  new Container(
                    color: Color.fromRGBO(235, 235, 235, 1),
                    margin: EdgeInsets.only(top: 1, left: 12, bottom: 0),
                    height: 1,
                  ),
                ],
              ),
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Container(
              child: new Center(
                child: Icon(
                  Icons.cached,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          new Expanded(
            flex: 3,
            child: new Container(
              child: Column(
                children: <Widget>[
                  new Container(
                    height: 74,
                    child: Row(
                      children: <Widget>[
                        new Expanded(
                            flex: 3,
                            child: new Container(
                              margin: EdgeInsets.only(right: 12, top: 15),
                              child: Text("选择换入积分",style: new TextStyle(color: Colors.grey,fontSize: 16),)
                            )),
                        new Expanded(
                            flex: 1,
                            child: new Container(
                              margin: EdgeInsets.only(right: 12, top: 15),
//                              color: Colors.red,
                              child: Icon(
                                Icons.navigate_next,
                                color: Colors.grey,
                              ),
                            )),
                      ],
                    ),
                  ),
                  new Center(
                    child: new Container(
                      color: Color.fromRGBO(235, 235, 235, 1),
                      margin: EdgeInsets.only(top: 0, right: 12, bottom: 1),
                      height: 1,
                    ),
                  ),
                  new Container(
                    height: 32,
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(left: 0),
                          child: Text(
                            "换入数量",
                            textAlign: TextAlign.left,
                            style: new TextStyle(color: Colors.grey),
                          ),
                        ),
                        new GestureDetector(
                          child: new Container(
                            margin: EdgeInsets.only(left: 10),
                            constraints: new BoxConstraints.expand(
                                width: 50, height: 24),
                            decoration: new BoxDecoration(
                              color: Colors.red,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(12.0)),
                            ),
                            child: new Text(
                              "试算",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onTap: () {
                            _getTryCalculate();
                          },
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    height: 39,
                    margin: EdgeInsets.only(right: 12),
                    child: TextField(
                      controller: _controller,
                      style: new TextStyle(
                        fontSize: 17,
                      ),
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: '0',
                      ),
                    ),
                  ),
                  new Container(
                    color: Color.fromRGBO(235, 235, 235, 1),
                    margin: EdgeInsets.only(top: 1, right: 12, bottom: 0),
//                    child: _getDivider(1),
                    height: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showCount() {
    return new Container(
      height: 30,
      child: Row(
        children: <Widget>[
          new Expanded(
              flex: 3,
              child: new Container(
                margin: EdgeInsets.only(left: 12),
                child: Text(
                  "请输入0.01的整数倍",
                  style: new TextStyle(color: Colors.orange, fontSize: 13),
                ),
              )),
          new Expanded(flex: 1, child: new Container()),
          new Expanded(
              flex: 3,
              child: new Container(
                margin: EdgeInsets.only(left: 0),
                child: Text(
                  "请输入10的整数倍",
                  style: new TextStyle(color: Colors.orange, fontSize: 13),
                ),
              )),
        ],
      ),
    );
  }

  Widget _getSelect() {
    return new Container(
      height: 24,
      child: Row(
        children: <Widget>[
          new Checkbox(
              activeColor: Colors.orange,
              value: select,
              onChanged: (bool cb) {
                setState(() {
                  select = cb;
                  print(select);
                });
              }),
          new Container(
            width: 200,
            margin: EdgeInsets.only(right: 5, left: 0),
            child: Text(
              "允许部分成交",
              style: new TextStyle(color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSubmit() {
    return new Container(
        height: 50,
        margin: EdgeInsets.only(left: 12, right: 12, top: 10),
        child: new Material(
          child: new RaisedButton(
            onPressed: () {},
            color: Colors.orange,
            child: new Text(
              "确认发布",
              style: new TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.grey,
          elevation: 0,
        )
    );
  }

  void _getMaxCount() {
    print("最大");
  }

  void _getTryCalculate() {
    print("试算");
  }
}
