import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/todo.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => TodoProvider()),
        )
      ],
      child: MaterialApp(home: App()),
    ),
  );
}

enum Toggle { all, active, completed }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _controller = TextEditingController();
  var toggle = Toggle.all;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  ButtonStyle buttonStyle({bool inactive = false}) {
    return ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
            inactive ? Colors.black.withOpacity(0.5) : Colors.black),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder()));
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todos = Provider.of<TodoProvider>(context).todos;
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          height: 400,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Container(
                          child: ElevatedButton(
                            style: buttonStyle(),
                            onPressed: () {
                              provider.addTodo(_controller.text);
                            },
                            child: Text("Submit"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.only(top: 5),
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: ((context, index) {
                        if (toggle == Toggle.all) {
                          return Column(
                            children: [
                              TodoRow(todos[index]),
                              Divider(),
                            ],
                          );
                        } else if (toggle == Toggle.completed) {
                          return todos[index].isDone == true
                              ? Column(
                                  children: [
                                    TodoRow(todos[index]),
                                    Divider(),
                                  ],
                                )
                              : Container();
                        } else {
                          return todos[index].isDone == false
                              ? Column(
                                  children: [
                                    TodoRow(todos[index]),
                                    Divider(),
                                  ],
                                )
                              : Container();
                        }
                      }),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${provider.todosLeft()} items left",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                toggle = Toggle.all;
                              });
                            },
                            child: Text("All"),
                            style: buttonStyle(
                              inactive: toggle != Toggle.all,
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                toggle = Toggle.active;
                              });
                            },
                            child: Text("Active"),
                            style: buttonStyle(
                              inactive: toggle != Toggle.active,
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                toggle = Toggle.completed;
                              });
                            },
                            child: Text("Completed"),
                            style: buttonStyle(
                              inactive: toggle != Toggle.completed,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodoRow extends StatelessWidget {
  const TodoRow(this.todo, {super.key});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    return Row(
      children: [
        Checkbox(
          value: todo.isDone,
          onChanged: (value) => provider.toggleTodo(todo, value!),
          fillColor: MaterialStatePropertyAll(Colors.black),
        ),
        Text("${todo.text}"),
      ],
    );
  }
}
