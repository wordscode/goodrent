import 'package:demo1/scoped_model/room_filter.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:demo1/pages/home/index.dart'; // 导入 fluro 包
import 'package:demo1/routes.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  const Application({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Router router = Router();
    Routes.configureRoutes(router);
    return ScopedModel<FilterBarModel>(
        model: FilterBarModel(),
        child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.green),
          onGenerateRoute: router.generator,
          debugShowCheckedModeBanner: false,
          // home: HomePage(),
        ));
  }
}
