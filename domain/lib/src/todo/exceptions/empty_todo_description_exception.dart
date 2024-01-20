class EmptyTodoDescriptionException implements Exception {
  static const _message = 'Description cant be empty';

  @override
  String toString() => _message;
}
