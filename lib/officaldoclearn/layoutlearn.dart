import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LayoutWidgetLearn extends StatefulWidget {
  @override
  _LayoutWidgetLearnState createState() => _LayoutWidgetLearnState();
}

class _LayoutWidgetLearnState extends State<LayoutWidgetLearn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                height: 30,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.green,
                height: 30,
              ),
            )
          ],
        ),
        SizedBox(
          height: 100,
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.red,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
        Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center, //沿主轴方向居中
          children: <Widget>[
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('A')),
              label: new Text('Hamilton'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('M')),
              label: new Text('Lafayette'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('H')),
              label: new Text('Mulligan'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('J')),
              label: new Text('Laurens'),
            ),
          ],
        ),
        Flow(
          delegate: FlowLearnDelegate(margin: EdgeInsets.all(10.0)),
          children: <Widget>[
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.red,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.green,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.blue,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.yellow,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.brown,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.purple,
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.yellow,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                child:
                    Text("Hello world", style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              Positioned(
                left: 18.0,
                child: Text("I am Jack"),
              ),
              Positioned(
                top: 18.0,
                child: Text("Your friend"),
              )
            ],
          ),
        ),
        Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: Align(
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        Container(
          color: Colors.blue[50],
          child: Align(
            alignment: Alignment.topRight,
            widthFactor: 2,
            heightFactor: 2,
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        Container(
          color: Colors.blue[50],
          child: Align(
            alignment: Alignment(2, 0),
            widthFactor: 2,
            heightFactor: 2,
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: Align(
            alignment: FractionalOffset(0.2, 0.6),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        ConstrainedBox(
          child: Container(
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ),
            height: 5,
          ),
          constraints:
              BoxConstraints(minWidth: double.infinity, minHeight: 50.0),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 4)
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
              child: Text(
                "登录",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.black,
          margin: EdgeInsets.only(top: 100),
          child: Transform(
            transform: Matrix4.skewY(0.3),
            alignment: Alignment.topRight,
            child: Container(
              color: Colors.orange,
              child: Text("变换变换变换变换变换变换变换"),
              padding: EdgeInsets.all(8),
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          //默认原点为左上角，左移20像素，向上平移5像素
          child: Transform.translate(
            offset: Offset(-20.0, -5.0),
            child: Text("Hello world"),
          ),
        ),
        Container(
          width: double.infinity,
          height: 100,
          child: Center(
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                //旋转90度
                angle: math.pi / 2,
                child: Text("Hello world"),
              ),
            ),
          ),
        ),
        DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.scale(
                scale: 1.5, //放大到1.5倍
                child: Text("Hello world"))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.scale(scale: 1.5, child: Text("Hello world"))),
            Text(
              "你好",
              style: TextStyle(color: Colors.green, fontSize: 18.0),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              //将Transform.rotate换成RotatedBox
              child: RotatedBox(
                quarterTurns: 1, //旋转90度(1/4圈)
                child: Text("Hello world"),
              ),
            ),
            Text(
              "你好",
              style: TextStyle(color: Colors.green, fontSize: 18.0),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 50.0, left: 120.0,bottom: 100),
          //容器外填充
          constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
          //卡片大小
          decoration: BoxDecoration(
              //背景装饰
              gradient: RadialGradient(
                  //背景径向渐变
                  colors: [Colors.red, Colors.orange],
                  center: Alignment.topLeft,
                  radius: .98),
              boxShadow: [
                //卡片阴影
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ]),
          transform: Matrix4.rotationZ(.2),
          //卡片倾斜变换
          alignment: Alignment.center,
          //卡片内文字居中
          child: Text(
            //卡片文字
            "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
        ),

      ],
    );
  }
}

class FlowLearnDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  FlowLearnDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(double.infinity, 200.0);
  }
}
