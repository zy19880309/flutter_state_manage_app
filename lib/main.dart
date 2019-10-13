import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:state_manage_app/animlearn.dart';
import 'package:state_manage_app/canvaspaint.dart';
import 'package:state_manage_app/editlearn.dart';
import 'package:state_manage_app/fileoperate.dart';
import 'package:state_manage_app/gesturedetector.dart';
import 'package:state_manage_app/imagelearn.dart';
import 'package:state_manage_app/iohttplearn.dart';
import 'package:state_manage_app/isolatelearn.dart';
import 'package:state_manage_app/layoutdemo.dart';
import 'package:state_manage_app/layoutlearn.dart';
import 'package:state_manage_app/localelearn.dart';
import 'package:state_manage_app/networklearn.dart';
import 'package:state_manage_app/officaldoclearn/docmain.dart';
import 'package:state_manage_app/progressindicator.dart';
import 'package:state_manage_app/simplesample.dart';
import 'package:state_manage_app/statefulPage.dart';
import 'package:state_manage_app/tabpageview.dart';
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
      //路由表，可以打开相应页面
      "/rw": (BuildContext context) => new RandomWords(),
      "/safr": (BuildContext context) => new Scaffold(
            appBar: new AppBar(
              title: new Text("有互动的页面"),
            ),
            body: new Counter(
              text: "呵呵",
            ),
          ),
    },
    onGenerateRoute: (RouteSettings settings) {
      //路由生成器，功能和路由表相同，但是可以做一些判断，比如登录状态，相当于面向切面
      String name = settings.name;
      switch (name) {
        case "/netlearn":
          WidgetBuilder builder = (BuildContext context) => NetWorkPage();
          return MaterialPageRoute(builder: builder, settings: settings);
        case "/doc":
          WidgetBuilder builder = (BuildContext context) => DocNavigator();
          return MaterialPageRoute(builder: builder, settings: settings);
        default:
          return null;
      }
    },
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new ListView(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/doc");
          },
          child: new Text("跳转到官网文档学习页"),
        ),
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
                        theme: ThemeData.light(),
                        home: new Scaffold(
                          body: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(20),
                              ),
                              Container(
                                width: 200,
                                height: 20,
                                decoration: new BoxDecoration(
                                    border: new Border.all(
                                        color: Color(0xFFFF0000), width: 0.5),
                                    color: Color(0xFF9E9E9E),
                                    borderRadius: new BorderRadius.vertical(
                                        top: Radius.elliptical(5, 10))),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                              ),
                              Container(
                                width: 200,
                                height: 40,
                                decoration: new BoxDecoration(
                                    border: new Border.all(
                                        color: Color(0xFFFF0000), width: 0.5),
// 生成俩层阴影，一层绿，一层黄， 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0x99FFFF00),
                                          offset: Offset(5.0, 5.0),
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0),
                                      BoxShadow(
                                          color: Color(0x9900FF00),
                                          offset: Offset(1.0, 1.0)),
                                      BoxShadow(color: Color(0xFF0000FF))
                                    ]),
                              ),
                            ],
                          ),
                        ))));
          },
          child: new Text("背景装饰学习"),
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
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) =>
                          FadeTransition(
                    opacity: animation,
                    child: RotationTransition(
                      child: child,
                      turns: Tween<double>(begin: 0.0, end: 1.0)
                          .animate(animation),
                    ),
                  ),
                  pageBuilder: (context, _, __) => new ShoppingList(
                    products: [
                      new Product(name: 'Eggs'),
                      new Product(name: 'Flour'),
                      new Product(name: 'Chocolate chips'),
                    ],
                  ),
                ));
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
                .pushNamed("/safr", arguments: "arg哎呦") as Map<String, String>;
            print(result["result"]);
          },
          child: new Text("带参数过去获取结果startActivityForResult"),
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
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new EditTextLearn()));
          },
          child: new Text("et验证"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new ImageCombineWidgets()));
          },
          child: new Text("综合布局"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new LayoutDemo()));
          },
          child: new Text("布局例子"),
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => MaterialApp(
                          title: "tab学习",
                          home: TabDemoPage(),
                        )));
          },
          child: new Text("tab例子"),
        ),
        new Center(
          child: new Text("hello flutter"),
        ),
      ],
    );
  }
}
