import 'package:demo1/pages/utils/common_toast.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              CommonToast.showToast('已经退出登录');
            },
            child: Text(
              '退出登录',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
