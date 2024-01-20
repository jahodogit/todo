import 'package:domain/src/todo/exceptions/invalid_todo_date_exception.dart';

class Todo {
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdDate;

  //This line just represents a domain rule to show only items created in the last 5 dyas
  static const limitDaysForOpenTodo = 5;

  Todo({required this.title, required this.description, required this.isCompleted, required this.createdDate}) {
    validateDate();
  }

  void validateDate() {
    DateTime now = DateTime.now();

    int difference = createdDate.difference(now).inDays.abs();

    if (difference > limitDaysForOpenTodo) throw InvalidTodoDateException();
  }
}
