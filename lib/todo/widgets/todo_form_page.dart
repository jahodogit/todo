import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:todo/di/dependencies_injection.dart';
import 'package:todo/todo/bloc/todo_form/todo_form_cubit.dart';
import 'package:todo/todo/bloc/todo_form/todo_form_state.dart';

class TodoFormPage extends StatefulWidget {
  const TodoFormPage({super.key});
  static const route = 'todo_form';

  @override
  State<TodoFormPage> createState() => _TodoFormPageState();
}

class _TodoFormPageState extends State<TodoFormPage> {
  late FirebaseFirestore db;
  late TodoRepository todoRepository;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    db = FirebaseFirestore.instance;
    todoRepository = FirebaseFirestoreTodoRepository(db: db);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva actividad')),
      body: BlocProvider<TodoFormCubit>(
        create: (context) => getIt<TodoFormCubit>(),
        child: BlocConsumer<TodoFormCubit, TodoFormState>(
          builder: (context, state) {
            if (state is TodoFormSavingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(label: Text('Titulo')),
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(label: Text('Descripcion')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String title = titleController.text;
                      String description = descriptionController.text;

                      BlocProvider.of<TodoFormCubit>(context).saveTodo(title, description);
                    },
                    child: const Text('Guardar'),
                  )
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is TodoFormErrorState) {
              SnackBar snackBar = SnackBar(content: Text(state.error));

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (state is TodoFormSuccessState) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}
