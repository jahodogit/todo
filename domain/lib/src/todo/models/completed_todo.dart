import 'package:domain/src/todo/exceptions/invalid_todo_date_exception.dart';
import 'package:domain/src/todo/models/todo.dart';

class CompletedTodo extends Todo {
  final DateTime completedDate;

  CompletedTodo({
    required super.id,
    required super.title,
    required super.description,
    required super.isCompleted,
    required super.createdDate,
    required this.completedDate,
  });

  @override
  void validateDate() {
    if (completedDate.isAfter(DateTime.now())) throw InvalidTodoDateException();
  }
}
