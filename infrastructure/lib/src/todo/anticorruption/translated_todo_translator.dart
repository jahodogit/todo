import 'package:domain/domain.dart';
import 'package:infrastructure/src/todo/dtos/translated_todo_dto.dart';

class TranslatedTodoTranslator {
  TranslatedTodo fromDocumentToDomain(TranslatedTodoDto translatedTodoDto) {
    return TranslatedTodo(
      title: translatedTodoDto.title,
      description: translatedTodoDto.description,
    );
  }
}
