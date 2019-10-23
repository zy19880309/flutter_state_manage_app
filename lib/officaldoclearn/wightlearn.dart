import 'package:flutter/material.dart';
import 'package:state_manage_app/officaldoclearn/layoutlearn.dart';

class MyApp {
  MaterialApp getApp() {
    return MaterialApp(
      title: "控件学习",
      theme: ThemeData(
          primaryColor: Colors.blue,
          canvasColor: Colors.white,
          accentColor: Colors.pink,
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
              hintStyle:
                  TextStyle(color: Colors.grey, fontSize: 14.0) //定义提示文本样式
              )),
      home: Scaffold(
        body: WightLearn(),
      ),
    );
  }
}

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
        FormTestRoute(),
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
        SelectWight(),
        LayoutWidgetLearn(),
      ],
    );
  }
}

class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _userController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                icon: Icon(Icons.person),
              ),
              validator: (value) {
                return value.trim().length > 0 ? null : "用户名不能为空";
              },
            ),
            TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "输入密码",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  return value.trim().length > 5 ? null : "密码不能少于六位";
                }),
            // 登录按钮
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text("登录"),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        //在这里不能通过此方式获取FormState，context不对
                        //print(Form.of(context));

                        // 通过_formKey.currentState 获取FormState后，
                        // 调用validate()方法校验用户名密码是否合法，校验
                        // 通过后再提交数据。
                        if ((_formKey.currentState as FormState).validate()) {
                          //验证通过提交数据
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
  TextEditingController _controller = TextEditingController();

  FocusNode fn1 = FocusNode();
  FocusNode fn2 = FocusNode();

  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.text);
    });
    _controller.text = "hello world";
    _controller.selection =
        TextSelection(baseOffset: 3, extentOffset: _controller.text.length);
    fn1.addListener(() {
      print(fn1.hasFocus); //监听焦点变化
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ),
        TextField(
          controller: _controller,
          autofocus: true,
          focusNode: fn1,
          decoration: InputDecoration(
              labelText: "用户名：",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(
                Icons.person,
                color: Colors.lime,
              )),
          /*onChanged: (value) {
            //这只是监听之一
            print(_controller.text);
          },*/
        ),
        Container(
          child: TextField(
            autofocus: false,
            focusNode: fn2,
            decoration: InputDecoration(
              labelText: "密码：",
              hintText: "输入密码",
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.lime,
              ),
            ),
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.lightGreenAccent,
            width: 5.0,
          ))),
        ),
        OutlineButton(
          child: Text("移动焦点"),
          color: Colors.blue,
          onPressed: () {
//            FocusScope.of(context).requestFocus(fn2);//方法1
            if (null == focusScopeNode) {
              focusScopeNode = FocusScope.of(context);
            }
            focusScopeNode.requestFocus(fn2);
          },
        ),
        OutlineButton(
          child: Text("隐藏键盘"),
          color: Colors.teal,
          onPressed: () {
            fn1.unfocus();
            fn2.unfocus();
          },
        )
      ],
    );
  }
}
