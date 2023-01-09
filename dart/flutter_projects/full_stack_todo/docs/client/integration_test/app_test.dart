import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('add todo', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await addTodo(tester, "some todo");
    expect(find.text("some todo"), findsOneWidget);
  });

  testWidgets('delete todo', (tester) async {
    final todo = "a todo";
    app.main();
    await tester.pumpAndSettle();
    await addTodo(tester, todo);
    expect(find.text(todo), findsOneWidget);

    await tester.tap(find.byKey(Key("menu")));
    await tester.pumpAndSettle();

    final deleteButton = find.text("Delete todo");
    expect(deleteButton, findsOneWidget);

    await tester.tap(deleteButton);
    await tester.pumpAndSettle();

    expect(find.text(todo), findsNothing);
  });

  testWidgets('toggle todo', (tester) async {
    final todo = "some todo";
    app.main();
    await tester.pumpAndSettle();
    await addTodo(tester, todo);
    final checkboxFinder = find.byKey(Key("todoCheckbox"));
    await tester.tap(checkboxFinder);
    await tester.pumpAndSettle();
    var checkboxWidget = tester.firstWidget(checkboxFinder) as Checkbox;
    expect(checkboxWidget.value, true);

    await tester.tap(checkboxFinder);
    await tester.pumpAndSettle();
    checkboxWidget = tester.firstWidget(checkboxFinder) as Checkbox;
    expect(checkboxWidget.value, false);
  });
}

addTodo(WidgetTester tester, String todo) async {
  final input = find.byKey(Key("todoField"));
  expect(input, findsOneWidget);
  await tester.enterText(input, todo);
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pumpAndSettle();
}
