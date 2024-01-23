import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:todo/todo/bloc/todo_item/todo_item_cubit.dart';
import 'package:todo/todo/bloc/todo_item/todo_item_state.dart';

class TodoItemWidget extends StatefulWidget {
  const TodoItemWidget({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  bool showTranslation = false;

  late FirebaseFirestore db;
  late TranslatedTodoRepository translatedTodoRepository;

  @override
  void initState() {
    db = FirebaseFirestore.instance;
    translatedTodoRepository = FirebaseTranslatedTodoRepository(db: db);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8.0,
        child: Column(
          children: [
            ListTile(
              title: Text(widget.todo.title),
              subtitle: Text(widget.todo.description),
              trailing: ElevatedButton(onPressed: () {}, child: const Text('Terminar')),
            ),
            BlocProvider(
              create: (_) => TodoItemCubit(translatedTodoRepository: translatedTodoRepository),
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
