import 'package:flutter/material.dart';
import 'package:flutter_app/home/util/Config.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Invite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new Invite_Page();
}

class Invite_Page extends State<Invite> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("邀请好友"),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: new Center(
        child: new Stack(
          children: <Widget>[
            new ConstrainedBox(
              child: Image.asset(
                backImages[0],
                fit: BoxFit.fill,
              ),
              constraints: new BoxConstraints.expand(),
            ),
            new Column(
              children: <Widget>[
                new Expanded(
                  flex: 12,
                  child: Container(),
                ),
                new Expanded(
                  flex: 40,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        new Expanded(
                            flex: 6,
                            child: new Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
//                              color: Colors.red,
                              child: new Column(
                                children: <Widget>[
                                  new Expanded(
                                    flex: 1,
                                    child: new Container(
                                      child: new Center(
                                        child: new Text("您的邀请码"),
                                      ),
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 1,
                                    child: new Container(
                                      child: new Center(
                                        child: new Text(
                                          "ABCDEF",
                                          style: new TextStyle(
                                            fontSize: 46,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 1,
                                    child: new Container(
                                      child: new Center(
                                        child: new RaisedButton(
                                          onPressed: () {},
                                          color: Colors.redAccent,
                                          child: new Text(
                                            "复制",
                                            style: new TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 1,
                                    child: new Container(
                                      child: new Center(
                                        child: new Text(
                                          "邀请好友得神秘因子",
                                          style: new TextStyle(
                                              color: Colors.orange),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        new Expanded(
                            flex: 5,
                            child: Column(
                              children: <Widget>[
                                new Container(
                                  margin:EdgeInsets.only(top: 30),
                                  child: Center(
                                    child: QrImage(
                                      data: "二维码内容",
                                      size: 100,
                                      onError: (ex) {
                                        print("生成二维码失败");
                                      },
                                    ),
                                  ),
                                ),
                                new Text("扫码注册积分互换",style: TextStyle(color: Colors.black26),),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                new Expanded(
                  flex: 9,
                  child: Column(
                    children: <Widget>[
                      new Expanded(
                        flex:1,
                        child: new Container(
                          margin: EdgeInsets.only(bottom: 0),
                          child: new Center(
                            child: new Text("www.unitepoints.com",style: TextStyle(
                              color: Colors.white
                            ),),
                          )),
                        ),
                      new Expanded(
                        flex:1,
                        child: new Text("本活动最终解释权归链点所有",style: TextStyle(color: Colors.white),),)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
