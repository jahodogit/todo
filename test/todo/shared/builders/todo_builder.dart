import 'dart:math';

import 'package:domain/domain.dart';

class TodoBuilder {
  String id = '121212';
  String title = 'default title';
  String description = 'default description';
  bool isCompleted = false;
  DateTime createdDate = DateTime.now();
  DateTime completedDate = DateTime.now().add(const Duration(hours: 2));

  final _random = Random();

  TodoBuilder randomTodo(int index) {
    id = index.toString();
    title = 'default title $index';
    description = 'default description $index';
    isCompleted = _random.nextBool();
    createdDate = DateTime.now();
    completedDate = DateTime.now().add(const Duration(days: 2));

    return this;
  }

  List<Todo> getTodoList(int length) {
    return List.generate(length, (index) => randomTodo(index).build());
  }

  Todo build() {
    if (isCompleted) {
      return CompletedTodo(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted,
        createdDate: createdDate,
        completedDate: completedDate,
      );
    } else {
      return Todo(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted,
        createdDate: createdDate,
      );
    }
  }
}
