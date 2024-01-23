import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDto {
  String title;
  String description;
  bool isCompleted;
  Timestamp createdDate;
  Timestamp? completedDate;

  TodoDto({
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdDate,
    this.completedDate,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'isCompleted': isCompleted,
        'createdDate': createdDate,
        'completedDate': completedDate,
      };

  factory TodoDto.fromJson(Map<String, dynamic> json) {
    return TodoDto(
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
      createdDate: json['createdDate'],
      completedDate: json['createdDate'],
    );
  }
}
