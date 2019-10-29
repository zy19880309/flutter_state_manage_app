import 'package:flutter/material.dart';

class NotificationLearn extends StatefulWidget {
  @override
  _NotificationLearnState createState() => _NotificationLearnState();
}

class _NotificationLearnState extends State<NotificationLearn> {
  String msg = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 300,
          child: NotificationListener(
            onNotification: (notification) {
              switch (notification.runtimeType) {
                case ScrollStartNotification:
                  print("开始滚动");
                  break;
                case ScrollUpdateNotification:
                  print("正在滚动");
                  break;
                case ScrollEndNotification:
                  print("滚动停止");
                  break;
                case OverscrollNotification:
                  print("滚动到边界");
                  break;
              }
              return false; //false不拦截，true拦截
            },
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index"),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}

class NotificationRoute extends StatefulWidget {
  @override
  _NotificationRouteState createState() => _NotificationRouteState();
}

class _NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + "  ";
        });
        return true;
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              //代码中注释的部分是不能正常工作的，因为这个context是根Context，
              // 而NotificationListener是监听的子树，所以我们通过Builder来构建RaisedButton，来获得按钮位置的context
              onPressed: () => MyNotification("Hi").dispatch(context),
              child: Text("Send Notification"),
            ),
            Builder(
              builder: (context) {
                return RaisedButton(
                  //按钮点击时分发通知
                  onPressed: () => MyNotification("Hi").dispatch(context),
                  child: Text("Send Notification"),
                );
              },
            ),
            Text(_msg)
          ],
        ),
      ),
    );
  }
}
