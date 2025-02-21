import 'package:demo1/pages/register.dart';
import 'package:demo1/pages/room_add/index.dart';
import 'package:demo1/pages/room_manage/index.dart';
import 'package:demo1/pages/setting.dart';
import 'package:demo1/pages/test.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:demo1/pages/home/index.dart';
import 'package:demo1/pages/login.dart';
import 'package:demo1/pages/not_found.dart';
import 'package:demo1/pages/room_detail/index.dart';
import 'package:demo1/pages/test.dart';

class Routes {
  // 定义路由名称
  static String home = '/';
  static String login = '/login';
  // static String roomDetail = '/room/roomId';
  static String roomDetail = '/roomDetail/:roomId';
  static String register = '/register';
  static String test = '/test';
  static String setting = '/setting';
  static String roomManage = '/roomManage';
  static String roomAdd = '/roomAdd';

// 定义路由处理函数
  static Handler _homeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomePage();
  });

  static Handler _loginHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LoginPage();
  });

  static Handler _notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return NotFoundPage();
  });

  static Handler _roomDetailHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return RoomDetailPage(
      roomId: params['roomId'][0],
    );
  });

  static Handler _registerHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return RegisterPage();
  });

  static Handler _testHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return TestPage();
  });

  static Handler _settingHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return SettingPage();
  });

  static Handler _roomManageHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomManagePage();
  });

  static Handler _roomAddHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomAddPage();
  });

//3编写函数configureRoutes关联路由名称和处理函数
  static void configureRoutes(Router router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.define(register, handler: _registerHandler);
    router.define(test, handler: _testHandler);
    router.define(setting, handler: _settingHandler);
    router.define(roomManage, handler: _roomManageHandler);
    router.define(roomAdd, handler: _roomAddHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
