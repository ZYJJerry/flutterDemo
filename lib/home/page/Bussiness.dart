import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:flutter_app/home/util/Config.dart';

class Bussiness extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Bussiness();
}

class _Bussiness extends State<Bussiness> {
  @override
  Widget build(BuildContext context) {
    return new  Scaffold(
      appBar: new AppBar(
        title: Text("商家"),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gwtNetData();
  }

  _gwtNetData() async{
    print(_getPara());
    String loadRUL =
        "http://42.81.112.45/PS";
    http.Response response = await http.post(loadRUL,body:jsonEncode(_getPara()));
//    var result = json.decode(response.body);
    print(response.body);
    setState(() {

    });
  }
  _getPara (){
    var request = Map();
    var service = Map<String,String>();
    service["bl"] = "gp.point.bl.QueryOrderBL";
    service["function"] = "queryCooperationSeller";

    var paramater = Map<String,String>();
    paramater["pPage"] = "1";
    paramater["query_type"] = "Pages";
    paramater["pSize"] = "10";
    var paramaters = Map<String,Map>();
    paramaters["paramater"] = paramater;

    var route = Map();
    route["code"] = "";
    route["note"] = "";
    route["ip"] = "";
    route["date"] = "";
    var remote = Map();
    remote["name"] = "";
    remote["date"] = "";
    var client = Map();
    client["route"] = route;
    client["remote"] = remote;

    var session = Map();
    session["authorize_object_cv"] = "1";
    session["dev_unique"] = "4F8333B5CB4443BDB7392DDE7471D276";
    session["tz_id"] = "Asia/Shanghai";
    session["token"] = "da8d2620be4f4a8ea8292f540ae66dbc";

    request["service"] = service;
    request["parameters"] = paramaters;
    request["call_uuid"] = _uuid();
    request["client"] = client;
    request["security"] = session;
    request["back"] = "j";
    var requestdata = Map();
    requestdata["request"] = request.toString();
    return requestdata;
  }

  _uuid (){
    List string = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9"];
    String uuid = "";
    final random = Random();
    for(int i = 0; i < 32;i++){
      uuid = uuid+string[random.nextInt(32)];
    }
    print("-----------"+uuid);
    return uuid;
  }
}
