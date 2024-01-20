import 'package:domain/domain.dart';
import 'package:domain/src/todo/exceptions/empty_todo_description_exception.dart';
import 'package:domain/src/todo/exceptions/empty_todo_title_exception.dart';
import 'package:test/test.dart';

void main() {
  group('TranslatedTodo Model ', () {
    test('> Create Todo with empty title > Expect EmptyTodoTitleException', () {
      //Arrange
      const title = '';
      const description = 'Check AC for each floor';

      //Act-Assert
      expect(
          () => TranslatedTodo(
                title: title,
                description: description,
              ),
          throwsA(isA<EmptyTodoTitleException>()));
    });

    test('> Create Todo with empty description > Expect EmptyTodoDescriptionException', () {
      //Arrange
      const title = 'A title string';
      const description = '';

      //Act-Assert
      expect(
          () => TranslatedTodo(
                title: title,
                description: description,
              ),
          throwsA(isA<EmptyTodoDescriptionException>()));
    });
  });
}
