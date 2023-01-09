import 'package:postgres/postgres.dart';
import 'package:server/routers/todo_router.dart';
import 'package:shelf/shelf_io.dart';

void main(List<String> arguments) async {
  final db = PostgreSQLConnection("localhost", 5432, "todos",
      username: "postgres", password: "hitman");
  await db.open();
  await serve(TodoRouter(db).handler, "localhost", 8080);
}
