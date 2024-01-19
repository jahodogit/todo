import 'package:domain/src/todo/exceptions/invalid_todo_date_exception.dart';

class Todo {
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdDate;

  //This line just represents a domain rule to show only items created in the last 5 dyas
  static const limitDaysForOpenToDo = 5;

  Todo({required this.title, required this.description, required this.isCompleted, required this.createdDate});

  void validateDate() {
    DateTime now = DateTime.now();
    Duration daysLimit = Duration(days: -5);

    if (createdDate.isAfter(now.add(daysLimit))) throw InvalidTodoDateException();
  }
}
