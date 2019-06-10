import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:state_manage_app/animlearn.dart';
import 'package:state_manage_app/canvaspaint.dart';
import 'package:state_manage_app/fileoperate.dart';
import 'package:state_manage_app/gesturedetector.dart';
import 'package:state_manage_app/iohttplearn.dart';
import 'package:state_manage_app/isolatelearn.dart';
import 'package:state_manage_app/layoutlearn.dart';
import 'package:state_manage_app/localelearn.dart';
import 'package:state_manage_app/networklearn.dart';
import 'package:state_manage_app/progressindicator.dart';
import 'package:state_manage_app/simplesample.dart';
import 'package:state_manage_app/statefulPage.dart';
import 'package:state_manage_app/widgetlearn.dart';
import 'package:state_manage_app/wightcontrol.dart';

void main() {
  runApp(new MaterialApp(
    title: "开始学习flutter",
    theme: new ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlueAccent,
      accentColor: Colors.yellow[300],
      canvasColor: Colors.pink[400],
    ),
    home: new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.menu), tooltip: "菜单", onPressed: null),
        title: new Text("第一页"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search), tooltip: "搜索", onPressed: null)
        ],
      ),
      body: new FirstPage(),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: "增加",
        child: new Icon(Icons.add),
      ),
    ),
    routes: <String, WidgetBuilder>{
      "/rw": (BuildContext context) => new RandomWords(),
      "/safr": (BuildContext context) => new Scaffold(
            appBar: new AppBar(
              title: new Text("有互动的页面"),
            ),
            body: new Counter(),
          ),
      "/netlearn": (BuildContext context) => new NetWorkPage(),
    },
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: <Widget>[
        new RaisedButton(
          onPressed: () {
            /*Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new RandomWords()));*/
            Navigator.of(context).pushNamed("/rw");
          },
          child: new Text("跳转到有状态的页面"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new Center(
                          child: new Text(
                            "hello flutter",
                            textDirection: TextDirection.ltr,
                          ),
                        )));
          },
          child: new Text("跳转到Hello页面"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new MaterialApp(
                          title: "自定义的",
                          home: new MyScaffold(),
                        )));
          },
          child: new Text("自定义的标题和框架"),
        ),
        new MyButton(),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new Scaffold(
                          appBar: new AppBar(
                            title: new Text("有互动的页面"),
                          ),
                          body: new Counter(),
                        )));
          },
          child: new Text("互动有状态的页面"),
        ),
        new RaisedButton(
          //需要认真看的案例==============================================================================
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new ShoppingList(
                          products: [
                            new Product(name: 'Eggs'),
                            new Product(name: 'Flour'),
                            new Product(name: 'Chocolate chips'),
                          ],
                        )));
          },
          child: new Text("综合案例"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new MaterialApp(
                          title: "控制控件",
                          theme: new ThemeData(primarySwatch: Colors.blue),
                          home: new Controller(),
                        )));
          },
          child: new Text("动态变化views，添加\n和删除wight的例子"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new FadeAnimPage()));
          },
          child: new Text("淡入淡出动画"),
        ),
        new RaisedButton(
          onPressed: () {
            //有点儿问题==============================================================================================
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new CanvasPaint()));
          },
          child: new Text("画布画笔的例子"),
        ),
        new RaisedButton(
          onPressed: () async {
            Map<String, String> result = await Navigator.of(context)
                .pushNamed("/safr") as Map<String, String>;
            print(result["result"]);
          },
          child: new Text("获取结果startActivityForResult"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/netlearn");
          },
          child: new Text("网络请求例子"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new IsolateApp()));
          },
          child: new Text("isolate"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new IndicatorApp()));
          },
          child: new Text("加载进度圈"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new IndicatorApp()));
          },
          child: new Text("生命周期"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new GestureDetectorLearn()));
          },
          child: new Text("手势例子"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new HttpClientApp()));
          },
          child: new Text("io网络请求例子"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new MaterialApp(
                          title: "控制控件",
                          theme: new ThemeData(primarySwatch: Colors.blue),
                          home: new FilePage(),
                        )));
          },
          child: new Text("文件读写"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new MaterialApp(
                          onGenerateTitle: (context) {
                            return DemoLocalizations.of(context).taskTitle;
                          },
                          theme: new ThemeData(primarySwatch: Colors.blue),
                          home: new LocaleLearn(),
                          localizationsDelegates: [
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            DemoLocalizationsDelegate.delegate,
                          ],
                          supportedLocales: [
                            const Locale('en', 'US'), // English
                            const Locale('zh', 'CN'), // 中文
                          ],
                        )));
          },
          child: new Text("国际化"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new MaterialApp(
                          title: 'State Demo',
                          theme: new ThemeData(
                            primarySwatch: Colors.blue,
                          ),
                          home: new Scaffold(
                            appBar: new AppBar(
                              title: new Text("状态"),
                            ),
                            body: new Parent2Widget(),
                          ),
                        )));
          },
          child: new Text("状态块"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new LayoutsLearn()));
          },
          child: new Text("布局"),
        ),
        new Center(
          child: new Text("hello flutter"),
        ),
      ],
    );
  }
}
