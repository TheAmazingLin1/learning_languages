import 'package:flutter/material.dart';

class Todo {
  String text;
  bool isDone = false;

  Todo(this.text);
}

class TodoProvider extends ChangeNotifier {
  final _todos = <Todo>[];

  List<Todo> get todos => _todos;

  int todosLeft() {
    int sum = 0;
    for (final todo in _todos) {
      if (!todo.isDone) sum += 1;
    }
    return sum;
  }

  toggleTodo(Todo todo, bool value) {
    todo.isDone = value;
    notifyListeners();
  }

  addTodo(String text) {
    _todos.add(Todo(text));
    notifyListeners();
  }

  removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
