import 'package:demo1/pages/home/tab_profile/function_button_data.dart';
import 'package:demo1/pages/home/tab_profile/function_button_widget.dart';
import 'package:flutter/material.dart';

class FunctionButton extends StatelessWidget {
  const FunctionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
          spacing: 1,
          runSpacing: 1,
          children: list.map((item) => FunctionButtonWidget(item)).toList()),
    );
  }
}
