import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/pages/widgets/todo_list.dart';
import 'package:todo/pages/top_row.dart';
import 'package:todo/providers/todo_provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Container(
            width: 500,
            child: Column(
              children: [
                TopRow(),
                SizedBox(height: 40),
                Expanded(
                  child: TodoList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
