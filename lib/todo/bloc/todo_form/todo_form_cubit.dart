import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo/bloc/todo_form/todo_form_state.dart';
import 'package:uuid/uuid.dart';

class TodoFormCubit extends Cubit<TodoFormState> {
  final TodoRepository _todoRepository;

  TodoFormCubit({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(TodoFormInitialState());

  void saveTodo(String title, String description) async {
    try {
      var uuid = const Uuid();

      Todo todo = Todo(
        id: uuid.v1(),
        title: title,
        description: description,
        isCompleted: false,
        createdDate: DateTime.now(),
      );
      emit(TodoFormSavingState());
      await _todoRepository.save(todo);
      emit(TodoFormSuccessState());
    } catch (error) {
      emit(TodoFormErrorState(error: error.toString()));
    }
  }
}
