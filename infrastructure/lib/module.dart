import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InfrastructureModule {
  @LazySingleton()
  FirebaseFirestore get db => FirebaseFirestore.instance;

  FirebaseFirestoreTodoRepository firebaseTodoRepository(FirebaseFirestore db) => FirebaseFirestoreTodoRepository(db: db);
  FirebaseTranslatedTodoRepository firebaseTranslatedTodoRepository(FirebaseFirestore db) => FirebaseTranslatedTodoRepository(db: db);
}
