import 'package:postgres/postgres.dart';
import 'package:server/controllers/todo_controller.dart';
import 'package:server/services/todo_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class TodoRouter {
  PostgreSQLConnection db;

  TodoRouter(this.db);

  Handler get handler {
    final router = Router();

    final controller = TodoController(
      TodoService(db),
    );

    router.get('/todos', (Request request) => controller.getTodos(request));

    router.post('/todos', (Request request) => controller.addTodo(request));

    router.post('/todos', (Request request) => controller.addTodo(request));

    router.patch('/todo', (Request request) => controller.toggleTodo(request));

    return router;
  }
}
