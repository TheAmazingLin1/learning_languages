import 'package:flutter_test/flutter_test.dart';
import 'package:todo/todo.dart';

void main() {
  group('Todo tests', () {
    test('Test todo', () {
      {
        final todoProvider = TodoProvider();
        expect(todoProvider.todos.length, 0);
        final todo = todoProvider.addTodo("Go upstairs");
        expect(todoProvider.todos.length, 1);
        todoProvider.toggleTodo(todo, true);
        expect(todo.isDone, true);

        expect(todoProvider.todos[0].text, "Go upstairs");

        todoProvider.removeTodo(todo);

        expect(todoProvider.todos.length, 0);
      }
    });
  });
}
