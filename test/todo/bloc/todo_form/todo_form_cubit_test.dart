import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/todo/bloc/todo_form/todo_form_cubit.dart';
import 'package:todo/todo/bloc/todo_form/todo_form_state.dart';

import '../../shared/builders/todo_builder.dart';

class MockTodoFormCubit extends MockCubit<TodoFormState> implements TodoFormCubit {}

class MockTodoRepository extends Mock implements FirebaseFirestoreTodoRepository {}

void main() {
  late FirebaseFirestoreTodoRepository todoRepository;
  setUpAll(() {
    todoRepository = MockTodoRepository();
    Todo todo = TodoBuilder().randomTodo(1).build();
    registerFallbackValue(todo);
  });
  group('TodoFormCubit', () {
    const emptyTitle = '';
    const validDescription = 'Valid description';

    blocTest(
      '> saveTodo request with empty title > Expect emits a TodoErrorState',
      build: () {
        return TodoFormCubit(todoRepository: todoRepository);
      },
      act: (cubit) => cubit.saveTodo(emptyTitle, validDescription),
      expect: () => [isA<TodoFormErrorState>()],
    );

    const validTitle = 'Valid title';
    const emptyDescription = '                ';
    blocTest(
      '> saveTodo request with empty description > Expect emits a TodoErrorState',
      build: () {
        return TodoFormCubit(todoRepository: todoRepository);
      },
      act: (cubit) => cubit.saveTodo(validTitle, emptyDescription),
      expect: () => [isA<TodoFormErrorState>()],
    );

    blocTest(
      '> saveTodo request with valid data > Expect emits a TodoFormSavingState and then TodoSuccessState',
      build: () {
        when(() => todoRepository.save(any())).thenAnswer((_) async {});
        return TodoFormCubit(todoRepository: todoRepository);
      },
      act: (cubit) => cubit.saveTodo(validTitle, validDescription),
      expect: () => [isA<TodoFormSavingState>(), isA<TodoFormSuccessState>()],
    );
  });
}
