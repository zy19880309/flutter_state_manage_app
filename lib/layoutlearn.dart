import 'package:flutter/material.dart';

class LayoutsLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "布局和wrap，match",
      theme: new ThemeData(primarySwatch: Colors.lightGreen),
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("布局和wrap，match"),
          ),
          body: getColumn()),
    );
  }

  getColumn(){
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text('Column One'),
        new Text('Column Two'),
        new Text('Column Three'),
        new Text('Column Four'),
      ],
    );
  }

  getRow() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text('Row One'),
        new Text('Row Two'),
        new Text('Row Three'),
        new Text('Row Four'),
      ],
    );
  }

  getMatch() {
    return new Container(
      color: Colors.yellowAccent,
      child: new Row(
        //Column
//            mainAxisSize: MainAxisSize.min,//wrap_content ,不加的话默认为match_parent（MainAxisSize.max）
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //start==left,center==center,end==right ,
        // spaceEvenly==等比例居中，4个间距一样大（weight=1),spaceAround=等比例居中，6个间距一样大,spaceBetween=中间居中，两边顶边
        children: [
          new Expanded(
            child: new Container(
              child: new Icon(
                Icons.access_time,
                size: 50.0,
              ),
              color: Colors.red,
            ),
            flex: 2, //flex == android:layout_weight
          ),
          new Expanded(
            child: new Container(
              child: new Icon(
                Icons.pie_chart,
                size: 100.0,
              ),
              color: Colors.blue,
            ),
            flex: 4,
          ),
          new Expanded(
            child: new Container(
              child: new Icon(
                Icons.email,
                size: 50.0,
              ),
              color: Colors.green,
            ),
            flex: 6,
          ),
        ],
      ),
    );
  }
}
