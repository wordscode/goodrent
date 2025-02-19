import 'dart:convert';
import 'dart:io';

import 'package:demo1/pages/utils/common_toast.dart';
import 'package:demo1/pages/utils/dio_http.dart';
import 'package:demo1/pages/utils/string_is_null_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// 3. 编写无状态组件
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var repeatPasswordController = TextEditingController();

  _registerHandler() async {
    var username = usernameController.text;
    var password = passwordController.text;
    var repeatPassword = repeatPasswordController.text;
    if (password != repeatPassword) {
      CommonToast.showToast('两次输入的密码不一致！');
      return;
    }
    if (stringIsNullOrEmpty(username) || stringIsNullOrEmpty(password)) {
      CommonToast.showToast('用户名或密码不能为空！');
      return;
    }

    print("$username $password");

    const url = '/user/registered';
    var params = {"username": username, "password": password};
    // try {
    //   // 创建 HttpClient 实例
    //   HttpClient client = HttpClient();
    //   Uri uri = Uri.parse(url);
    //   HttpClientRequest request = await client.postUrl(uri);

    //   // 设置请求头
    //   request.headers.set('Content-Type', 'application/json');

    //   // 设置请求体
    //   request.add(utf8.encode(json.encode(params)));

    //   // 发送请求并等待响应
    //   HttpClientResponse response = await request.close();

    //   // 获取响应内容
    //   String responseBody = await response.transform(utf8.decoder).join();

    //   // 关闭客户端
    //   client.close();

    //   // 解析返回的 JSON 数据
    //   var resString = json.decode(responseBody);

    //   int status = resString['status'];
    //   String description = resString['description'] ?? '内部错误';
    //   CommonToast.showToast(description);

    //   if (status.toString().startsWith('2')) {
    //     Navigator.of(context).pushReplacementNamed('login');
    //   }
    // } catch (e) {
    //   print('请求失败: $e');
    //   CommonToast.showToast('网络请求失败，请稍后再试！');
    // }
    var logger = Logger();
    try {
      var res = await DioHttp.of(context).post(url, params);
      var resString = json.decode(res.toString());

      int status = resString['status'];
      String description = resString['description'] ?? '内部错误';
      CommonToast.showToast(description);

      if (status.toString().startsWith('2')) {
        Navigator.of(context).pushReplacementNamed('login');
      }

      logger.e("Error log");
    } catch (e) {
      print('请求失败: $e');

      CommonToast.showToast('网络请求失败，请稍后再试！');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
              obscureText: true,
              controller: repeatPasswordController,
              decoration: InputDecoration(
                labelText: '确认密码',
                hintText: '请输入密码',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            RaisedButton(
              color: Colors.green,
              child: Text(
                '注册',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _registerHandler();
              },
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('已有账号，'),
                FlatButton(
                  child: Text(
                    '去登录～',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
