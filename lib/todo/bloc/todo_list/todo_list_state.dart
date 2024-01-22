import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class TodoListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoListLoadingState extends TodoListState {}

class TodoListSucessState extends TodoListState {
  final Stream<List<Todo>> todos;

  TodoListSucessState({required this.todos});

  @override
  List<Object?> get props => [todos];
}

class TodoListErrorState extends TodoListState {
  TodoListErrorState({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}
