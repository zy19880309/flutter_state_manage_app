import 'package:flutter/material.dart';

class Controller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _Controllable();
  }
}

class _Controllable extends State<Controller> {
  bool toggle = true;

  _changeToggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getChild() {
    if (toggle) {
      return new Text("第一个");
    } else {
      return new MaterialButton(
        onPressed: () {},
        child: new Text("第二个"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("更改控件"),
      ),
      body: _getChild(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        child: new Icon(Icons.update),
      ),
    );
  }
}
