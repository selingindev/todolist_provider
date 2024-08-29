abstract class IDoneTodosLocalStoragesService {
  Future<String?> setDoneTodos(List<String> doneTodo);
  Future<(String? error, List<String>? todos)> getDoneTodos();
}