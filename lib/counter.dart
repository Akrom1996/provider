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
