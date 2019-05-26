import 'package:flutter_web/material.dart';

Widget buildStack(Size _size, ValueNotifier<double> _scrollPer) {
  return Stack(
    children: <Widget>[
      ValueListenableBuilder(
        valueListenable: _scrollPer,
        builder: (context, value, _) {
          return Positioned(
            top: _size.height * 0.2 + (value * 100),
            left: _size.width * 0.2,
            width: 800,
            height: 300,
            child: Container(color: Colors.amber),
          );
        },
      ),
      ValueListenableBuilder(
        valueListenable: _scrollPer,
        builder: (context, value, _) {
          return Positioned(
            top: _size.height * 0.5 + (-value * 400),
            left: _size.width * 0.4,
            width: 800,
            height: 400,
            child: Container(color: Colors.lightBlue),
          );
        },
      ),
    ],
  );
}
