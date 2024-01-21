import 'package:domain/domain.dart';
import 'package:infrastructure/src/todo/dtos/todo_dto.dart';

class TodoTranslator {
  static TodoDto fromDomainToDocument(Todo todo) {
    return TodoDto(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
      createdDate: todo.createdDate,
    );
  }

  static Todo fromDocumentToDomain(TodoDto todoDto) {
    return Todo(
      id: todoDto.id,
      title: todoDto.title,
      description: todoDto.description,
      isCompleted: todoDto.isCompleted,
      createdDate: todoDto.createdDate,
    );
  }
}
