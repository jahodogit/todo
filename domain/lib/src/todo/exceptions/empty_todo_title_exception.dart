class EmptyTodoTitleException implements Exception {
  static const _message = 'Title cant be empty';

  @override
  String toString() => _message;
}
