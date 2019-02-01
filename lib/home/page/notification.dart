import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app/home/util/MyIndicator.dart';
import 'IndexSecond.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class Notification_Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Notification();
}

class _Notification extends State<Notification_Home> {
  List subjects = [];
  int page = 1;
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("文章"),
      ),
      body: new EasyRefresh(
        key: _easyRefreshKey,
        autoLoad: false,
        behavior: ScrollBehavior(),
        refreshHeader: _RefreshHeader(),
        refreshFooter: _RefreshFooter(),
        child: list(),
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              page = 0;
              loadData();
            });
          });
        },
        loadMore: () async {
          await new Future.delayed(const Duration(seconds: 1), () {
            page++;
            loadData();
          });
        },
      ),
    );
  }

  Widget list() {
    if (subjects.length != 0) {
      return new ListView.builder(
        padding: EdgeInsets.only(right: 10, top: 10, left: 10),
        itemCount: subjects.length,
//          itemExtent: ,
        itemBuilder: (BuildContext contex, int index) {
          return getCard(subjects[index]);
        },
      );
    } else {
      return ProgressView();
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    String loadRUL = "http://wanandroid.com/article/listproject/" +
        page.toString() +
        "/json";
    print(loadRUL);
    http.Response response = await http.get(loadRUL);
    var result = json.decode(response.body);
    setState(() {
      subjects = result['data']['datas'];
    });
  }

  getCard(var object) {
    var row = Container(
      height: 140,
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: new Container(
//              color: Colors.green,
              child: new Column(
                children: <Widget>[
                  Expanded(
                      flex: 4,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            object['title'],
                            style: new TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            object['desc'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: new Row(
                        children: <Widget>[
                          Text("作者：" + object['author']),
                          Text("  "),
                          Text(
                            "日期：" + object['niceDate'],
                          ),
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: new GestureDetector(
                      child: new Stack(
                        children: <Widget>[
                          new Align(
                            alignment: new FractionalOffset(0.0, 0.5),
                            child: Text(
                              "github地址>>",
                              style: new TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        print(object['projectLink']);
                        Navigator.of(context)
                            .push(new MaterialPageRoute(builder: (_) {
                          return new IndexSecond(
                            url: object['projectLink'],
                            title: "github地址",
                          );
                        }));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1 / 2,
                child: ClipRect(
                  child: Image.network(
                    object['envelopePic'],
                    fit: BoxFit.fill,
                    width: 80,
//              height: 150,
                  ),
                ),
              )),
        ],
      ),
    );
    return Card(
      elevation: 0,
      child: Ink(
        child: new InkWell(
          child: new Container(
            color: Colors.white,
            child: row,
          ),
          onTap: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (_) {
                  return new IndexSecond(
                    url: object['link'],
                    title: object['chapterName'],
                  );
                }));
          },
        ),
      ),
    );
  }

  _RefreshHeader() {
    return ClassicsHeader(
      key: _headerKey,
      refreshText: "下拉刷新",
      refreshReadyText: "松开刷新",
      refreshingText: "正在刷新",
      refreshedText: "刷新完成",
      moreInfo: "下拉试试...",
      bgColor: Colors.transparent,
      textColor: Colors.black87,
      moreInfoColor: Colors.orange,
      showMore: true,
    );
  }

  _RefreshFooter() {
    return ClassicsFooter(
      key: _footerKey,
      loadText: "上拉加载",
      loadReadyText: "松开加载",
      loadingText: "正在加载",
      loadedText: "加载完成",
      noMoreText: "没有更多",
      moreInfo: "上拉试试...",
      bgColor: Colors.transparent,
      textColor: Colors.black87,
      moreInfoColor: Colors.orange,
      showMore: true,
    );
  }
}
