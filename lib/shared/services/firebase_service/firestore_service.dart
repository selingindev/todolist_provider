


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist_provider/shared/interfaces/firestore_interface/i_firestore_service.dart';
import 'package:todolist_provider/shared/models/todos_model_firebase.dart';

class FirestoreService implements IFirestoreService{
  var service = FirebaseFirestore.instance.collection('todos');
  @override
  Future<List<TodosModelFirebase>> getAll() async{
    final snapshot = await service.get();
    List<TodosModelFirebase> todos = snapshot.docs.map((todo) => TodosModelFirebase.fromMap(todo as Map<String, dynamic>)).toList();
    return todos;
    
  }

  @override
  Future<void> save(TodosModelFirebase todo) async {
    await service.add(todo.toMap());
  }
  
  @override
  Future<String?> delete(String title)async {
    
  }
  
  @override
  Future<String?> update(String title) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
}