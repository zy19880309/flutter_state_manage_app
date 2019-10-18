import 'package:flutter/material.dart';

class WightLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _tap;
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";
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
              ),
              Image(
                image: AssetImage("images/lake.jpg"),
                width: 100,
                height: 60,
              ),
              Image.asset(
                "images/cake.jpg",
                width: 100,
              ),
              Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100,
              ),
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100,
              ),
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100,
                height: 60,
                fit: BoxFit.fitWidth,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
              ),
              Text(
                icons,
                style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.accessible,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.error,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.fingerprint,
                    color: Colors.green,
                  ),
                ],
              )
            ],
          ),
        ),
        SelectWight()
      ],
    );
  }
}

class SelectWight extends StatefulWidget {
  @override
  _SelectWightState createState() => _SelectWightState();
}

class _SelectWightState extends State<SelectWight> {
  bool _switchState = true;
  bool _checkState = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
          value: _switchState,
          onChanged: (value) {
            setState(() {
              _switchState = value;
            });
          },
          activeColor: Colors.teal,
        ),
        Checkbox(
          value: _checkState,
          onChanged: (value) {
            setState(() {
              _checkState = value;
            });
          },
          checkColor: Colors.red,
          activeColor: Colors.green,
        )
      ],
    );
  }
}
