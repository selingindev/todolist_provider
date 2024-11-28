
import 'package:flutter/material.dart';
import 'package:todolist_provider/shared/interfaces/firestore_interface/i_firestore_service.dart';
import 'package:todolist_provider/shared/models/todos_model_firebase.dart';

class ControllerTodo extends ChangeNotifier {

  final IFirestoreService _firestoreService;

  List<TodosModelFirebase> _todos = [];
  List<TodosModelFirebase> get todos => _todos;

  ControllerTodo(this._firestoreService);

  Future<void> fetchTodos(String nameUser) async {
    try {
      _todos = await _firestoreService.getAll(nameUser);
      notifyListeners(); 
    } catch (e) {
      print("Erro ao buscar todos: $e");
    }
  }

  Future<void> addTodo(TodosModelFirebase todo, String nameUser) async {
    try {
      await _firestoreService.save(todo);
      await fetchTodos(nameUser); 
    } catch (e) {
      print("Erro ao adicionar todo: $e");
    }
  }


  Future<void> updateTodo(String id, TodosModelFirebase updatedTodo, String nameUser) async {
    try {
      await _firestoreService.update(id, updatedTodo);
      await fetchTodos(nameUser);
    } catch (e) {
      print("Erro ao atualizar todo: $e");
    }
  }

  Future<void> deleteTodo(String id, nameUser) async {
    try {
      await _firestoreService.delete(id);
      await fetchTodos(nameUser);
    } catch (e) {
      print("Erro ao deletar todo: $e");
    }
  }
}
