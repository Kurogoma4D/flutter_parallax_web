import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<double> _scrollPer = ValueNotifier<double>(0.0);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double position = _scrollController.offset / _scrollController.position.maxScrollExtent;
    _scrollPer.value = position;
  }

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Container(
        width: _screenSize.width * 1.5,
        height: _screenSize.height,
        child: _buildStack(_screenSize),
      ),
    );
  }

  Widget _buildStack(Size _size) {
    return Stack(
      children: <Widget>[
        ValueListenableBuilder(
          valueListenable: _scrollPer,
          builder: (context, value, _){
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
          builder: (context, value, _){
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
