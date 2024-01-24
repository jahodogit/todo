import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:mocktail/mocktail.dart';

import 'package:todo/todo/bloc/todo_list/todo_list_cubit.dart';
import 'package:todo/todo/bloc/todo_list/todo_list_state.dart';

import '../../shared/builders/todo_builder.dart';

class MockTodoListCubit extends MockCubit<TodoListState> implements TodoListCubit {}

class MockTodoRepository extends Mock implements FirebaseFirestoreTodoRepository {}

void main() {
  late FirebaseFirestoreTodoRepository todoRepository;
  setUp(() {
    todoRepository = MockTodoRepository();
  });
  group('TodoListCubit', () {
    blocTest(
      '> getTodos request > Expect emits a TodoListSuccessState',
      build: () {
        List<Todo> todos = TodoBuilder().getTodoList(3);
        when(() => todoRepository.getAll()).thenAnswer((_) => Stream.value(todos));
        return TodoListCubit(todoRepository: todoRepository);
      },
      act: (cubit) => cubit.getTodos(),
      expect: () => [isA<TodoListSucessState>()],
    );

    blocTest(
      '> getTodos request and response with error > Expect emits empty list',
      build: () {
        when(() => todoRepository.getAll()).thenThrow(Exception);
        return TodoListCubit(todoRepository: todoRepository);
      },
      act: (cubit) => cubit.getTodos(),
      expect: () => [],
    );
  });
}
