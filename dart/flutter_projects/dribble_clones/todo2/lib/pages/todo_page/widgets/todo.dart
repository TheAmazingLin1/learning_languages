import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/providers/todo_provider.dart';
import 'package:todo2/theme.dart';

import '../../../models/todo_model.dart';

class Todo extends StatelessWidget {
  const Todo(this.todo, {super.key});
  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: todo.isCompleted,
          onChanged: (val) {
            Provider.of<TodoProvider>(context, listen: false).toggleTodo(todo);
          },
        ),
        Text(todo.title),
      ],
    );
  }
}
