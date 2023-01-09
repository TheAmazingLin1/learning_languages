import 'package:flutter/material.dart';

import '../models/todo_model.dart';
import '../services/todo_service.dart';

class TodoProvider extends ChangeNotifier {
  var _todos = <TodoModel>[];

  List<TodoModel> get todos => _todos;

  final TodoService _todoService;

  TodoProvider(this._todoService);

  Future<bool> addTodo(String title) async {
    if (title == "") return false;
    final todo = TodoModel(title);
    final res = await _todoService.addTodo(todo);
    if (!res) return false;

    _todos.add(todo);
    notifyListeners();
    return true;
  }

  Future<bool> deleteTodo(TodoModel todo) async {
    final res = await _todoService.deleteTodo(todo);
    if (!res) return false;

    _todos = _todos.where((element) => element.id != todo.id).toList();
    notifyListeners();
    return true;
  }

  Future<bool> toggleTodo(TodoModel todo) async {
    final res = await _todoService.toggleTodo(todo);
    if (!res) return false;

    todo.isCompleted = !todo.isCompleted;
    notifyListeners();

    return true;
  }
}
