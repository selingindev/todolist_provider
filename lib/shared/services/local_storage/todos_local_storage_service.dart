import 'dart:convert';
import 'dart:developer';
import 'package:todolist_provider/shared/const/menssage_const.dart';
import 'package:todolist_provider/shared/errors/local_storage_exception.dart';
import 'package:todolist_provider/shared/interfaces/local_storage_interface.dart';
import 'package:todolist_provider/shared/interfaces/todos_local_storage_interface.dart';
import 'package:todolist_provider/shared/models/todos_model.dart';

class TodosLocalStorageService implements ITodosLocalStorageService {
  final todosKey = "todos";

  final ILocalStorageService _iLocalStorageService;

  TodosLocalStorageService(this._iLocalStorageService);

  @override
  Future<String?> setTodos(List<TodosModel> todos) async {
    try {
      final String data = jsonEncode(
        todos.map((todo) => todo.toMap()).toList(),
      );
      await _iLocalStorageService.set(todosKey, data);
      return null;
    } on LocalStorageException {
      return "Erro ao Salvar Tarefas";
    } catch (error, st) {
      log("Error Saving todos", error: error, stackTrace: st);
      return defaultErrorMenssage;
    }
  }

  @override
  Future<(String? error, List<TodosModel>? todos)> getTodos() async {
    try {
      final String? todosJson = await _iLocalStorageService.get(todosKey);
      if (todosJson != null) {
        final todos = (jsonDecode(todosJson) as List)
            .map<TodosModel>((todo) => TodosModel.fromMap(todo))
            .toList();
        return (null, todos);
      }
      return (null, <TodosModel>[]);
    } on LocalStorageException {
      return ("Erro ao Salvar Tarefas", null);
    } catch (error, st) {
      log("Error Saving todos", error: error, stackTrace: st);
      return (defaultErrorMenssage, null);
    }
  }
}
