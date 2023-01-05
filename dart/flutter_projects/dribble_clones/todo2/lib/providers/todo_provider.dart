import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  var _todos = <TodoModel>[
    TodoModel("Do something", isCompleted: true),
    TodoModel("Anything"),
  ];

  List<TodoModel> get todos => _todos;

  void toggleTodo(TodoModel todo) {
    todo.isCompleted = !todo.isCompleted;
    notifyListeners();
  }
}
