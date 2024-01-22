class TranslatedTodoDto {
  String title;
  String description;

  TranslatedTodoDto({required this.title, required this.description});

  Map<String, dynamic> toJson() => {
        title: title,
        description: description,
      };

  factory TranslatedTodoDto.fromJson(Map<String, dynamic> json) {
    return TranslatedTodoDto(
      title: json['title'],
      description: json['description'],
    );
  }
}
