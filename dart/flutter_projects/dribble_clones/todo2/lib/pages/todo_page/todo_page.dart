import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/pages/todo_page/widgets/day_picker.dart';
import 'package:todo2/pages/todo_page/widgets/schedule_picker.dart';
import 'package:todo2/pages/todo_page/widgets/todo_list.dart';
import 'package:todo2/providers/todo_provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              SchedulePicker(),
              Divider(),
              SizedBox(height: 50),
              DayPicker(),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Add a task"),
                    prefixIcon: Icon(Icons.menu)),
              ),
              Expanded(child: TodoList()),
            ],
          ),
        ),
      ),
    );
  }
}
