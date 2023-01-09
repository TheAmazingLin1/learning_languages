class TodoModel {
  String title;
  late int id;
  bool isCompleted;

  TodoModel(this.title, {int? id, this.isCompleted = false}) {
    this.id = id ?? DateTime.now().microsecondsSinceEpoch;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'isCompleted': isCompleted,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(json['title'],
        id: json['id'], isCompleted: json['isCompleted']);
  }
}
