import 'package:flutter/material.dart';

class DocNavigator extends StatelessWidget {
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
          RaisedButton(
            child: Text("按钮"),
            color: Colors.green,
            onPressed: () {
              print("点击");
            },
          )
        ],
      ),
    );
  }
}
