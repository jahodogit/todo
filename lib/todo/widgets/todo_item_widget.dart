import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/di/dependencies_injection.dart';
import 'package:todo/todo/bloc/todo_item/todo_item_cubit.dart';
import 'package:todo/todo/bloc/todo_item/todo_item_state.dart';
import 'package:todo/todo/bloc/todo_list/todo_list_cubit.dart';
import 'package:intl/intl.dart';

class TodoItemWidget extends StatefulWidget {
  const TodoItemWidget({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  bool showTranslation = false;
  DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: Key(widget.todo.id),
        background: buildBackgroundTodoItemWidget(),
        onDismissed: (direction) {
          BlocProvider.of<TodoListCubit>(context).deleteTodo(widget.todo);
        },
        child: Card(
          elevation: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(widget.todo.title),
                subtitle: buildTodoSubtitle(),
                trailing: widget.todo.isCompleted
                    ? const Icon(Icons.check_circle)
                    : ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<TodoListCubit>(context).updateStatus(widget.todo);
                        },
                        child: const Text('Terminar')),
              ),
              BlocProvider(
                create: (_) => getIt<TodoItemCubit>(),
                child: BlocConsumer<TodoItemCubit, TodoItemState>(
                  listener: (_, state) {
                    if (state is TodoItemErrorState) {}
                  },
                  builder: (context2, state) {
                    if (state is TodoItemInitialState) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            BlocProvider.of<TodoItemCubit>(context2).getTodoItemTranslation(widget.todo);
                          },
                          child: const Text('Translate'),
                        ),
                      );
                    } else if (state is TodoItemLoadingTranslateState) {
                      return const SizedBox(height: 10, width: 10, child: CircularProgressIndicator());
                    } else if (state is TodoItemSuccessTranslateState) {
                      return buildTranslationWidget(state);
                    } else if (state is TodoItemErrorState) {
                      return const Text('Error');
                    } else {
                      return const Text('Error');
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column buildTodoSubtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.todo.description),
        const SizedBox(height: 20),
        Text('Creacion: ${formatter.format(widget.todo.createdDate)}'),
        widget.todo.isCompleted ? Text('Terminacion: ${formatter.format(widget.todo.createdDate)}') : const SizedBox(),
      ],
    );
  }

  Container buildBackgroundTodoItemWidget() {
    return Container(
      alignment: Alignment.centerRight,
      color: Colors.red[300],
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }

  Column buildTranslationWidget(TodoItemSuccessTranslateState state) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          leading: const Icon(Icons.translate_sharp),
          title: Text(state.translatedTodo.title),
          subtitle: Text(state.translatedTodo.description),
        ),
      ],
    );
  }
}
