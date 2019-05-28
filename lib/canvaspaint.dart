import 'package:flutter/material.dart';



class CanvasPaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "签名画布",
      home: new Scaffold(
        body: new _SignatureCanvas(),
      ),
    );
  }
}

class _SignatureCanvas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SignatureState();
  }
}

class _SignatureState extends State<_SignatureCanvas> {
  List<Offset> _points = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition =
              referenceBox.globalToLocal(details.globalPosition);
          _points = new List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: new CustomPaint(
        painter: new _SignaturePainter(_points),
      ),
    );
  }
}

class _SignaturePainter extends CustomPainter {
  final List<Offset> points;

  _SignaturePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      var x = points[i], y = points[i + 1];
      if (x != null && y != null) {
        canvas.drawLine(x, y, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_SignaturePainter other) {
    // TODO: implement shouldRepaint
    return other.points != points;
  }
}
