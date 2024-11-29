

class TodosModelFirebase {
  String? id;
  final String? description;
  bool isDone;
  final String userName;
  final DateTime date;
  final String title;

  TodosModelFirebase({this.id,  required this.description, required this.title,required this.date,  required this.isDone, required this.userName} );

  Map<String, dynamic> toMap() {
    return {
      'isdone': isDone,
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'user': userName,
    };
  }

  factory TodosModelFirebase.fromMap(Map<String, dynamic> map) {
    return TodosModelFirebase(
        userName: map['user'],
        title: map['title'],
        description: map['description'],
        date: DateTime.fromMillisecondsSinceEpoch(
          map['date'],
        ), 
        isDone: map['isdone'],
      );
  }

  
}