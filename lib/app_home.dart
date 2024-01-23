import 'package:flutter/material.dart';
import 'package:todo/todo/widgets/todo_form_page.dart';
import 'package:todo/todo/widgets/todo_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const route = 'app_home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades'),
      ),
      body: const TodoListPage(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed(TodoFormPage.route),
      ),
    );
  }
}
