import 'package:flutter/material.dart';
import 'package:todolist_provider/shared/interfaces/done_todos_local_storage_interface.dart';
import 'package:todolist_provider/shared/interfaces/todos_local_storage_interface.dart';
import 'package:todolist_provider/shared/models/todos_model.dart';

class TodoController extends ChangeNotifier {
  final ITodosLocalStorageService _iTodosLocalStorageService;
  final IDoneTodosLocalStoragesService _iDoneTodosLocalStoragesService;

  TodoController(
      this._iDoneTodosLocalStoragesService, this._iTodosLocalStorageService);

  final List<TodosModel> todos = [];
  final List<String> doneTodos = [];

  Future<String?> loadTodos() async {
    final (String? error, List<TodosModel>? loadedTodos) =
        await _iTodosLocalStorageService.getTodos();

    if (error == null) {
      todos
        ..clear()
        ..addAll(loadedTodos!);

      sortTodosByDate();
    }
    return null;
  }

  void sortTodosByDate() {
    todos.sort((todoA, todoB) => todoA.date.compareTo(todoB.date));
    notifyListeners();
  }

  Future<String?> loadDoneTodos() async {
    final (String? error, List<String>? loadedDoneTodos) =
        await _iDoneTodosLocalStoragesService.getDoneTodos();
    if (error == null) {
      doneTodos
        ..clear()
        ..addAll(loadedDoneTodos!);
    }
    return error;
  }

  Future<String?> addTodos(TodosModel todo) async {
    todos.add(todo);
    final String? error = await saveTodos();

    if (error == null) {
      sortTodosByDate();
    }

    return error;
  }

  Future<String?> saveTodos() {
    return _iTodosLocalStorageService.setTodos(todos);
  }

  bool isChecked(String id) {
    return doneTodos.indexWhere((checkedTodoId) => checkedTodoId == id) != -1;
  }

  Future<String?> checkTodo(String id) async {
    if (!isChecked(id)) {
      doneTodos.add(id);
    } else {
      doneTodos.removeWhere((isChecked) => isChecked == id);
    }
    final String? error =
        await _iDoneTodosLocalStoragesService.setDoneTodos(doneTodos);

    if (error == null) {
      notifyListeners();
    }
    
    //erro
      if (isChecked(id)) {
        doneTodos.add(id);
      } else {
        doneTodos.removeWhere((isChecked) => isChecked == id);
      } 
      return error;
  }
}
