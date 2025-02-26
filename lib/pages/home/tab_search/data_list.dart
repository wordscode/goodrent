import 'package:flutter/material.dart';

// import 'package:json_annotation/json_annotation.dart';
class RoomListItemData {
  // @JsonKey(name: 'houseCode')
  final String id;

  final String title;

  // @JsonKey(name: 'desc')
  final String subTitle;

  // @JsonKey(name: 'houseImg')
  final String imageUri;

  final List<String> tags;

  final int price;

  const RoomListItemData(
      {this.title,
      this.subTitle,
      this.imageUri,
      this.tags,
      this.price,
      this.id});

  // factory RoomListItemData.fromJson(Map<String, dynamic> json) =>
  //     _$RoomListItemDataFromJson(json);

  // Map<String, dynamic> toJson() => _$RoomListItemDataToJson(this);
}

const List<RoomListItemData> dataList = [
  RoomListItemData(
      title: '朝阳门南大街 2室1厅 8300元',
      subTitle: "二室/114/东|北/朝阳门南大街",
      imageUri:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu9t1kxj30lo0c7796.jpg",
      price: 1200,
      id: '331',
      tags: ["近地铁", "集中供暖", "新上", "随时看房", "近地铁", "集中供暖", "新上", "随时看房"]),
  RoomListItemData(
      title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
      subTitle: "一室/110/西/CBD总部公寓二期",
      imageUri:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu5s7gcj30lo0c7myq.jpg",
      price: 6000,
      id: '11',
      tags: ["近地铁", "随时看房"]),
  RoomListItemData(
      title: '朝阳门南大街 2室1厅 8300元',
      subTitle: "二室/114/东|北/朝阳门南大街",
      imageUri:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu5s7gcj30lo0c7myq.jpg",
      price: 1200,
      id: '1',
      tags: ["近地铁", "集中供暖", "新上", "随时看房"]),
  RoomListItemData(
      title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
      subTitle: "一室/110/西/CBD总部公寓二期",
      imageUri:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu9t1kxj30lo0c7796.jpg",
      price: 6000,
      id: '31',
      tags: ["近地铁", "随时看房"]),
];
