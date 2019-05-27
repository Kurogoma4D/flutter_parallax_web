import 'dart:math';

import 'package:flutter_web/material.dart';

class SlideBoxes extends StatefulWidget {
  SlideBoxes(this.size, this.scrollPer,{Key key}) : super(key: key);

  final Size size;
  final ValueNotifier<double> scrollPer;
  final int numberOfBoxes = 8;

  _SlideBoxesState createState() => _SlideBoxesState();
}

class _SlideBoxesState extends State<SlideBoxes> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: _buildChildren());
  }

  List<Widget> _buildChildren() {
    List<Widget> list = [];

    double boxHeight = widget.size.height * 0.6;
    double boxPosRef = (1 / widget.numberOfBoxes);

    for (var i = 0; i < widget.numberOfBoxes; i++) {
      list.add(ValueListenableBuilder(
        valueListenable: widget.scrollPer,
        builder: (context, value, _) {
          return Positioned(
            top: (value > i * boxPosRef)
                ? min(
                    (1 - (1-value) / (1-i*boxPosRef)) * 500, widget.size.height - boxHeight)
                : 0,
            left: i * widget.size.width * boxPosRef,
            width: widget.size.width * 0.3,
            height: boxHeight,
            child: Container(color: Colors.lightBlue[100 * i + 100]),
          );
        },
      ));
    }

    return list;
  }
}
