
import 'package:todolist_provider/shared/interfaces/local_storage_interface.dart';

class TodosFirestore implements ILocalStorageService{
  @override
  Future<String?> get(String key) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<void> set(String key, String? data) {
    // TODO: implement set
    throw UnimplementedError();
  }

}