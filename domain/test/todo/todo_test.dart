import 'package:domain/domain.dart';
import 'package:domain/src/todo/exceptions/invalid_todo_date_exception.dart';
import 'package:test/test.dart';

void main() {
  group('Todo model', () {
    test(' > Todo created since 20 days before now > Expect InvalidTodoDateException', () {
      //Arrange
      const title = 'Verify AC';
      const description = 'Check AC for each floor';
      const isComplited = false;
      DateTime createdDate = DateTime.now().add(Duration(days: -20));

      //Act-Assert
      expect(
          () => Todo(
                title: title,
                description: description,
                isCompleted: isComplited,
                createdDate: createdDate,
              ),
          throwsA(isA<InvalidTodoDateException>()));
    });
  });
}
