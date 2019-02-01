import 'package:flutter/material.dart';

class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }
}

class Constant {
  static const String keyLanguage = 'key_language';

  static const int STATUS_SUCCESS = 0;

  static const String SERVER_ADDRESS = WAN_ANDROID;

  static const String WAN_ANDROID = "http://www.wanandroid.com/";

  static const int TYPE_SYS_UPDATE = 1;
  static const String KEY_THEME_COLOR = 'key_theme_color';
  static const String KEY_GUIDE = 'key_guide';
  static const String KEY_SPLASH_MODEL = 'key_splash_models';
}

Map<String, Object> param = {

    "service": {
      "bl": "gp.point.bl.QueryOrderBL",
      "function": "queryCooperationSeller"
    },
    "parameters": {
      "parameter": {
        "pPage": "1",
        "query_type": "Pages",
        "pSize": "10"
      }
    },
    "call_uuid": "XE3PMYH3GOI1Z10HFUZ1L48DG6BBLMYF",
    "client": {
      "route": {"code": "", "note": "", "ip": "", "date": ""},
      "remote": {"name": "", "date": ""}
    },
    "security": {
      "session": {
        "authorize_object_cv": "1",
        "dev_unique": "4F8333B5CB4443BDB7392DDE7471D276",
        "tz_id": "Asia/Shanghai",
        "token": "da8d2620be4f4a8ea8292f540ae66dbc"
      }
    },
    "back": "j",

};


Map<String, Object> m = {
  "a": {
    "b": "c",
    "d": "e",
  }
};

const List<String> images = [
  "https://liandiancunchu.cdn.bcebos.com/jifenhuancai2.png",
  "http://liandiancunchu.cdn.bcebos.com/05.png",
  "http://liandiancunchu.cdn.bcebos.com/04.png",
];

const List<String> btnImages = [
  "assets/images/tit2_1.png",
  "assets/images/tit2_2.png",
  "assets/images/tit2_3.png",
  "assets/images/tit2_4.png",
];

const List<String> backImages = [
  "assets/images/wodebg.png",
];

const List<String> btnTitle = [
  "邀请好友",
  "互换查询",
  "换物回收",
  "推荐商家",
];

const List<String> scrolltext = [
  "第一条滚动文字",
  "第二条滚动文字",
  "第三条滚动文字",
  "第四条滚动文字",
];
