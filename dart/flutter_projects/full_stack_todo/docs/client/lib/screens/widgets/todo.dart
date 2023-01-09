import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/todo_model.dart';
import '../../providers/todo_provider.dart';

enum Menu { delete }

class Todo extends StatefulWidget {
  const Todo(this.todo, {super.key});
  final TodoModel todo;

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  void _menuSelected(Menu selection) async {
    switch (selection) {
      case Menu.delete:
        await Provider.of<TodoProvider>(context, listen: false)
            .deleteTodo(widget.todo);
        break;
    }
  }

  void _toggleTodo(bool? value) {
    print("here");
    Provider.of<TodoProvider>(context, listen: false).toggleTodo(widget.todo);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              key: Key("todoCheckbox"),
              value: widget.todo.isCompleted,
              onChanged: _toggleTodo,
            ),
            Text(widget.todo.title),
          ],
        ),
        PopupMenuButton<Menu>(
          key: const Key("menu"),
          onSelected: _menuSelected,
          itemBuilder: (context) {
            return <PopupMenuItem<Menu>>[
              const PopupMenuItem<Menu>(
                key: Key("deleteTodo"),
                value: Menu.delete,
                child: Text("Delete todo"),
              ),
            ];
          },
        )
      ],
    );
  }
}
