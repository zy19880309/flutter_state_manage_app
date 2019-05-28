import 'package:flutter/material.dart';

class FadeAnimPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "淡入动画",
      home: new _FadePage(),
    );
  }
}

class _FadePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _FadeState();
  }
}

class _FadeState extends State<_FadePage> with TickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curve;

  @override
  void initState() {
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _curve = new CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("淡入动画"),
      ),
      body: new Container(
        child: new FadeTransition(
          opacity: _curve,
          child: new FlutterLogo(
            size: 100.0,
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        tooltip: "fade",
        child: new Icon(Icons.brush),
      ),
    );
  }
}
