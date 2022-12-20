import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/providers/todo_provider.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget(this.todo, {super.key});
  final Todo todo;

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    final todo = widget.todo;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${todo.text}",
          style: TextStyle(
            fontSize: 20,
            color: todo.isCompleted ? Colors.grey : Colors.black,
          ),
        ),
        Checkbox(
          value: todo.isCompleted,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (val) {
            Provider.of<TodoProvider>(context, listen: false)
                .completeTodo(todo);
          },
        ),
      ],
    );
  }
}
