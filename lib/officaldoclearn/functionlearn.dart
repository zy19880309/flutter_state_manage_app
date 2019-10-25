import 'package:flutter/material.dart';
import 'package:state_manage_app/officaldoclearn/bean.dart';
import 'package:state_manage_app/officaldoclearn/providersystemdemo.dart';

class WillPopScopeRoute extends StatefulWidget {
  @override
  _WillPopScopeRouteState createState() => _WillPopScopeRouteState();
}

class _WillPopScopeRouteState extends State<WillPopScopeRoute> {
  DateTime _lastTime;

  @override
  Widget build(BuildContext context) {
    //这里没有，只在首页有用
    return WillPopScope(
      child: ProviderRoute(),
      onWillPop: () async {
        print('will');
        if (_lastTime == null ||
            DateTime.now().difference(_lastTime) > Duration(seconds: 1)) {
          _lastTime = DateTime.now();
          return false;
        }
        return true;
      },
    );
  }
}

//共享数据的例子
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  final int data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    context.ancestorInheritedElementForWidgetOfExactType(
        ShareDataWidget); //这个方法返回的控件不会通知更新，因为没有注册子控件
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => new __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}

class InheritedWidgetRoute extends StatefulWidget {
  @override
  _InheritedWidgetRouteState createState() => new _InheritedWidgetRouteState();
}

class _InheritedWidgetRouteState extends State<InheritedWidgetRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        //使用ShareDataWidget
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: _TestWidget(), //子widget中依赖ShareDataWidget
            ),
            RaisedButton(
              child: Text("Increment"),
              //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
              onPressed: () => setState(() => ++count),
            )
          ],
        ),
      ),
    );
  }
}
//共享数据的例子

//购物车的例子
class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              /*Builder(builder: (context) {
                var cart = ChangeNotifierProvider.of<CartModel>(context);
                return Text("总价: ${cart.totalPrice}");
              }),*/
              Consumer<CartModel>(
                  builder: (context, cart) => Text("总价: ${cart.totalPrice}")),
              Builder(builder: (context) {
                print("RaisedButton build"); //在后面优化部分会用到
                return RaisedButton(
                  child: Text("添加商品"),
                  onPressed: () {
                    //给购物车中添加商品，添加后总价会更新
                    ChangeNotifierProvider.of<CartModel>(context, listen: false)
                        .add(Item(20.0, 1));
                  },
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}
//购物车的例子
