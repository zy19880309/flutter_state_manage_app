import 'package:flutter/material.dart';
import 'package:state_manage_app/officaldoclearn/eventbuscustom/eventbuslearn.dart';

class EventRegister extends StatefulWidget {
  @override
  _EventRegisterState createState() => _EventRegisterState();
}

class _EventRegisterState extends State<EventRegister> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OutlineButton.icon(
          onPressed: () {
            bus.on("login", (arg) {
              print("登录$arg");
            });
          },
          icon: Icon(
            Icons.add_box,
            color: Colors.green,
          ),
          label: Text("注册"),
          splashColor: Colors.red,
          disabledBorderColor: Colors.green,
        ),
        OutlineButton.icon(
          onPressed: () {
            bus.off("login");
          },
          icon: Icon(
            Icons.delete,
            color: Colors.orange,
          ),
          label: Text("注销"),
        ),
        OutlineButton.icon(
          onPressed: () {
            bus.emit("login", "登录成功");
          },
          icon: Icon(
            Icons.near_me,
            color: Colors.teal,
          ),
          label: Text("跳页"),
        ),
      ],
    );
  }
}
