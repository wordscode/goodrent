import 'package:demo1/pages/home/tab_index/index.dart';
import 'package:demo1/pages/home/tab_profile/index.dart';
import 'package:demo1/pages/home/tab_search/index.dart';
import 'package:demo1/widgets/search_bar/index.dart';
import 'package:flutter/material.dart';
import 'package:demo1/pages/home/tab_info/index.dart';
import 'package:demo1/widgets/page_content.dart';

//4个tab内容区(tabView)
List tabViewList = [
  TabIndex(),
  TabSearch(),
  // PageContent(name: '搜索'),
  // PageContent(name: '咨询'),
  TabInfo(),
  TabProfile()
];

//4 个BottomNavigationBarltem
List<BottomNavigationBarItem> barItemList = [
  BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
  BottomNavigationBarItem(title: Text('搜索'), icon: Icon(Icons.search)),
  BottomNavigationBarItem(title: Text('咨询'), icon: Icon(Icons.info)),
  BottomNavigationBarItem(title: Text('我的'), icon: Icon(Icons.account_circle))
];

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //小于 4个默认fixed ，否则shifting
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
