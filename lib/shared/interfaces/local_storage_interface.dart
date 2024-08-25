abstract class ILocalStorageService {
  Future<void> set(String key, String? data);
  Future<String?> get(String key);
}