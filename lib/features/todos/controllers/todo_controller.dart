import 'package:todolist_provider/shared/interfaces/done_todos_local_storage_interface.dart';
import 'package:todolist_provider/shared/interfaces/todos_local_storage_interface.dart';
import 'package:todolist_provider/shared/models/todos_model.dart';

class TodoController {
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
    }
  }
}
