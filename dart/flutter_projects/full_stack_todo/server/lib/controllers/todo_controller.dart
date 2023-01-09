import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../models/todo_model.dart';
import '../services/todo_service.dart';

class TodoController {
  final TodoService service;

  TodoController(this.service);

  Future<Response> addTodo(Request request) async {
    final res = await request.readAsString();
    final json = jsonDecode(res);
    service.addTodo(TodoModel.fromJson(json));
    return Response.ok("");
  }

  Future<Response> getTodos(Request request) async {
    final res = await service.getTodo();
    if (res == null) return Response.internalServerError();

    return Response.ok(jsonEncode({
      "todos": [for (final todo in res) todo.toJson()]
    }));
  }

  Future<Response> deleteTodo() async {
    return Response.forbidden("body");
  }

  Future<Response> toggleTodo(Request request) async {
    final requestRes = await request.readAsString();
    final json = jsonDecode(requestRes);
    final toggleRes = await service.toggleTodo(TodoModel.fromJson(json));
    if (!toggleRes) return Response.internalServerError();
    return Response.ok("");
  }
}
