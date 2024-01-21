import 'package:domain/domain.dart';
import 'package:domain/src/todo/exceptions/invalid_todo_date_exception.dart';
import 'package:test/test.dart';

void main() {
  group('CompletedTodo Model ', () {
    test('> Creeate model with a date after the currenta datetime > Expect InvalidTodoDateException', () {
      //Arrange
      const id = 'uid';
      const title = 'Verify AC';
      const description = 'Check AC for each floor';
      const isCompleted = false;
      DateTime createdDate = DateTime.now();
      DateTime completedDate = DateTime.now().add(Duration(days: 20));

      //Act-Assert
      expect(
          () => CompletedTodo(
                id: id,
                title: title,
                description: description,
                isCompleted: isCompleted,
                createdDate: createdDate,
                completedDate: completedDate,
              ),
          throwsA(isA<InvalidTodoDateException>()));
    });

    test('', () {});
  });
}
