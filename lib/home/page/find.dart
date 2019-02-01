import 'package:flutter/material.dart';
import 'package:flutter_app/home/page/IndexSecond.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'CityPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/home/util/MyIndicator.dart';

class Find extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Find();
}

class _Find extends State<Find> with AutomaticKeepAliveClientMixin {
  List subjects = [];
  String title = '';
  String nowCity ='北京';
  final _saved = new Set<String>();
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadData(nowCity);
  }

  loadData(String city) async {
    String loadRUL =
        "https://api.douban.com/v2/movie/in_theaters" + "?city=" + city;
    print(loadRUL);
    http.Response response = await http.get(loadRUL);
    var result = json.decode(response.body);
    setState(() {
//      print(result);
      title = result['title'];
      print('title: $title');
      subjects = result['subjects'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
          backgroundColor: Colors.red,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push<String>(
                    context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return new CitySelectPage(nowCity);
                })).then((String result) {
                  if (result != null) {
                    print("次级页面返回的数据：$result");
                    nowCity = result;
                    loadData(nowCity);
                  }else{
                    print("未选择城市");
                  }
                });
              },
            ),
          ],
        ),
        body: new Container(
          child: new Container(child: list()),
        ),
      ),
    );
  }

  Widget list() {
    if (subjects.length != 0) {
      return ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (BuildContext context, int position) {
            return getItem(subjects[position]);
          });
    } else {
      // 加载菊花
      return
        new Center(
        child: ProgressView(),
      );
    }
  }

  void _askedToLoad() async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('提示信息', style: new TextStyle(fontSize: 17.0)),
            content: new Text(
              '你确定要跳转到第二页吗?',
              style: new TextStyle(fontSize: 14.0),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                  '取消',
                  style: new TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('确定'),
                onPressed: () {
                  //取消弹出框
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .push(
                      new MaterialPageRoute(builder: (_) {
                    return new IndexSecond(
                      url: "https://www.baidu.com",
                      title: "百度",
                    );
                  })
                  );
                },
              )
            ],
          );
        });
  }

  getItem(var subject) {
    final alreadySaved = _saved.contains(subject["id"]);
//    演员列表
    var avatars = List.generate(
      subject['casts'].length,
      (int index) => Container(
            margin: EdgeInsets.only(left: index.toDouble() == 0.0 ? 0.0 : 10.0),
            child: GestureDetector(
              child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: NetworkImage(
                      subject['casts'][index]['avatars']['small'])),
              onTap: () {
                print(subject['casts'][index]['alt']);
                Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (context) => new IndexSecond(
                            url: subject['casts'][index]['alt'],
                            title: subject['casts'][index]['name'],
                          )),
                );
              },
            ),
          ),
    );
    var directors = List.generate(
        subject['directors'].length,
        (int index) => Container(
              margin:
                  EdgeInsets.only(left: index.toDouble() == 0.0 ? 0.0 : 10.0),
              child: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: NetworkImage(
                      subject['directors'][index]['avatars']['small']),
                ),
                onTap: () {
                  print(subject['directors'][index]['alt']);
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (context) => new IndexSecond(
                              url: subject['directors'][index]['alt'],
                              title: subject['directors'][index]['name'],
                            )),
                  );
                },
              ),
            ));
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: GestureDetector(
              child: Image.network(
                subject['images']['large'],
                width: 100.0,
                height: 160.0,
                fit: BoxFit.fill,
              ),
              onTap: () {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("跳转下一页"),
                  action: new SnackBarAction(
                    label: "确定",
                    onPressed: () {
                      _askedToLoad();
                    },
                  ),
                ));
              },
            ), //响应点击事件
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 8.0),
            height: 160.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(right: 10),
                      child: new Text(
                        subject['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
//                    电影名称
//                    豆瓣评分
                Text(
                  '豆瓣评分：${subject['rating']['average']}',
                  style: TextStyle(fontSize: 14.0),
                ),
//                    类型
                Text("类型：${subject['genres'].join("、")}"),
//                    导演
//                Text('导演：${subject['directors'][0]['name']}'),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text('导演：'),
                      Row(
                        children: directors,
                      )
                    ],
                  ),
                ),
//                    演员
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text('主演：'),
                      Row(
                        children: avatars,
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
          new Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0),
                width: 35,
                height: 70,
                child:Column(
                  children: <Widget>[
                    Text(
                      subject['year'],
                      style: new TextStyle(color: Colors.orange),
                    ),
                    new IconButton(
                      icon: (alreadySaved
                          ? new Icon(Icons.star)
                          : new Icon(Icons.star_border)),
                      color: Colors.orange,
                      onPressed: () {
                        setState(() {
                          if (alreadySaved) {
                            _saved.remove(subject["id"]);
                          } else {
                            _saved.add(subject["id"]);
                          }
                        });
                      },
                    ),
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 10,
                height: 70,
              ),
            ],
          ),
        ],
      ),
    );
    return Card(
      child: new InkWell(
        child: row,
        onTap: () {
          _askedToLoad();
        },
      ),
//      child: row,
      elevation: 0,
    );
  }
}

