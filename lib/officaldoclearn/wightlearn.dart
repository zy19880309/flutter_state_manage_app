import 'package:flutter/material.dart';

class WightLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _tap;
    return ListView(
      children: <Widget>[
        Text(
          "align" * 10,
          textAlign: TextAlign.left,
          maxLines: 1,
          textScaleFactor: 1.5,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18.0,
            height: 1.2,
            //这个是比例值，高度的1.2倍
            color: Colors.blue,
            background: Paint()..color = Colors.yellow,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dashed,
          ),
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: "home",
          ),
          TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(color: Colors.blue),
              recognizer: _tap)
        ])),
        DefaultTextStyle(
          style: TextStyle(color: Colors.yellow, fontSize: 20, height: 1.5),
          child: Column(
            children: <Widget>[
              Text("张飞"),
              Text("关于"),
              Text("刘备"),
              Text(
                "zhaoyun",
                style: TextStyle(fontFamily: "Raleway"),
              ),
              FlatButton(
                child: Text("flatbutton"),
                onPressed: () {
                  /*_AnimateState _state =
                      context.ancestorStateOfType(TypeMatcher());
                  _state.showSnackBar(SnackBar(
                    content: Text("点击"),
                    duration: Duration(seconds: 1),
                  ));*/
                  print("点击");
                },
              ),
              OutlineButton(
                child: Text("outlinebutton"),
                onPressed: () {
                  print("outline");
                },
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  print('icon');
                },
              ),
              OutlineButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                  label: Text("outline发送，带图标的")),
              FlatButton(
                textColor: Colors.white,
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                splashColor: Colors.pink,
                child: Text("flatbutton属性学习"),
                onPressed: () {
                  print('属性学习');
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
