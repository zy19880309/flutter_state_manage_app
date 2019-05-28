import 'package:flutter/material.dart';

class IndicatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("加载"),
        ),
        body: new IndicatorAppPage(),
      ),
    );
  }
}

class IndicatorAppPage extends StatefulWidget {
  IndicatorAppPage({Key key}) : super(key: key);

  @override
  _IndicatorAppPageState createState() => new _IndicatorAppPageState();
}

class _IndicatorAppPageState extends State<IndicatorAppPage>
    with WidgetsBindingObserver {
  bool _show = false;

  getBody() {
    if (_show) {
      return getProgressDialog();
    } else {
      return getTextView();
    }
  }

  getProgressDialog() {
    return new Center(
        child: new LinearProgressIndicator(
      backgroundColor: Colors.amber,
      value: 0.5,
    ));
  }

  getTextView() {
    return new Center(
      child: new Text("加载完成"),
    );
  }

  AppLifecycleState _lastLifecycleState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    setState(() {
      _lastLifecycleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new RaisedButton(
          onPressed: () {
            setState(() {
              _show = true;
            });
          },
          child: new Text("显示加载框"),
        ),
        new RaisedButton(
          onPressed: () {
            setState(() {
              _show = false;
            });
          },
          child: new Text("隐藏加载框"),
        ),
        getBody(),
        getLifecycleText(),
      ],
    );
  }

  getLifecycleText() {
    if (_lastLifecycleState == null) return new Text('没有监听生命周期');
    return new Text('当前生命周期是: $_lastLifecycleState.');
  }
}
