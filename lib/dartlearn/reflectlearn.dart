void main() {
  createSymbol();
}

//构造方法学习
void constructorLearn(){
}

class A {
  int a;

  A(this.a) {
    print(a);
  }
}

//Symbol创建
void createSymbol() {
  Symbol("A") == #A; //方法、类、参数直接用名字
  Symbol("A.t") == #A.t; //命名构造方法也是直接用名字
//  Symbol("a=") == #a=; //属性set方法(私有属性即为#_a=)
  Symbol("a") == #a; //属性get方法
  Symbol("==") == #==; //操作符直接使用符号
  Symbol("") == Symbol.empty;
  print(Symbol("A") == #A);
}
