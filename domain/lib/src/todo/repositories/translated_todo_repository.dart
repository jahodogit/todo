import 'package:domain/src/todo/models/todo.dart';
import 'package:domain/src/todo/models/translated_todo.dart';

abstract class TranslatedTodoRepository {
  Future<void> save(TranslatedTodo translatedTodo);
  Future<TranslatedTodo> getTranslatedTodoByTodo(Todo todo);
}
