import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditTextLearn extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  String _errorText;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new TextField(
              onSubmitted: (String text) {
                setState(() {
                  if (!isEmail(text)) {
                    _errorText = 'Error: This is not an email';
                  } else {
                    _errorText = null;
                  }
                });
              },
              decoration: new InputDecoration(
                  hintText: "This is a hint", errorText: _getErrorText()),
            ),
            new RaisedButton(
              onPressed: _save,
              child: new Text("存储"),
            ),
            new RaisedButton(
              onPressed: _get,
              child: new Text("获取"),
            ),
          ],
        ),
      ),
    );
  }

  _getErrorText() {
    return _errorText;
  }

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(emailRegexp);

    return regExp.hasMatch(em);
  }

  _save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', 105);
  }

  _get() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int num = preferences.getInt('counter');
    print("存储了$num");
  }
}
