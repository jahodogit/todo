library;

import 'package:injectable/injectable.dart';

export './src/todo/repositories/firebase_todo_repository.dart' show FirebaseFirestoreTodoRepository;
export './src/todo/repositories/firebase_translated_todo.dart' show FirebaseTranslatedTodoRepository;

@InjectableInit.microPackage()
void initInfrastructure() {}
