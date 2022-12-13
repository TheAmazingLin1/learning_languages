import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class Todo {
  String title;
  bool isDone = false;

  Todo(this.title);
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final _controller = TextEditingController();
  final _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0))),
                              hintText: "Add todo"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder()),
                            ),
                            child: const Text("Submit"),
                            onPressed: () {
                              setState(() {
                                _todos.add(Todo(_controller.text));
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      for (final todo in _todos)
                        Row(
                          children: [
                            Checkbox(
                                value: todo.isDone,
                                onChanged: (value) {
                                  setState(() {
                                    todo.isDone = value ?? false;
                                  });
                                }),
                            Text("${todo.title}")
                          ],
                        )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
