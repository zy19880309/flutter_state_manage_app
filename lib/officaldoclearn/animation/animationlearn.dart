import 'package:flutter/material.dart';

class AnimationLearn extends StatefulWidget {
  @override
  _AnimationLearnState createState() => new _AnimationLearnState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _AnimationLearnState extends State<AnimationLearn>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    //图片宽高从0变到300
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(
      animation,
    )..addListener(() {
        setState(() => {});
      });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Center(
            child: Image.asset("images/avatars.png",
                width: animation.value, height: animation.value),
          ),
          AnimatedImage(
            animation: animation,
          ),
          AnimatedBuilder(
            animation: animation,
            child: Image.asset("images/avatars.png"),
            builder: (context, child) {
              return Container(
                width: animation.value,
                height: animation.value,
                child: child,
              );
            },
          ),
          GrowTransition(
            animation: animation,
            child: Image.asset("images/avatars.png"),
          )
        ],
      ),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
        "images/avatars.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value, width: animation.value, child: child);
          },
          child: child),
    );
  }
}
