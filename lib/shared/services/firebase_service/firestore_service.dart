


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist_provider/shared/interfaces/firestore_interface/i_firestore_service.dart';
import 'package:todolist_provider/shared/models/todos_model_firebase.dart';

class FirestoreService implements IFirestoreService{
  var service = FirebaseFirestore.instance.collection('todos');
  @override
  Future<List<TodosModelFirebase>> getAll() async{
    final snapshot = await service.get();
    List<TodosModelFirebase> todos = snapshot.docs.map((doc) {
      final todo = TodosModelFirebase.fromMap(doc.data());
      todo.id = doc.id;
      return todo;
    }).toList();
    return todos;
    
  }

  @override
  Future<void> save(TodosModelFirebase todo) async {
    await service.add(todo.toMap());
  }
  
  @override
  Future<String?> delete(String id)async {
    try {
    await service.doc(id).delete();
    return 'Sucesso';
  } catch (e) {
    return 'Error ao deletar: $e';
  }
  }
  
  @override
  Future<String?> update(String id, TodosModelFirebase newValues)async {
    try{
      await service.doc(id).update(newValues.toMap());
      return 'Sucesso';
    }catch (e){
      return "Erro ao atualizar: $e";
    }
  }
  
}