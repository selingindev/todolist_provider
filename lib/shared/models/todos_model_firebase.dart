
import 'package:firebase_auth/firebase_auth.dart';

class TodosModelFirebase {
  String? id;
  final String? description;
  final bool isDone;
  final User user;
  final DateTime date;
  final String title;

  TodosModelFirebase({this.id,  required this.description, required this.title,required this.date,  required this.isDone, required this.user} );

  Map<String, dynamic> toMap() {
    return {
      'isdone': isDone,
      'title': title,
      'description': description,
      'date': date.microsecondsSinceEpoch,
      'user': user,
    };
  }

  factory TodosModelFirebase.fromMap(Map<String, dynamic> map) {
    return TodosModelFirebase(
        user: map['user'],
        title: map['title'],
        description: map['description'],
        date: DateTime.fromMillisecondsSinceEpoch(
          map['date'],
        ), 
        isDone: map['isdone'],
      );
  }
  
}