import 'package:todolist_provider/shared/models/todos_model.dart';

abstract class ITodosLocalStorageService {
  Future<String?> setTodos(List<TodosModel> todos);
  Future<(String? error, List<TodosModel>? todos)> getTodos(); 
}   