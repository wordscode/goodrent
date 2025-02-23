import 'package:demo1/pages/home/tab_search/data_list.dart';
import 'package:demo1/pages/home/tab_search/filter_bar/index.dart';
import 'package:demo1/widgets/room_list_item_widget.dart';
import 'package:demo1/widgets/search_bar/index.dart';
import 'package:flutter/material.dart';

import 'filter_bar/filter_drawer.dart';

class TabSearch extends StatelessWidget {
  const TabSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      appBar: AppBar(
        actions: <Widget>[Container()],
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: SearchBar(
          showLoaction: true,
          showMap: true,
          onSearch: () {
            // Navigator.of(context).pushNamed('search')
            // CommonToast.showToast('该功能暂未实现，敬请期待！');
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 40,
            child: FilterBar(
              onChange: (data) {},
            ),
          ),
          Expanded(
            child: ListView(
              children:
                  dataList.map((item) => RoomListItemWidget(item)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
