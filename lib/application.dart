import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:demo1/pages/home/index.dart'; // 导入 fluro 包
import 'package:demo1/routes.dart';

class Application extends StatelessWidget {
  const Application({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final router = FluroRouter();
    // Routes.configureRoutes(router);
    Router router = Router();
    Routes.configureRoutes(router);

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      onGenerateRoute: router.generator,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
