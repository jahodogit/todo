import 'package:equatable/equatable.dart';

class TodoFormState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoFormInitialState extends TodoFormState {}

class TodoFormSavingState extends TodoFormState {}

class TodoFormSuccessState extends TodoFormState {}

class TodoFormErrorState extends TodoFormState {
  final String error;

  TodoFormErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
