import 'package:flutter/material.dart';
import 'package:demo1/routes.dart';

class PageContent extends StatelessWidget {
  final String name;
  const PageContent({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('当前页面:$name'),
      ),
      body: ListView(
        children: [
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            },
            child: Text(Routes.home),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.login);
            },
            child: Text(Routes.login),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, 'not found');
            },
            child: Text('不存在的页面'),
          ),
          FlatButton(
            child: Text('房屋详情页，id：2222'),
            onPressed: () {
              Navigator.pushNamed(context, '/room/2222');
            },
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.test);
            },
            child: Text(Routes.test),
          ),
        ],
      ),
    );
  }
}
