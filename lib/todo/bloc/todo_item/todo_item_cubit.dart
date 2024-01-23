import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/todo/bloc/todo_item/todo_item_state.dart';

@injectable
class TodoItemCubit extends Cubit<TodoItemState> {
  final FirebaseTranslatedTodoRepository _translatedTodoRepository;

  TodoItemCubit({required FirebaseTranslatedTodoRepository translatedTodoRepository})
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
