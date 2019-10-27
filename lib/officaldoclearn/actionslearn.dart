import 'package:flutter/material.dart';

class EventLearn extends StatefulWidget {
  @override
  _EventLearnState createState() => _EventLearnState();
}

class _EventLearnState extends State<EventLearn> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 150,
        child: Text(
          "x=${_event.localPosition.dx.toStringAsFixed(2)},"
          "y=${_event.position.dy.toStringAsFixed(2)},"
          "delt=${_event.delta.distance},"
          "presure=${_event.pressure},"
          "oritention=${_event.orientation}",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.blue[500],
      ),
      onPointerDown: (event) => setState(() => _event = event),
      onPointerUp: (event) => setState(() => _event = event),
      onPointerMove: (event) => setState(() => _event = event),
    );
  }
}

/*
* behavior属性:
* deferToChild：子组件会一个接一个的进行命中测试，如果子组件中有测试通过的，则当前组件通过，这就意味着，如果指针事件作用于子组件上时，其父级组件也肯定可以收到该事件
* opaque：在命中测试时，将当前组件当成不透明处理(即使本身是透明的)，最终的效果相当于当前Widget的整个区域都是点击区域
* translucent：当点击组件透明区域时，可以对自身边界内及底部可视区域都进行命中测试，这意味着点击顶部组件透明区域时，顶部组件和底部组件都可以接收到事件
*
*
* 忽略PointerEvent
* AbsorbPointer本身会参与命中测试
* IgnorePointer本身不会参与
* */
