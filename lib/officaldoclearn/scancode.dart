import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanLearn extends StatefulWidget {
  @override
  _ScanLearnState createState() => _ScanLearnState();
}

class _ScanLearnState extends State<ScanLearn> {
  TextEditingController _outputController;

  @override
  initState() {
    super.initState();
    this._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Builder(
          builder: (BuildContext context) {
            return ListView(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: this._outputController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.wrap_text),
                          helperText:
                              'The barcode or qrcode you scan will be displayed in this area.',
                          hintText:
                              'The barcode or qrcode you scan will be displayed in this area.',
                          hintStyle: TextStyle(fontSize: 15),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                        ),
                      ),
                      SizedBox(height: 20),
                      FlatButton(
                        onPressed: _scan,
                        child: Column(
                          children: <Widget>[
                            Image.asset("images/scanner.png"),
                            Text("扫描二维码")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      this._outputController.text = barcode;
    }
  }
}
