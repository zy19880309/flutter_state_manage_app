import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends StatelessWidget {
  final Widget title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu), tooltip: "菜单", onPressed: null),
          new Expanded(child: title),
          new IconButton(
              icon: new Icon(Icons.search), tooltip: "搜索", onPressed: null)
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text("自定义的标题",
                style: Theme.of(context).primaryTextTheme.title),
          ),
          new Expanded(
              child: new Center(
            child: new Text("自定义的框架"),
          ))
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        AssetImage("images/lake.jpg");
        getAssetsJson().then((json) {
          print(json);
        });
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
            color: Colors.lightGreen[500],
            borderRadius: BorderRadius.circular(5.0)),
        child: new Center(
          child: new Text("自定义按钮"),
        ),
      ),
    );
  }
}

Future<String> getAssetsJson() async {
  return await rootBundle.loadString("assets/config.json");
}
