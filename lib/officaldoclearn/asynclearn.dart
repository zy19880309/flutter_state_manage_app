import 'package:flutter/material.dart';

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
}

class AsyncRoute extends StatefulWidget {
  @override
  _AsyncRouteState createState() => _AsyncRouteState();
}

class _AsyncRouteState extends State<AsyncRoute> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 200,
          child: Center(
            child: FutureBuilder<String>(
              future: mockNetworkData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    return Text("Contents: ${snapshot.data}");
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.yellow[200],
          child: StreamBuilder(
            stream: counter(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('没有Stream');
                case ConnectionState.waiting:
                  return Text('等待数据...');
                case ConnectionState.active:
                  return Text('active: ${snapshot.data}');
                case ConnectionState.done:
                  return Text('Stream已关闭');
              }
              return null; // unreachable
            },
          ),
        )
      ],
    );
  }
}

Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return i;
  });
}
