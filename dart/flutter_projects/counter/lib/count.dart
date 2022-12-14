import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  var _count = 0;

  int get count => _count;

  increment() {
    _count++;
    notifyListeners();
  }

  decrement() {
    if (_count == 0) return;
    _count--;
    notifyListeners();
  }
}
