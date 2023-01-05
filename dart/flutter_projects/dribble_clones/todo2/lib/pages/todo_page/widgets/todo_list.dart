import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/pages/todo_page/widgets/todo.dart';
import 'package:todo2/providers/todo_provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, provider, child) {
        final todos = provider.todos;
        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Todo(todos[index]);
          },
        );
      },
    );
  }
}
