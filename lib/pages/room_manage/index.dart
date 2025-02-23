import 'dart:async';
import 'dart:convert';

import 'package:demo1/pages/home/tab_search/data_list.dart';
import 'package:demo1/utils/dio_http.dart';
import 'package:demo1/widgets/common_floating_action_button.dart';
import 'package:demo1/widgets/room_list_item_widget.dart';
import 'package:flutter/material.dart';

class RoomManagePage extends StatefulWidget {
  const RoomManagePage({Key key}) : super(key: key);

  @override
  _RoomManagePageState createState() => _RoomManagePageState();
}

class _RoomManagePageState extends State<RoomManagePage> {
  // List<RoomListItemData> availableDataList = [];

  // _getData() async {
  //   var auth = ScopedModelHelper.getModel<AuthModel>(context);
  //   if (!auth.isLogin) return;
  //   var token = auth.token;
  //   String url = '/user/houses';
  //   var res = await DioHttp.of(context).get(url, null, token);
  //   var resMap = json.decode(res.toString());
  //   List listMap = resMap['body'];

  //   var dataList =
  //       listMap.map((json) => RoomListItemData.fromJson(json)).toList();

  //   setState(() {
  //     availableDataList = dataList;
  //   });
  // }

  // @override
  // void initState() {
  //   Timer.run(_getData);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CommonFloatingActionButton('发布房源', () {
          Navigator.of(context).pushNamed('roomAdd');
          // var result = Navigator.of(context).pushNamed('roomAdd');
          // result.then((value) {
          //   if (value == true) {
          //     _getData();
          //   }
          // });
        }),
        appBar: AppBar(
          title: Text('房屋管理'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: '空置',
              ),
              Tab(
                text: '已租',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children:
                  dataList.map((item) => RoomListItemWidget(item)).toList(),
              // children: availableDataList
              //     .map((item) => RoomListItemWidget(item))
              //     .toList(),
            ),
            ListView(
              // children: List(),
              children:
                  dataList.map((item) => RoomListItemWidget(item)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
