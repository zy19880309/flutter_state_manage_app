import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EventLearn extends StatefulWidget {
  @override
  _EventLearnState createState() => _EventLearnState();
}

class _EventLearnState extends State<EventLearn> {
  PointerEvent _event;
  String _tag = "没有点击";

  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _taggle = false; //变色开关

  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Listener(
            child: Container(
              alignment: Alignment.center,
              width: 300,
              height: 150,
              child: Text(
                _event == null
                    ? ""
                    : "x=${_event.position.dx.toStringAsFixed(2)},"
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
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: 300,
              height: 150,
              color: Colors.yellow[500],
              child: Text(_tag),
            ),
            onTap: () => setState(() => _tag = "tap"),
            onDoubleTap: () => setState(() => _tag = "doubletap"),
            onLongPress: () => setState(() => _tag = "longtap"),
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.red,
                ),
                Positioned(
                  top: _top,
                  left: _left,
                  child: GestureDetector(
                    child: CircleAvatar(child: Text("A")),
                    //手指按下时会触发此回调
                    onPanDown: (DragDownDetails e) {
                      //打印手指按下的位置(相对于屏幕)
                      print("用户手指按下：${e.globalPosition}");
                    },
                    //手指滑动时会触发此回调
                    onPanUpdate: (DragUpdateDetails e) {
                      //用户手指滑动时，更新偏移，重新构建
                      setState(() {
                        _left += e.delta.dx;
                        _top += e.delta.dy;
                      });
                    },
                    onPanEnd: (DragEndDetails e) {
                      //打印滑动结束时在x、y轴上的速度
                      print(e.velocity);
                    },
                  ),
                )
              ],
            ),
          ),
          Center(
            child: GestureDetector(
              //指定宽度，高度自适应
              child: Image.asset("images/lake.jpg", width: _width),
              onScaleUpdate: (ScaleUpdateDetails details) {
                setState(() {
                  //缩放倍数在0.8到10倍之间
                  _width = 200 * details.scale.clamp(.8, 10.0);
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.lightGreenAccent[100],
            child: Text.rich(
              TextSpan(children: [
                TextSpan(text: "你好世界"),
                TextSpan(
                  text: "点我变色",
                  style: TextStyle(
                      color: _taggle ? Colors.red : Colors.blue, fontSize: 30),
                  recognizer: _tapGestureRecognizer
                    ..onTap = () {
                      setState(() {
                        _taggle = !_taggle;
                      });
                    },
                ),
                TextSpan(text: "你好世界"),
              ]),
            ),
          )
        ],
      ),
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
