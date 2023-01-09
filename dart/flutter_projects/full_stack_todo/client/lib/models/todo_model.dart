class TodoModel {
  String title;
  late int id;
  bool isCompleted;

  TodoModel(this.title, {int? id, this.isCompleted = false}) {
    this.id = id ?? DateTime.now().microsecondsSinceEpoch;
  }
}
