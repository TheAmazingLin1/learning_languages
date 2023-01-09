import 'dart:math';

import 'package:client/models/todo_model.dart';
import 'package:client/providers/todo_provider.dart';
import 'package:client/services/todo_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_provider_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoService>()])
void main() {
  late TodoProvider provider;
  late MockTodoService todoService;

  setUp(() {
    todoService = MockTodoService();
    provider = TodoProvider(todoService);
  });

  group('todo provider', () {
    test('starts with no items', () {
      expect(provider.todos.length, 0);
    });
    test('adds todo', () async {
      when(todoService.addTodo(any)).thenAnswer((_) async => true);

      final res = await provider.addTodo("Some title");

      expect(res, true);
      expect(provider.todos.length, 1);
    });

    test('doesnt add empty string', () async {
      final res = await provider.addTodo("");

      expect(res, false);
      expect(provider.todos.length, 0);

      verifyNever(todoService.addTodo(any));
    });

    test('delete todo', () async {
      when(todoService.addTodo(any)).thenAnswer((_) async => true);
      when(todoService.deleteTodo(any)).thenAnswer((_) async => true);

      final res = await provider.addTodo("todo");

      expect(res, true);
      expect(provider.todos.length, 1);

      final deleteRes = await provider.deleteTodo(provider.todos.first);

      expect(deleteRes, true);
      expect(provider.todos.length, 0);
    });

    test('toggle todo', () async {
      when(todoService.addTodo(any)).thenAnswer((_) async => true);
      when(todoService.toggleTodo(any)).thenAnswer((_) async => true);
      await provider.addTodo("some todo");
      expect(provider.todos.length, 1);
      final todo = provider.todos.first;
      expect(todo.isCompleted, false);
      await provider.toggleTodo(todo);
      expect(todo.isCompleted, true);
      await provider.toggleTodo(todo);
      expect(todo.isCompleted, false);
    });
  });
}
