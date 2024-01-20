import 'package:domain/src/todo/models/todo.dart';

abstract class TodoRepository {
  Future<void> save(Todo todo);
  Future<void> updateStatus(Todo todo);
  Future<void> delete(Todo todo);
  Stream<List<Todo>> getAll();
}
