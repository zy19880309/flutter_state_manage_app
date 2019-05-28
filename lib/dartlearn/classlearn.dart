import 'dart:math';

import 'package:state_manage_app/dartlearn/logger.dart';


main() {
  var point = new Point(3, 4);
  print(point.distanceFromOrigin);

  var employee = new Employee.fromJson({});

  print(employee.canPlayPiano);

  var orgin = ImmutablePoint.orgin;
  var point1 = new ImmutablePoint(2, 3);
  print(orgin.y);

  var logger = new Logger("log");

  logger.log("工厂方法");

  var rect = new Rectangle(3, 4, 20, 15);
  print(rect.right);
  rect.bottom = 30;
  print(rect.top);

  var v1 = new Vector(5, 6);
  var v2 = new Vector(2, 3);
  var dv = v1 - v2;
  print(dv.x);

  print(checkVersion().toString());
  var wf = new WannabeFunction();
  var str = wf("how","are","you");
  print(str);
}

class WannabeFunction {
  call(String a, String b, String c) => '$a $b $c!';
}

checkVersion() async {
  var version = await getVersion();
  print(version);
  return "异步调用了";
}

getVersion() {
  var future = new Future.delayed(const Duration(seconds: 5), () => "1.0.0");
  return future;
}

class Point {
  final num x;
  final num y;
  final num distanceFromOrigin;

  Point(x, y)
      : this.x = x,
        this.y = y,
        distanceFromOrigin = sqrt(x * x + y * y);

  Point.init(this.x, this.y, this.distanceFromOrigin);

  Point.zhuanxiang(x, y) : this.init(x, y, sqrt(x * x + y * y));

  distanceTo(Point other) {
    num dx = other.x - x;
    num dy = other.y - y;
    return sqrt(dx * dx + dy * dy);
  }
}

class ImmutablePoint {
  final num x;
  final num y;

  const ImmutablePoint(this.x, this.y);

  static final ImmutablePoint orgin = new ImmutablePoint(0, 0);
}

class Person {
  String firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person with Musical {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
    this.canPlayPiano = false;
  }
}

abstract class Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

class Rectangle {
  num left;
  num top;
  num width;
  num height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  num get right => left + width;

  set right(num value) => left = value - width;

  num get bottom => top + height;

  set bottom(num value) => top = value - height;
}

class Vector {
  final num x;
  final num y;

  const Vector(this.x, this.y);

  operator +(Vector v) {
    return Vector(x + v.x, y + v.y);
  }

  operator -(Vector v) {
    return Vector(x - v.x, y - v.y);
  }
}

abstract class AbstractContainer {
  // ...Define constructors, fields, methods...

  void updateChildren(); // Abstract method.
}

class SpecializedContainer extends AbstractContainer {
  // ...Define more constructors, fields, methods...

  void updateChildren() {
    // ...Implement updateChildren()...
  }

// Abstract method causes a warning but
// doesn't prevent instantiation.
//  void doSomething();
}

// A person. The implicit interface contains greet().
class Person1 {
  // In the interface, but visible only in this library.
  final _name;

  // Not in the interface, since this is a constructor.
  Person1(this._name);

  // In the interface.
  String greet(who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Imposter implements Person1 {
  // We have to define this, but we don't use it.
  final _name = "";

  String greet(who) => 'Hi $who. Do you know who I am?';
}

class Imposter2 implements Person1 {
  @override
  // TODO: implement _name
  final _name = "";

  @override
  String greet(who) {
    // TODO: implement greet
    return 'Hi $who. Do you know who I am?';
  }
}
