import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MovieDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new MovieDetailPage();

}

class MovieDetailPage extends State<MovieDetail> {
  @override Widget build(BuildContext context) {
    return new MaterialApp(home: new Scaffold(appBar: new AppBar(
      title: new Text('通知'), actions: <Widget>[ new Container()],),
      body: new Center(
        child: new ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 20,
//          itemExtent: ,
          itemBuilder: (BuildContext contex,int index){
            if (index%2==0) return getnewCard();
            return getCard();
          },
        ),
      ),
    ),
    );
  }

  getCard() {
    var row = Container(
      margin: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          ClipRect(
            child:
            Image.network(
              "http://pic24.photophoto.cn/20120831/0038038066142800_b.jpg",
              width: 100,
            ),
          ),

        ],
      ),
    );
    return Card(
      child: row,
    );
  }
  getnewCard() {
    var row = Container(
      margin: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          ClipRect(
            child:
            Image.network(
              "http://www.cjguanghua.com/uploadfile/2015/13/14271670023104.jpg",
              width: 100,
              height: 100,
            ),
          ),

        ],
      ),
    );
    return Card(
      child: row,
    );
  }
}
