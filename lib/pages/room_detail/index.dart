// import 'package:demo1/models/room_detail_data.dart';
import 'package:demo1/pages/home/info/index.dart';
import 'package:demo1/utils/common_toast.dart';
import 'package:demo1/utils/dio_http.dart';
import 'package:demo1/widgets/common_swiper.dart';
import 'package:demo1/widgets/common_tag.dart';
import 'package:demo1/widgets/common_title.dart';
import 'package:demo1/widgets/room_appliance.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'dart:convert';

import '../../config.dart';
import './data.dart';

var bottomButtonTextStyle = TextStyle(fontSize: 20.0, color: Colors.white);

class RoomDetailPage extends StatefulWidget {
  final String roomId;

  const RoomDetailPage({Key key, this.roomId}) : super(key: key);

  @override
  _RoomDetailPageState createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  RoomDetailData data;
  bool isLike = false;
  bool showAllText = false;

  // _getData() async {
  //   final url = '/houses/${widget.roomId}';

  //   var res = await DioHttp.of(context).get(url);
  //   var resMap = json.decode(res.toString());
  //   var resData = resMap['body'];
  //   var roomDetailData = RoomDetailData.fromJson(resData);
  //   roomDetailData.houseImgs =
  //       roomDetailData.houseImgs.map((item) => Config.BaseUrl + item).toList();

  //   setState(() {
  //     data = roomDetailData;
  //   });
  // }

  @override
  void initState() {
    // _getData();
    setState(() {
      data = defaultData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (null == data) return Container();

    bool showTextTool = data.subTitle.length > 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Share.share('https://www.bilibili.com/');
            },
            icon: Icon(Icons.share),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              CommonSwiper(
                images: data.houseImgs,
              ),
              CommonTitle(data.title),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      data.price.toString(),
                      style: TextStyle(fontSize: 20.0, color: Colors.pink),
                    ),
                    Text(
                      '元/月(押一付三)',
                      style: TextStyle(fontSize: 14.0, color: Colors.pink),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
                child: Wrap(
                  spacing: 4.0,
                  children: data.tags.map((item) => CommonTag(item)).toList(),
                ),
              ),
              Divider(
                color: Colors.grey,
                indent: 10.0,
                endIndent: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
                child: Wrap(
                  runSpacing: 20.0,
                  children: <Widget>[
                    BaseInfoItem('面积：${data.size}平米'),
                    BaseInfoItem('楼层：${data.floor}'),
                    BaseInfoItem('房型：${data.roomType}'),
                    BaseInfoItem('装修：精装'),
                  ],
                ),
              ),
              CommonTitle('房屋配置'),
              RoomApplicanceList(list: data.applicances),
              CommonTitle('房屋概况'),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.subTitle ?? '暂无房屋概况',
                      maxLines: showAllText ? null : 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllText = !showAllText;
                                  });
                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(showAllText ? '收起' : '展开'),
                                    Icon(showAllText
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down)
                                  ],
                                ))
                            : Container(),
                        Text('举报'),
                      ],
                    )
                  ],
                ),
              ),
              CommonTitle('猜你喜欢'),
              Info(),
              Container(
                height: 100.0,
              )
            ],
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  top: 10.0, left: 20.0, right: 20.0, bottom: 20.0),
              color: Colors.grey[200],
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLike = !isLike;
                      });
                    },
                    child: Container(
                      height: 50.0,
                      width: 40.0,
                      margin: EdgeInsets.only(right: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            isLike ? Icons.star : Icons.star_border,
                            size: 24.0,
                            color: isLike ? Colors.green : Colors.black,
                          ),
                          Text(
                            isLike ? '已收藏' : '收藏',
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      CommonToast.showToast('该功能暂未实现，敬请期待！');
                    },
                    child: Container(
                      height: 50.0,
                      margin: EdgeInsets.only(right: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Center(
                          child: Text(
                        '联系房东',
                        style: bottomButtonTextStyle,
                      )),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      CommonToast.showToast('该功能暂未实现，敬请期待！');
                    },
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Center(
                          child: Text(
                        '预约看房',
                        style: bottomButtonTextStyle,
                      )),
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BaseInfoItem extends StatelessWidget {
  final String content;

  const BaseInfoItem(
    this.content, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        content,
        style: TextStyle(fontSize: 16.0),
      ),
      width: (MediaQuery.of(context).size.width - 3 * 10.0) / 2,
    );
  }
}
