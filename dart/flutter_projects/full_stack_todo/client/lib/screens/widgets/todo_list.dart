import 'package:client/screens/widgets/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/todo_provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, provider, child) {
      final todos = provider.todos;
      return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Todo(todos[index]);
        },
      );
    });
  }
}
