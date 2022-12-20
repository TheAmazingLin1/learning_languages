class Todo {
  String id;
  String text;
  bool isCompleted;

  Todo(this.id, this.text, this.isCompleted);

  factory Todo.fromJson(String id, dynamic json) {
    return Todo(id, json['text'], json['is_completed']);
  }
}
