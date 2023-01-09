import 'dart:convert';

import '../models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoService {
  String url = "http://localhost:8080/todos";
  Future<List<TodoModel>?> getTodos() async {
    final res = await http.get(Uri.parse(url));
    if (res.statusCode != 200) return null;

    final json = jsonDecode(res.body);

    return [for (final todo in json['todos']) TodoModel.fromJson(todo)];
  }

  Future<bool> addTodo(TodoModel model) async {
    final res =
        await http.post(Uri.parse(url), body: jsonEncode(model.toJson()));
    if (res.statusCode != 200) return false;
    return true;
  }

  Future<bool> deleteTodo(TodoModel model) async {
    final res =
        await http.delete(Uri.parse(url), body: jsonEncode(model.toJson()));
    if (res.statusCode != 200) return false;

    return true;
  }

  Future<bool> toggleTodo(TodoModel todo) async {
    final res = await http.patch(Uri.parse(url), body: todo.toJson());
    if (res.statusCode != 200) return false;
    return true;
  }
}
