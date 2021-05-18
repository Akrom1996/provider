import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  int counter = 0;
  // Counter(this.counter);
  // int get getCounter => counter;
  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    notifyListeners();
  }
}

class User extends ChangeNotifier {
  String name = "";
  int age;
  // User(this.name, this.age);
  void set setName(String newname) {
    name = newname;
  }

  set setAge(int newage) {
    age = newage;
  }

  List<Map<String, dynamic>> users = [];

  setUsers() {
    users.add({"name": name, "age": age});
    print(users);
    notifyListeners();
  }

  removeLast() {
    users.removeLast();
    notifyListeners();
  }

  removeAll() {
    users.removeRange(0, users.length);
  }
}
