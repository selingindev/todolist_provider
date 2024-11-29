
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist_provider/shared/interfaces/firestore_interface/i_firestore_service.dart';
import 'package:todolist_provider/shared/models/todos_model_firebase.dart';

class ControllerTodo extends ChangeNotifier {

  final IFirestoreService _firestoreService;

  List<TodosModelFirebase> todos = [];
  
  List<TodosModelFirebase> doneTodo = [];
  final user = FirebaseAuth.instance.currentUser;

  User? currentUser;
  

  ControllerTodo(this._firestoreService);

  void initializeAuthListener() async{
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) async{
        if (user != null) {
          currentUser = user;
  print("Mudando user para: ${user.displayName ?? user.email}");
    await fetchTodos(); 
    print('Alterando todos');

  } else {
    todos.clear(); // Limpa a lista se não houver usuário
  }
  notifyListeners(); 
      }
    );
}
// Atualiza o estado do app
    
  

  Future<String?> fetchTodos() async {
  try {
    
      todos.clear();
      todos = await _firestoreService.getAll(currentUser!.displayName ?? currentUser!.email!);
      print('Pegando todos para: ${currentUser!.email ?? currentUser!.displayName!}');
      
      return null;
    
    
  } catch (e) {
    return "Erro ao buscar todos: $e";
  }

  }

  Future<bool> addTodo(TodosModelFirebase todo,) async {
    try {
      await _firestoreService.save(todo);
      await fetchTodos(); 
      return true;
    } catch (e) {
      print("Erro ao adicionar todo: $e");
      return false;
    }
  }


  Future<void> updateTodo(String id, TodosModelFirebase updatedTodo,) async {
    try {
      final deuBom = await _firestoreService.update(id, updatedTodo);
      if(deuBom! == 'Sucesso'){
        await fetchTodos();
      }
      else{
        print("Deu ruim no update: $deuBom");
      }
    } catch (e) {
      print("Erro ao atualizar todo: $e");
    }
  }

  Future<void> deleteTodo(String id, ) async {
    try {
      await _firestoreService.delete(id);
      await fetchTodos();
    } catch (e) {
      print("Erro ao deletar todo: $e");
    }
  }
}
