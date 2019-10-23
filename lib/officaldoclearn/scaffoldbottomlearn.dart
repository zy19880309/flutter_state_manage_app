import 'package:flutter/material.dart';

class BottomNaviApp {
  MaterialApp getApp() {
    return MaterialApp(
      title: "scaffold学习",
      theme: ThemeData(
          primaryColor: Colors.blue,
          canvasColor: Colors.white,
          accentColor: Colors.pink,
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
              hintStyle:
                  TextStyle(color: Colors.grey, fontSize: 14.0) //定义提示文本样式
              )),
      home: ScaffoldRoute(),
    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("App Name"),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      //抽屉
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home)),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.business)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
        color: Colors.white,
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: Text("打动学习"),
      ),
    );
  }
}
