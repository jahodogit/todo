import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:todo/todo/bloc/todo_item/todo_item_state.dart';

class TodoItemCubit extends Cubit<TodoItemState> {
  final TranslatedTodoRepository _translatedTodoRepository;

  TodoItemCubit({required TranslatedTodoRepository translatedTodoRepository})
      : _translatedTodoRepository = translatedTodoRepository,
        super(TodoItemInitialState());

  void getTodoItemTranslation(Todo todo) async {
    emit(TodoItemLoadingTranslateState());
    try {
      TranslatedTodo translatedTodo = await _translatedTodoRepository.getTranslatedTodoByTodo(todo);
      emit(TodoItemSuccessTranslateState(translatedTodo: translatedTodo));
    } catch (error) {
      emit(TodoItemErrorState(error: error.toString()));
    }
  }
}
