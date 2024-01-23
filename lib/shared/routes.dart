import 'package:flutter/material.dart';
import 'package:todo/app_home.dart';
import 'package:todo/todo/widgets/todo_form_page.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    HomePage.route: (BuildContext context) => const HomePage(),
    TodoFormPage.route: (BuildContext context) => const TodoFormPage(),
  };
}
