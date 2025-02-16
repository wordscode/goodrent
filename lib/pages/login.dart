import 'package:flutter/material.dart';
// import 'package:demo1/pages/home/index.dart';
// import 'package:demo1/widgets/page_content.dart'; //输入HomePage自动添加

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('登录'),
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(30),
          child: ListView(
            children: <Widget>[
              TextField(
                decoration:
                    InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                obscureText: !showPassword,
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请输入密码',
                    suffixIcon: IconButton(
                        icon: Icon(showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        })),
              ),
              Padding(padding: EdgeInsets.all(10)),
              RaisedButton(
                child: Text('登录'),
                onPressed: () {
                  //todo
                },
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('还没有账号'),
                    FlatButton(
                      child: Text(
                        '去注册',
                        style: TextStyle(color: Colors.teal),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'register');
                      },
                    )
                  ])
            ],
          ),
        ));
  }
}
