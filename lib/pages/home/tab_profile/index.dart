import 'package:demo1/pages/home/info/index.dart';
import 'package:flutter/material.dart';

import 'advertisement.dart';
import 'function_button.dart';
import 'header.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text('我的'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('setting');
            },
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Header(),
          FunctionButton(),
          Advertisement(),
          Info(
            showTitle: true,
          ),
        ],
      ),
    );
  }
}
