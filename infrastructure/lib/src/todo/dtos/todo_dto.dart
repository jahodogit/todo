class TodoDto {
  String id;
  String title;
  String description;
  bool isCompleted;
  DateTime createdDate;

  TodoDto({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdDate,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'isCompleted': isCompleted,
        'createdDate': createdDate,
      };
}
