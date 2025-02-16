import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        leading: Icon(Icons.menu),
        actions: <Widget>[Icon(Icons.search)],
      ),
      body: button(),
      // drawer: DrawerList(),
    );
  }
}

class WidgetDemoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey, 与decoration冲突
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      height: double.infinity,
      // width: 300.0,
      // height: 300.0,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(20.0)), //圆角
        border: Border.all(color: Colors.blue, width: 4.0),
        // border: Border(
        //   top: BorderSide(color: Colors.red, width: 4.0),
        //   left: BorderSide(color: Colors.yellow, width: 4.0),
        //   right: BorderSide(color: Colors.green, width: 4.0),
        // ),
      ),
      child: Text('container'),
    );
  }
}

class columnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        /*
        start
        end
        center
        spaceBetween
        spaceAround
        spaceEvenly
        */
        mainAxisAlignment: MainAxisAlignment.center, //主轴 垂直
        crossAxisAlignment: CrossAxisAlignment.start, //交叉轴
        children: [
          Icon(Icons.settings, size: 40.0),
          Icon(Icons.cloud, size: 40.0),
          Icon(Icons.vibration, size: 40.0),
          Icon(Icons.settings, size: 40.0),
          Icon(Icons.settings, size: 40.0),
        ],
      ),
    );
  }
}

class rowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.settings, size: 40.0),
          Icon(Icons.cloud, size: 40.0),
          Icon(Icons.vibration, size: 40.0),
          Icon(Icons.settings, size: 40.0),
          Icon(Icons.settings, size: 40.0),
        ],
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Test'),
            elevation: 0.0,
            leading: Icon(Icons.menu),
            actions: <Widget>[Icon(Icons.search)],
            bottom: TabBar(
              //标签
              labelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 20.0),
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: TextStyle(fontSize: 14.0),
              //标签下方指示器
              indicatorColor: Colors.red,
              indicatorWeight: 4.0,
              indicatorSize:
                  TabBarIndicatorSize.tab, //TabBarIndicatorSize.label
              tabs: [
                Tab(text: 'HTML'),
                Tab(text: 'Java'),
                Tab(text: 'Python'),
              ],
            ),
          ),
          // body: rowPage(),
          body: TabBarView(
            children: [
              Icon(Icons.settings, size: 80.0),
              Icon(Icons.search, size: 80.0),
              Icon(Icons.view_agenda, size: 80.0)
            ],
          ),
          // drawer: DrawerList(),
        ));
  }
}

class pageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset('images/pic.jpg'),
        Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('data'),
                SizedBox(
                  height: 5,
                ),
                Text('data'),
              ],
            )),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
          ],
        ),
        PubIcon(text: 'Phone', icon: Icons.phone),
        PubIcon(text: 'SHARE', icon: Icons.share),
        PubIcon(text: 'ROUTER', icon: Icons.router),
      ],
    );
  }
}

class PubIcon extends StatelessWidget {
  final String text;
  final IconData icon;

  const PubIcon({Key key, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
        ),
        SizedBox(height: 7),
        Text(
          text,
          style: TextStyle(color: Colors.blue),
        )
      ],
    );
  }
}

class MoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9, // 4/3
          child: Container(
            color: Colors.blue,
            child: Image.asset('images/pic.jpg', fit: BoxFit.cover),
          ),
        ),
        Stack(
          children: [
            Container(
              color: Colors.blue,
              width: double.infinity,
              height: 200,
            ),
            Positioned(
                right: 10,
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                )),
            Positioned(
                left: 10,
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                )),
            Positioned(
                left: 50,
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                )),
          ],
        ),
        //分割线
        Divider(
          color: Colors.blue,
          height: 10,
        ),
        ListTile(
          title: Text('My'),
          subtitle: Text('geren'),
          leading: Icon(Icons.supervised_user_circle), //左
          trailing: Icon(Icons.arrow_forward_ios), //右
          onTap: () => {print('object')}, //点击事件
        ),

        Chip(
          label: Text('html'),
          backgroundColor: Colors.red,
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('E')),
          deleteIcon: Icon(Icons.settings),
          onDeleted: () {
            print('删除？');
          },
        ),
        TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.supervised_user_circle),
            labelText: '用户名',
            hintText: '请输入用户名',
            fillColor: Colors.grey[200],
            filled: true,
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}

Widget myButton() {
  return FlatButton(onPressed: () {}, child: Text('文字按钮'));
}

class button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myButton(),
      //浮动按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        elevation: 0, //去掉阴影
        onPressed: () {
          print('按下了浮动按钮');
          Navigator.pop(context);
        },
        backgroundColor: Colors.amber,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
