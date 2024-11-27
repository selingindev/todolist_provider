
import 'package:todolist_provider/shared/models/todos_model_firebase.dart';

abstract class IFirestoreService {
  Future<List<TodosModelFirebase>> getAll();
  Future<void> save(TodosModelFirebase todo);
  Future<String?> update(String data);
  Future<String?> delete(String date);
}