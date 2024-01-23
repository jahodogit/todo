import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/di/dependencies_injection.dart';
import 'package:todo/todo/bloc/todo_list/todo_list_cubit.dart';
import 'package:todo/todo/bloc/todo_list/todo_list_state.dart';
import 'package:todo/todo/widgets/todo_item_widget.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TodoListCubit>(),
      child: BlocConsumer<TodoListCubit, TodoListState>(
        builder: (context, state) {
          if (state is TodoListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoListSucessState) {
            return buildTodoStream(state);
          } else if (state is TodoListErrorState) {
            return Text(state.error);
          } else {
            return const Text('Error');
          }
        },
        listener: (context, state) {
          if (state is TodoListErrorState) {}
        },
      ),
    );
  }

  StreamBuilder<List<Todo>> buildTodoStream(TodoListSucessState state) {
    return StreamBuilder<List<Todo>>(
        stream: state.todos,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.hasData) {
            List<Todo> todos = snapshot.data!;
            return buildTodoListView(todos);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  ListView buildTodoListView(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (_, index) {
        Todo todo = todos[index];
        return TodoItemWidget(todo: todo);
      },
    );
  }
}
