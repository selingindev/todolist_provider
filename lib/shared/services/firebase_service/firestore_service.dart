import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist_provider/shared/interfaces/firestore_interface/i_firestore_service.dart';
import 'package:todolist_provider/shared/models/todos_model_firebase.dart';

class FirestoreService implements IFirestoreService {
  var service = FirebaseFirestore.instance.collection('todos');

  @override
Future<List<TodosModelFirebase>> getAll(String name,{bool? filtrar, bool? isDone}) async {
  try {
    // Inicia a consulta com o filtro padrão pelo nome do usuário
    var query = service.where('user', isEqualTo: name);

     if (filtrar == true) {
      query = query.where("isdone", isEqualTo: isDone);
    }

    final snapshot = await query.get(const GetOptions(source: Source.server));
    print('Procurando todo... para $name com filtro isDONE = $isDone');
    print('Total de todos encontrados: ${snapshot.docs.length}');

    if (snapshot.docs.isNotEmpty) {
      final List<TodosModelFirebase> todos = snapshot.docs.map((doc) {
        final todo = TodosModelFirebase.fromMap(doc.data());
        todo.id = doc.id;
        return todo;
      }).toList();
      return todos;
    } else {
      return [];
    }
  } catch (e) {
    print('Erro ao pegar todos : $e');
    return [];
  }
}



  @override
  Future<void> save(TodosModelFirebase todo) async {
    try {
      await service.add(todo.toMap());
    } catch (e) {
      // TODO
      print("Erro ao salvar todo: $e");
    }
  }

  @override
  Future<String?> delete(String id) async {
    try {
      await service.doc(id).delete();
      return 'Sucesso';
    } catch (e) {
      return 'Error ao deletar: $e';
    }
  }

  @override
  Future<String?> update(String id, TodosModelFirebase newValues) async {
    try {
      await service.doc(id).update(newValues.toMap());
      return 'Sucesso';
    } catch (e) {
      return "Erro ao atualizar: $e";
    }
  }
}
