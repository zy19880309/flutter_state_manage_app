import 'package:flutter/material.dart';
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
                      builder: (BuildContext context) => Scaffold(
                            body: WightLearn(),
                          )));
            },
          ),
        ],
      ),
    );
    ;
  }
}
