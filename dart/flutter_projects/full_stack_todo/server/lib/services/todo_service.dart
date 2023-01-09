import 'package:postgres/postgres.dart';

import '../models/todo_model.dart';

class TodoService {
  final PostgreSQLConnection _db;

  TodoService(this._db);

  Future<bool> addTodo(TodoModel todo) async {
    try {
      await _db.mappedResultsQuery(
          "INSERT INTO todos (todo_id, title, is_completed) VALUES (@todoId, @title, @isCompleted)",
          substitutionValues: {
            'todoId': todo.id,
            'title': todo.title,
            'isCompleted': todo.isCompleted,
          });
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<List<TodoModel>?> getTodo() async {
    try {
      final res = await _db.mappedResultsQuery("SELECT * FROM todos;");
      List<TodoModel> todos = [];
      for (final row in res) {
        if (row['todos'] == null) continue;
        final todo = row['todos']!;
        todos.add(TodoModel(
          todo['title'],
          id: todo['todo_id'],
          isCompleted: todo['is_completed'],
        ));
      }
      return todos;
    } catch (error) {
      return null;
    }
  }

  Future<bool> deleteTodo(TodoModel todo) async {
    try {
      _db.mappedResultsQuery("DELETE FROM todos WHERE todo_id = @id",
          substitutionValues: {'id': todo.id});
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> toggleTodo(TodoModel todo) async {
    try {
      await _db.mappedResultsQuery(
          'UPDATE todos SET is_completed = @value WHERE todo_id = @id',
          substitutionValues: {
            'value': !todo.isCompleted,
            'id': todo.id,
          });
      return true;
    } catch (error) {
      return false;
    }
  }
}
