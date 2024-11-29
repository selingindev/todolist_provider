
import 'package:todolist_provider/shared/models/todos_model_firebase.dart';

abstract class IFirestoreService {
  Future<List<TodosModelFirebase>> getAll(String name,{bool? filtrar, bool? isDone});
  Future<void> save(TodosModelFirebase todo);
  Future<String?> update(String title, TodosModelFirebase newValues);
  Future<String?> delete(String title);
}