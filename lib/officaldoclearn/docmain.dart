import 'dart:async';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:state_manage_app/officaldoclearn/functionlearn.dart';
import 'package:state_manage_app/officaldoclearn/scaffoldbottomlearn.dart';
import 'package:state_manage_app/officaldoclearn/scaffoldlearn.dart';
import 'package:state_manage_app/officaldoclearn/themelearn.dart';
import 'package:state_manage_app/officaldoclearn/wightlearn.dart';

class DocNavigator extends StatefulWidget {
  @override
  _DocNavigatorState createState() => _DocNavigatorState();
}

class _DocNavigatorState extends State<DocNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文档学习"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Builder(
              builder: (context) {
                Scaffold scaffold = context.ancestorWidgetOfExactType(Scaffold);
                return (scaffold.appBar as AppBar).title;
              },
            ),
          ),
          Center(
            child: Builder(builder: (context) {
              return RaisedButton(
                onPressed: () {
                  // 查找父级最近的Scaffold对应的ScaffoldState对象
                  ScaffoldState _state =
                      context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
                  //下面的静态方法也能获取到
                  _state = Scaffold.of(context);
                  //调用ScaffoldState的showSnackBar来弹出SnackBar
                  _state.showSnackBar(
                    SnackBar(
                      content: Text("我是SnackBar"),
                    ),
                  );
                },
                child: Text("显示SnackBar"),
              );
            }),
          ),
          RaisedButton(
            child: Text("控件属性学习"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyApp().getApp()));
            },
          ),
          RaisedButton(
            child: Text("scaffold学习"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ScaffoldApp().getApp()));
            },
          ),
          RaisedButton(
            child: Text("scaffold底部导航栏学习"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          BottomNaviApp().getApp()));
            },
          ),
          addButton("singlescroll", _getSingleScroll()),
          addButton("listview", _getListView()),
          addButton("无限listview", _get100ListView()),
          addButton("带标题listview", _getColumnList()),
          addButton("gridview", _getGridView()),
          addButton("gridview2", _getGridView2()),
          addButton("综合自定义", CustomScrollViewTestRoute()),
          addButton("滚动通知", ScrollNotificationTestRoute()),
          addButton("功能组件", WillPopScopeRoute()),
          addButton("主题学习", ThemeRoute()),
        ],
      ),
    );
  }

  GridView _getGridView() {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //横轴三个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widget
            ),
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast)
        ]);
  }

  GridView _getGridView2() {
    return GridView(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120.0, childAspectRatio: 2.0 //宽高比为2
          ),
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }

  RaisedButton addButton(String name, wight) {
    return RaisedButton(
      child: Text(name),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => getNewApp(wight)));
      },
    );
  }

  MaterialApp getNewApp(wight) {
    return MaterialApp(
      title: "scaffold学习",
      theme: ThemeData(
          primaryColor: Colors.blue,
          canvasColor: Colors.white,
          accentColor: Colors.pink,
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.grey),
              //定义label字体样式
              hintStyle:
                  TextStyle(color: Colors.grey, fontSize: 14.0) //定义提示文本样式
              )),
      home: Scaffold(
        appBar: AppBar(
          title: Text("标题"),
        ),
        body: wight,
      ),
    );
  }

  Scrollbar _getSingleScroll() {
    return Scrollbar(
      // 显示进度条
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            //动态创建一个List<Widget>
            children: "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                .split("")
                //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(
                      c,
                      textScaleFactor: 2.0,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  ListView _getListView() {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return ListView.separated(
      itemCount: 100,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }
}

InfiniteListView _get100ListView() {
  return InfiniteListView();
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const endTag = "##loading##";
  var _words = <String>[endTag];

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _receiveDate();
    _controller.addListener(() {
      print(_controller.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == endTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _receiveDate();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ));
          }
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.blue,
          height: 1,
        );
      },
      itemCount: _words.length,
      controller: _controller,
    );
  }

  void _receiveDate() {
    Future.delayed(Duration(seconds: 2)).then((str) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((str) => str.asPascalCase).toList());
      setState(() {});
    });
  }
}

Column _getColumnList() {
  return Column(children: <Widget>[
    ListTile(title: Text("商品列表")),
    Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        },
        itemCount: 20,
      ),
    ),
  ]);
}

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                "images/cake.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              //创建列表项
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            }, childCount: 50 //50个列表项
                ),
          ),
        ],
      ),
    );
  }
}

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() =>
      new _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      //进度条
      // 监听滚动通知
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          //return true; //放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("$index"));
                }),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
