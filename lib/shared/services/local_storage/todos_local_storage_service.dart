import 'package:todolist_provider/shared/interfaces/local_storage_interface.dart';
import 'package:todolist_provider/shared/interfaces/todos_local_storage_interface.dart';
import 'package:todolist_provider/shared/models/todos_model.dart';

class TodosLocalStorageService implements ITodosLocalStorageService{
  final ILocalStorageService _ILocalStorageService;
  
  TodosLocalStorageService(this._ILocalStorageService);
  
  
  Future<String?> setTodos(List<TodosModel> todos) async{

  };
    

}