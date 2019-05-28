import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetWorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "网络请求",
      theme: new ThemeData(primarySwatch: Colors.lightGreen),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("网络请求页"),
        ),
        body: new _HttpList(),
      ),
    );
  }
}

class _HttpList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HttpState();
  }
}

class _HttpState extends State<_HttpList> {
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
      itemBuilder: (BuildContext context, int position) => _getRow(position),
      itemCount: widgets.length,
    );
  }

  void _loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
//      widgets = JSON.decode(response.body);
      widgets = jsonDecode(response.body);
    });
  }

  _getRow(int position) {
    return new Padding(
      padding: new EdgeInsets.all(10.0),
      child: new Text("Row ${widgets[position]["title"]}"),
    );
  }
}
