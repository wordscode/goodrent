import 'package:demo1/pages/config.dart';
import 'package:flutter/material.dart';

import 'common_check_button.dart';

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);
}

const List<RoomApplianceItem> _dataList = [
  RoomApplianceItem('衣柜', 0xe918, false),
  RoomApplianceItem('洗衣机', 0xe917, false),
  RoomApplianceItem('空调', 0xe90d, false),
  RoomApplianceItem('天然气', 0xe90f, false),
  RoomApplianceItem('冰箱', 0xe907, false),
  RoomApplianceItem('暖气', 0xe910, false),
  RoomApplianceItem('电视', 0xe908, false),
  RoomApplianceItem('热水器', 0xe912, false),
  RoomApplianceItem('宽带', 0xe90e, false),
  RoomApplianceItem('沙发', 0xe913, false),
];

//组件参数
//
class RoomAppliance extends StatefulWidget {
  final ValueChanged<List<RoomApplianceItem>> onChange;

  const RoomAppliance({Key key, this.onChange}) : super(key: key);

  @override
  _RoomApplianceState createState() => _RoomApplianceState();
}

class _RoomApplianceState extends State<RoomAppliance> {
  List<RoomApplianceItem> list = _dataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        runSpacing: 30.0,
        children: list
            .map((item) => GestureDetector(
                  onTap: () {
                    setState(() {
                      list = list
                          .map((innerItem) => innerItem == item
                              ? RoomApplianceItem(
                                  item.title, item.iconPoint, !item.isChecked)
                              : innerItem)
                          .toList();
                    });

                    if (null != widget.onChange) {
                      widget.onChange(list);
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(
                      children: <Widget>[
                        Icon(
                          IconData(item.iconPoint,
                              fontFamily: Config.CommonIcon),
                          size: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(item.title),
                        ),
                        CommonCheckButton(item.isChecked)
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class RoomApplicanceList extends StatelessWidget {
  final List<String> list;

  const RoomApplicanceList({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var showList =
        _dataList.where((item) => list.contains(item.title)).toList();
    if (showList.length == 0) {
      return Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Text('暂无房屋配置信息'),
      );
    }
    return Container(
      child: Wrap(
        runSpacing: 30.0,
        children: showList
            .map((item) => Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        IconData(item.iconPoint, fontFamily: Config.CommonIcon),
                        size: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(item.title),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
// class _RoomApplianceState extends State<RoomAppliance> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Wrap(
//         runSpacing: 30,
//         children: _dataList
//             .map((item) => Container(
//                   width: MediaQuery.of(context).size.width / 5,
//                   child: Column(
//                     children: <Widget>[
//                       Icon(
//                         IconData(item.iconPoint, fontFamily: Config.CommonIcon),
//                         size: 40.0,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Text(item.title),
//                       ),
//                       CommonCheckButton(item.isChecked)
//                     ],
//                   ),
//                 ))
//             .toList(),
//       ),
//     );
//   }
// }
