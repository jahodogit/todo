import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class TodoItemState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoItemInitialState extends TodoItemState {}

class TodoItemLoadingTranslateState extends TodoItemState {}

class TodoItemSuccessTranslateState extends TodoItemState {
  final TranslatedTodo translatedTodo;

  TodoItemSuccessTranslateState({required this.translatedTodo});

  @override
  List<Object?> get props => [translatedTodo];
}

class TodoItemErrorState extends TodoItemState {
  TodoItemErrorState({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}
