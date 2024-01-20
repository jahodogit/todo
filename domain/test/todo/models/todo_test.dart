import 'package:domain/domain.dart';
import 'package:domain/src/todo/exceptions/empty_todo_description_exception.dart';
import 'package:domain/src/todo/exceptions/empty_todo_title_exception.dart';
import 'package:domain/src/todo/exceptions/invalid_todo_date_exception.dart';
import 'package:test/test.dart';

void main() {
  group('Todo model', () {
    test(' > Todo created since 20 days before now > Expect InvalidTodoDateException', () {
      //Arrange
      const title = 'Verify AC';
      const description = 'Check AC for each floor';
      const isCompleted = false;
      DateTime createdDate = DateTime.now().add(Duration(days: -20));

      //Act-Assert
      expect(
          () => Todo(
                title: title,
                description: description,
                isCompleted: isCompleted,
                createdDate: createdDate,
              ),
          throwsA(isA<InvalidTodoDateException>()));
    });

    test(' > Todo created with valid parameters > Expect instanfe of Todo Model', () {
      //Arrange
      const title = 'Idnetiy backyard vulnerabilities';
      const description = 'Establish posible entrances for a thief';
      const isComplited = false;
      DateTime createdDate = DateTime.now();

      //Act-Assert
      expect(
          Todo(
            title: title,
            description: description,
            isCompleted: isComplited,
            createdDate: createdDate,
          ),
          isA<Todo>());
    });

    test('> Create Todo with empty title > Expect EmptyTodoTitleException', () {
      //Arrange
      const title = '';
      const description = 'Check AC for each floor';
      const isCompleted = false;
      DateTime createdDate = DateTime.now();
      //Act-Assert
      expect(
          () => Todo(
                title: title,
                description: description,
                isCompleted: isCompleted,
                createdDate: createdDate,
              ),
          throwsA(isA<EmptyTodoTitleException>()));
    });

    test('> Create Todo with empty description > Expect EmptyTodoDescriptionException', () {
      //Arrange
      const title = 'A title string';
      const description = '';
      const isCompleted = false;
      DateTime createdDate = DateTime.now();
      //Act-Assert
      expect(
          () => Todo(
                title: title,
                description: description,
                isCompleted: isCompleted,
                createdDate: createdDate,
              ),
          throwsA(isA<EmptyTodoDescriptionException>()));
    });

    test('> Create Todo with whitespaces description > Expect EmptyTodoDescriptionException', () {
      //Arrange
      const title = 'A title string';
      const description = '                 ';
      const isCompleted = false;
      DateTime createdDate = DateTime.now();
      //Act-Assert
      expect(
          () => Todo(
                title: title,
                description: description,
                isCompleted: isCompleted,
                createdDate: createdDate,
              ),
          throwsA(isA<EmptyTodoDescriptionException>()));
    });
  });
}
