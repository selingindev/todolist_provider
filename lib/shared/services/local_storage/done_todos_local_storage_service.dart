import 'dart:convert';
import 'dart:developer';

import 'package:todolist_provider/shared/const/menssage_const.dart';
import 'package:todolist_provider/shared/errors/local_storage_exception.dart';
import 'package:todolist_provider/shared/interfaces/done_todos_local_storage_interface.dart';
import 'package:todolist_provider/shared/interfaces/local_storage_interface.dart';

class DoneTodosLocalStorageService implements IDoneTodosLocalStoragesService {
  final doneTodosKey = "doneTodosKey";

  final ILocalStorageService _iLocalStorageService;

  DoneTodosLocalStorageService(this._iLocalStorageService);

  @override
  Future<String?> setDoneTodos(List<String> doneTodo) async {
    try {
      final String data = jsonEncode(doneTodo);
      await _iLocalStorageService.set(doneTodosKey, data);
      return null;
    } on LocalStorageException {
      return "Erro ao Salvar Tarefas Feitas";
    } catch (error, st) {
      log("Error Saving todos", error: error, stackTrace: st);
      return defaultErrorMenssage;
    }
  }

  @override
  Future<(String? error, List<String>? todos)> getDoneTodos() async {
    try {
      final String? doneTodosJson = await _iLocalStorageService.get(doneTodosKey);
      if (doneTodosJson != null) {
        final doneTodos = (jsonDecode(doneTodosJson) as List).cast<String>();
        
      return (null, doneTodos);
      }
      return(null, <String>[]);
    } on LocalStorageException {
      return ("Erro ao carregar Tarefas Feitas", null);
    } catch (error, st) {
      log("Error Saving todos", error: error, stackTrace: st);
      return (defaultErrorMenssage, null);
    }
  }
  
}