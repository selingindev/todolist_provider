import 'package:todolist_provider/shared/models/todos_model.dart';

abstract class ITodosLocalStorageService {
 Future<String?> setTodos(List<TodosModel> todos);
}