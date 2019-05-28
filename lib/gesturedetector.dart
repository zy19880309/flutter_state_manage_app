import 'package:flutter/material.dart';

class GestureDetectorLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "手势双击",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("手势双击"),
        ),
        body: new _DoubleTap(),
      ),
    );
  }
}

class _DoubleTap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _DoubleTapState();
  }
}

class _DoubleTapState extends State<_DoubleTap> with TickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _curvedAnimation =
        new CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      child: new RotationTransition(
        turns: _curvedAnimation,
        child: new FlutterLogo(
          size: 200.0,
        ),
      ),
      onDoubleTap: () {
        if (_controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
    );
  }
}