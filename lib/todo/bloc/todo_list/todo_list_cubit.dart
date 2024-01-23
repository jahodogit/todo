import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/todo/bloc/todo_list/todo_list_state.dart';

@injectable
class TodoListCubit extends Cubit<TodoListState> {
  final FirebaseFirestoreTodoRepository _todoRepository;

  TodoListCubit({required FirebaseFirestoreTodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(TodoListLoadingState()) {
    getTodos();
  }

  void getTodos() {
    try {
      Stream<List<Todo>> stream = _todoRepository.getAll();
      emit(TodoListSucessState(todos: stream));
    } catch (error) {
      emit(TodoListErrorState(error: error.toString()));
    }
  }
}
