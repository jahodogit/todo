import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:infrastructure/src/todo/dtos/todo_dto.dart';

class TodoTranslator {
  static TodoDto fromDomainToDocument(Todo todo) {
    return TodoDto(
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
      createdDate: todo.createdDate,
      completedDate: todo is CompletedTodo ? todo.completedDate : null,
    );
  }

  static Todo fromDocumentToDomain(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    TodoDto todoDto = TodoDto.fromJson(doc.data());

    switch (todoDto.isCompleted) {
      case false:
        return Todo(
          id: doc.id,
          title: todoDto.title,
          description: todoDto.description,
          isCompleted: todoDto.isCompleted,
          createdDate: todoDto.createdDate,
        );
      case true:
        return CompletedTodo(
          id: doc.id,
          title: todoDto.title,
          description: todoDto.description,
          isCompleted: todoDto.isCompleted,
          createdDate: todoDto.createdDate,
          completedDate: todoDto.completedDate!,
        );
    }
  }
}
