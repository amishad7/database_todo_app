class TodoModel {
  String text;
  int id;

  TodoModel({required this.id, required this.text});

  factory TodoModel.fromTable({required Map<String, dynamic> data}) =>
      TodoModel(id: data['id'], text: data['text']);
}
