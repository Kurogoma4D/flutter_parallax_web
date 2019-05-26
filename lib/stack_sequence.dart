import 'dart:math';

import 'package:flutter_web/material.dart';

Widget buildStack(Size _size, ValueNotifier<double> _scrollPer) {
  return Stack(
    children: _buildChildren(_size, _scrollPer, 5)
  );
}

List<Widget> _buildChildren(Size _size, ValueNotifier<double> _scrollPer, int length) {
  List<Widget> list = [];

  for(var i = 0; i<length; i++) {
    list.add(
      ValueListenableBuilder(
        valueListenable: _scrollPer,
        builder: (context, value, _) {
          return Positioned(
            top: (value+0.1 > i*0.2) ? min((value * 500)/(i+0.25), _size.height-_size.height * 0.6) : 0,
            left: i * _size.width * 0.3,
            width: _size.width * 0.3,
            height: _size.height * 0.6,
            child: Container(color: Colors.lightBlue[100*i+100]),
          );
        },
      )
    );
  }

  return list;
}