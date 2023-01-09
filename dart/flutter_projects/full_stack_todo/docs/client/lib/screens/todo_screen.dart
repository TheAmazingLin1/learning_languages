import 'package:client/screens/widgets/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _submitTodo(String todo) async {
    final res =
        await Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
    if (!res) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Add some text")));
      return;
    }
    setState(() => _controller.text = "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 600,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                key: const Key("todoField"),
                controller: _controller,
                onSubmitted: _submitTodo,
              ),
              const SizedBox(height: 10),
              const Expanded(child: TodoList()),
            ],
          ),
        ),
      ),
    );
  }
}
