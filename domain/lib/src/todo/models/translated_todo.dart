import 'package:domain/src/todo/exceptions/empty_todo_description_exception.dart';
import 'package:domain/src/todo/exceptions/empty_todo_title_exception.dart';

class TranslatedTodo {
  final String title;
  final String description;

  TranslatedTodo({required this.title, required this.description}) {
    if (title.isEmpty) throw EmptyTodoTitleException();
    if (description.isEmpty) throw EmptyTodoDescriptionException();
  }
}
