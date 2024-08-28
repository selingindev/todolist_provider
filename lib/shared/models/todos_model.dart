import 'package:uuid/uuid.dart';

class TodosModel {
  final String id;
  final String title;
  final String? description;
  final DateTime date;

  TodosModel(
      {String? cId, required this.title, this.description, DateTime? cDate})
      : id = cId ?? const Uuid().v4(),
        date = cDate ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.microsecondsSinceEpoch,
    };
  }

  factory TodosModel.fromMap(Map<String, dynamic> map) {
    return TodosModel(
        cId: map['id'],
        title: map['title'],
        description: map['description'],
        cDate: DateTime.fromMillisecondsSinceEpoch(
          map['date'],
        ));
  }
}
