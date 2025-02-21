import 'dart:io';

import 'package:demo1/models/community.dart';
import 'package:demo1/models/general_type.dart';
import 'package:demo1/widgets/common_floating_action_button.dart';
import 'package:demo1/widgets/common_form_item.dart';
import 'package:demo1/widgets/common_image_picker.dart';
import 'package:demo1/widgets/common_radio_form_item.dart';
import 'package:demo1/widgets/common_select_form_item.dart';
import 'package:demo1/widgets/common_title.dart';
import 'package:demo1/widgets/room_appliance.dart';
import 'package:flutter/material.dart';

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({Key key}) : super(key: key);

  @override
  _RoomAddPageState createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  Community community;
  var titleController = TextEditingController();
  var descController = TextEditingController();

  var sizeController = TextEditingController();
  var priceController = TextEditingController();

  int rentType = 0;
  int decorationType = 0;
  int roomType = 0;
  int floor = 0;
  int oriented = 0;

  List<GeneralType> floorList = [];
  List<GeneralType> orientedList = [];
  List<GeneralType> roomTypeList = [];
  List<File> images = [];
  List<RoomApplianceItem> applianceList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('房源发布'),
      ),
      body: ListView(
        children: <Widget>[
          CommonTitle('房源信息'),
          CommonFormItem(
            label: '小区',
            contentBuilder: (context) {
              return Container(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          community?.name ?? '请选择小区',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                  onTap: () {
                    var result =
                        Navigator.of(context).pushNamed('communityPicker');

                    result.then((value) {
                      if (null != value)
                        setState(() {
                          community = value;
                        });
                    });
                  },
                ),
              );
            },
          ),
          CommonFormItem(
            label: '租金',
            hintText: '请输入租金',
            suffixText: '元/月',
            controller: priceController,
          ),
          CommonFormItem(
            label: '大小',
            hintText: '请输入房屋大小',
            suffixText: '平方米',
            controller: sizeController,
          ),
          CommonRadioFormItem(
              label: '租赁方式',
              options: ['合租', '整租'],
              value: rentType,
              onChange: (index) {
                setState(() {
                  rentType = index;
                });
              }),
          CommonRadioFormItem(
              label: '装修',
              options: ['精装', '简装'],
              value: decorationType,
              onChange: (index) {
                setState(() {
                  decorationType = index;
                });
              }),
          CommonSelectFormItem(
              label: '户型',
              value: roomType,
              onChange: (val) {
                setState(() {
                  roomType = val;
                });
              },
              options: ['一室', '二室', '三室', '四室']),
          CommonSelectFormItem(
              label: '楼层',
              value: floor,
              onChange: (val) {
                setState(() {
                  floor = val;
                });
              },
              options: ['高楼层', '中楼层', '低楼层']),
          CommonSelectFormItem(
              label: '朝向',
              value: oriented,
              onChange: (val) {
                setState(() {
                  oriented = val;
                });
              },
              options: ['东', '南', '西', '北']),
          // if (roomTypeList.length > 0)
          //   CommonSelectFormItem(
          //     label: '户型',
          //     value: roomType,
          //     onChange: (val) {
          //       setState(() {
          //         roomType = val;
          //       });
          //     },
          //     options: roomTypeList.map((item) => item.name).toList(),
          //   ),
          // if (floorList.length > 0)
          //   CommonSelectFormItem(
          //     label: '楼层',
          //     value: floor,
          //     onChange: (val) {
          //       setState(() {
          //         floor = val;
          //       });
          //     },
          //     options: floorList.map((item) => item.name).toList(),
          //   ),
          // if (orientedList.length > 0)
          //   CommonSelectFormItem(
          //     label: '朝向',
          //     value: oriented,
          //     onChange: (val) {
          //       setState(() {
          //         oriented = val;
          //       });
          //     },
          //     options: orientedList.map((item) => item.name).toList(),
          //   ),
          CommonTitle('房屋图像'),
          CommonImagePicker(
            onChange: (List<File> files) {
              // setState(() {
              //   images = files;
              // });
            },
          ),
          CommonTitle('房屋标题'),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入标题（例如：整组，小区名 2室 2000元）',
              ),
            ),
          ),
          CommonTitle('房屋配置'),
          RoomAppliance(
            onChange: (data) {
              // applianceList = data;
            },
          ),
          CommonTitle('房屋描述'),
          Container(
            margin: EdgeInsets.only(bottom: 100.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: descController,
              maxLines: 10,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入房屋描述信息',
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton('提交', () {}),
    );
  }
}
