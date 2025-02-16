import 'package:demo1/pages/home/info/index.dart';
import 'package:demo1/pages/home/tab_index/index_navigator_item.dart';
import 'package:demo1/widgets/common_swiper.dart';
import 'package:flutter/material.dart';

import 'package:demo1/widgets/page_content.dart';
import 'index_navigator.dart';
import 'index_recommond.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('tabIndex'),
        ),
      ),
      body: ListView(
        children: [
          CommonSwiper(),
          IndexNavigator(),
          IndexRecommond(),
          Info(
            showTitle: true,
          ),
          // IndexNavigatorItem(title, imageUrl, onTap)
          // Text("这里是内容区"),
        ],
      ),
    );

    // @override
    // Widget build(BuildContext context) {
    //   return Container(
    //     child: PageContent(name: '首页'),
    //   );
  }
}
