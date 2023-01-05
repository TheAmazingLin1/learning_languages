import 'package:flutter/material.dart';

class TodoModel {
  TodoModel(this.title, {this.isCompleted = false}) {
    this.id = UniqueKey().toString();
  }

  late String id;
  String title;
  bool isCompleted;
  bool isPinned = false;
}
