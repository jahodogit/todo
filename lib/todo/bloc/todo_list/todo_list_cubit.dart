import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo/bloc/todo_list/todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  final TodoRepository todoRepository;

  TodoListCubit({required this.todoRepository}) : super(TodoListLoadingState()) {
    getTodos();
  }

  void getTodos() {
    try {
      Stream<List<Todo>> stream = todoRepository.getAll();
      emit(TodoListSucessState(todos: stream));
    } catch (error) {
      emit(TodoListErrorState(error: error.toString()));
    }
  }
}
