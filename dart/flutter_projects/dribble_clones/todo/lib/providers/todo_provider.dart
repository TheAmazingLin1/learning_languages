import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  var _todos = <Todo>[];

  List<Todo> get todos => _todos;

  addTodo(String text) {}

  completeTodo(Todo todo) async {
    FirebaseFirestore.instance.collection("todos").doc(todo.id).update({
      "is_completed": true,
    });
    getAllTodos();
  }

  getAllTodos() async {
    final res = await FirebaseFirestore.instance.collection("todos").get();
    _todos = [];
    for (final doc in res.docs) {
      _todos.add(Todo.fromJson(doc.id, doc.data()));
    }
    notifyListeners();
  }
}
