import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var packedRow = new Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    new Icon(Icons.star, color: Colors.green[500]),
    new Icon(Icons.star, color: Colors.green[500]),
    new Icon(Icons.star, color: Colors.green[500]),
    new Icon(Icons.star, color: Colors.black),
    new Icon(Icons.star, color: Colors.black),
  ],
);

var ratings = new Container(
  padding: new EdgeInsets.all(20.0),
  child: new Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      packedRow,
      new Text(
        '170 Reviews',
        style: new TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20.0,
        ),
      ),
    ],
  ),
);

var descTextStyle = new TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w800,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 18.0,
  height: 2.0,
);

// DefaultTextStyle.merge可以允许您创建一个默认的文本样式，该样式会被其
// 所有的子节点继承
var iconList = DefaultTextStyle.merge(
  style: descTextStyle,
  child: new Container(
    padding: new EdgeInsets.all(20.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        new Column(
          children: [
            new Icon(Icons.kitchen, color: Colors.green[500]),
            new Text('PREP:'),
            new Text('25 min'),
          ],
        ),
        new Column(
          children: [
            new Icon(Icons.timer, color: Colors.green[500]),
            new Text('COOK:'),
            new Text('1 hr'),
          ],
        ),
        new Column(
          children: [
            new Icon(Icons.restaurant, color: Colors.green[500]),
            new Text('FEEDS:'),
            new Text('4-6'),
          ],
        ),
      ],
    ),
  ),
);

var titleText = new Text(
  "标题",
  style: new TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Robot",
      color: Colors.black),
);

var subTitle = new Text(
  "符标题",
  style: new TextStyle(fontSize: 20.0, fontFamily: "Robot", color: Colors.grey),
);

var leftColumn = new Container(
  padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
  child: new Column(
    children: [
      titleText,
      subTitle,
      ratings,
      iconList,
    ],
  ),
);

class ImageCombineWidgets extends StatelessWidget {
  final Widget title;

  ImageCombineWidgets({this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "蛋糕",
      home: new Scaffold(
        appBar: null,
        body: new Center(
          child: new Container(
            padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
            height: 600.0,
            child: new Card(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    width: 440.0,
                    child: leftColumn,
                  ),
                  new Image.asset(
                    "images/cake.jpg",
                    height: 600.0,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
