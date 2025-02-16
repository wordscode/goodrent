import 'package:demo1/pages/home/info/index.dart';
import 'package:flutter/material.dart';

class TabInfo extends StatefulWidget {
  const TabInfo({Key key}) : super(key: key);

  @override
  _TabInfoState createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('咨询tab'),
        ),
        // title: SearchBar(
        //   onSearch: () {
        //     CommonToast.showToast('该功能暂未实现，敬请期待！');
        //   },
        // ),
        // backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
          ),
          Info(),
          Info(),
          Info(),
        ],
      ),
    );
  }
}
