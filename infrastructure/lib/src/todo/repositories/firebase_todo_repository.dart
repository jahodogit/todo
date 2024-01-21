import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:infrastructure/src/todo/anticorruption/todo_translator.dart';
import 'package:infrastructure/src/todo/dtos/todo_dto.dart';

class FirebaseFirestoreTodoRepository implements TodoRepository {
  final FirebaseFirestore db;
  static const collectionName = 'todo';

  FirebaseFirestoreTodoRepository({required this.db});

  @override
  Future<void> delete(Todo todo) async => db.collection(collectionName).doc(todo.id).delete();

  @override
  Stream<List<Todo>> getAll() {
    return db.collection(collectionName).get().asStream().cast();
  }

  @override
  Future<void> save(Todo todo) async {
    TodoDto dto = TodoTranslator.fromDomainToDocument(todo);
    await db.collection(collectionName).doc(todo.id).set(dto.toJson());
  }

  @override
  Future<void> updateStatus(Todo todo) async {
    TodoDto dto = TodoTranslator.fromDomainToDocument(todo);
    dto.isCompleted = !dto.isCompleted;
    await db.collection(collectionName).doc(todo.id).update(dto.toJson());
  }
}
