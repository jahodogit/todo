import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo/widgets/todo_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Todo todo = Todo(
    id: '333333',
    title: 'Estado de los ascensores',
    description: 'Verificar la poleas y los rieles revisando desde la parte posterios en inferior',
    isCompleted: false,
    createdDate: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          TodoItemWidget(todo: todo),
          TodoItemWidget(todo: todo),
        ],
      ),
    );
  }
}
