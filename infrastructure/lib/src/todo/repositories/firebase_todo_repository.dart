import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:infrastructure/src/todo/anticorruption/todo_translator.dart';
import 'package:infrastructure/src/todo/dtos/todo_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TodoRepository)
class FirebaseFirestoreTodoRepository implements TodoRepository {
  final FirebaseFirestore _db;
  static const _collectionName = 'todo';

  FirebaseFirestoreTodoRepository({required FirebaseFirestore db}) : _db = db;

  @override
  Future<void> delete(Todo todo) async => _db.collection(_collectionName).doc(todo.id).delete();

  @override
  Stream<List<Todo>> getAll() {
    const orderByField = 'createdDate';
    Stream<QuerySnapshot<Map<String, dynamic>>> stream = _db.collection(_collectionName).orderBy(orderByField).snapshots();
    return stream.map((event) {
      return event.docs.map((doc) {
        return TodoTranslator.fromDocumentToDomain(doc);
      }).toList();
    });
  }

  @override
  Future<void> save(Todo todo) async {
    TodoDto dto = TodoTranslator.fromDomainToDocument(todo);
    await _db.collection(_collectionName).doc(todo.id).set(dto.toJson());
  }

  @override
  Future<void> updateStatus(Todo todo) async {
    TodoDto dto = TodoTranslator.fromDomainToDocument(todo);
    dto.isCompleted = !dto.isCompleted;
    dto.completedDate = DateTime.now();
    await _db.collection(_collectionName).doc(todo.id).update(dto.toJson());
  }
}
