import 'package:uuid/uuid.dart';

class TodosModel {
  final String id;
  final String title;
  final String? description;
  final DateTime date;

  TodosModel({String? cId, required this.title, this.description, DateTime? cDate}) : id = cId ?? const Uuid().v4(),
    date = cDate ?? DateTime.now();

  Map<String, dynamic> toMap(){
    return{
        'id': id,
        'title': title,
        'description': description,
        'date' : date.microsecondsSinceEpoch,
    };
  }
}
