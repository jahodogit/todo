class InvalidTodoDateException implements Exception {
  static const _message = 'Todo date is invalid, please change it';

  @override
  String toString() => _message;
}
