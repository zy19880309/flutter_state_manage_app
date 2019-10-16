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
                "赵云",
                style: TextStyle(
                  fontFamily: "Raleway"
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
