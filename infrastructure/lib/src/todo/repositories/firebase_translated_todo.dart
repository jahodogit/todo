import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:infrastructure/src/todo/anticorruption/translated_todo_translator.dart';
import 'package:infrastructure/src/todo/dtos/translated_todo_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TranslatedTodoRepository)
class FirebaseTranslatedTodoRepository implements TranslatedTodoRepository {
  final FirebaseFirestore _db;
  static const _collectionName = 'todo';

  FirebaseTranslatedTodoRepository({required FirebaseFirestore db}) : _db = db;

  @override
  Future<TranslatedTodo> getTranslatedTodoByTodo(Todo todo) async {
    const translateDetailNameCollection = 'translate';
    DocumentSnapshot<Map<String, dynamic>> snapshot = await _db.collection(_collectionName).doc(todo.id).get();
    TranslatedTodoDto dto = TranslatedTodoDto.fromJson(snapshot.data()![translateDetailNameCollection]);
    TranslatedTodo translatedTodo = TranslatedTodoTranslator().fromDocumentToDomain(dto);
    return translatedTodo;
  }
}
