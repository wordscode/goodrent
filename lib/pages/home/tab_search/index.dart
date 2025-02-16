import 'package:demo1/pages/home/tab_search/data_list.dart';
import 'package:demo1/widgets/room_list_item_widget.dart';
import 'package:flutter/material.dart';

class TabSearch extends StatelessWidget {
  const TabSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tabSearch'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 40,
            child: Text('filterBar'),
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
