import 'package:client/screens/todo_screen.dart';
import 'package:client/services/todo_service.dart';
import 'package:client/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/todo_provider.dart';

void main() {
  runApp(
    MaterialApp(
      theme: customTheme,
      home: ChangeNotifierProvider(
        create: (context) => TodoProvider(TodoService()),
        child: TodoScreen(),
      ),
    ),
  );
}
