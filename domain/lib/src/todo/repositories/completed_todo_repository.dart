import 'package:domain/src/todo/models/completed_todo.dart';
import 'package:domain/src/todo/models/todo.dart';

abstract class CompletedTodoRepository {
  Future<void> save(CompletedTodo completedTodo);
  Future<void> delete(CompletedTodo completedTodo);
  Future<CompletedTodo> getCompletedTodoByTodo(Todo todo);
}
