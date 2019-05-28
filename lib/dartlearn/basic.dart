void main(List<String> args) {
  print(args);
  var x = 1;
  var hex = 0xFF;
//  var bigInt = 34653465834652437659238476592374958739845729;
  var one = int.parse("1");
  print(one == 1);
  var pi = 3.1415926.toStringAsFixed(2);
  print(pi == "3.14");
  var s = r"this is raw \n buhuanhang ";
  var s2 = "this is \n huanhang ";
  print(s);
  print(s2);

  // These work in a const string.
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

// These do NOT work in a const string.
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = const [1, 2, 3];

  const validConstString = '$aConstNum $aConstBool $aConstString';
//  const invalidConstString = '$aNum $aBool $aString $aConstList';
  // Check for an empty string.
  var fullName = '';
  print(fullName.isEmpty);

// Check for zero.
  var hitPoints = 0;
  print(hitPoints <= 0);

// Check for null.
  var unicorn;
  print(unicorn == null);

// Check for NaN.
  var iMeantToDoThis = 0 / 0;
  print(iMeantToDoThis.isNaN);

  var constantList = const [1, 2, 3];
//  constantList[1] = 1; // Uncommenting this causes an error.
//  constantList.add(4);

  var clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));

  var c = #radic;
  print(c);

  enableFlags();
  enableFlags2(true, true);
  doStuff(list: [5, 9, 9, 6]);

  printElement(element) {
    print(element);
  }

  [1, 2, 3, 4, 5].forEach(printElement);

  var fname = ({String msg = "火影"}) => "hello,$msg";
  print(fname);

  fun1([String msg = "火影"]) {
    return "hello,$msg";
  }

  var fname1 = fun1();
  print(fname1);

  fun2({String msg = "火影"}) => "hello,$msg";
  var fname2 = fun2();
  print(fname2);

  var fruits = ["苹果", "香蕉", "梨", "桃"];
  fruits.forEach((i) => print(fruits.indexOf(i).toString() + i));
  var add2 = makeAdder(2);
  var add4 = makeAdder(4);
  print(add2(2));
  print(add4);
  print("hello".substring(1)
    ..replaceAll(new RegExp("l"), "t")
    ..toUpperCase());

  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }
  callbacks.forEach((e) => e());
  for (var value in callbacks) {
    value();
  }


}

Function makeAdder(num addBy) {
  return (num i) => addBy + i; //返回一个方法
}

enableFlags({bool bold, bool hidden}) {
  print(hidden);
}

enableFlags2(bool bold, bool hide, [String name = "haah"]) {
  print(name);
}

void doStuff(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    }}) {
  print('list:  $list');
  print('gifts: $gifts');
}
