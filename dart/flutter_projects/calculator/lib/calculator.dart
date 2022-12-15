import 'dart:ffi';

import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  String _current = "0";
  String _previous = "";
  String _operator = "";
  String get current => _current;

  clear() {
    _current = "";
    _previous = "";
    _operator = "";
    notifyListeners();
  }

  keyPress(String key) {
    try {
      int.parse(key);
      _current += key;
    } catch (e) {
      if (key == "=") {
        _current = _previous + _current;
        notifyListeners();
        return;
      }
      _previous = _current;
      _current = "";
      switch (key) {
        case "/":
          _operator = key;
          break;
        case "+":
          _operator = key;
          break;
        case "x":
          _operator = key;
          break;
        case "-":
          _operator = key;
          break;
      }
    }
    notifyListeners();
  }
}
