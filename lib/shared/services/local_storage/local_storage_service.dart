import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todolist_provider/shared/errors/local_storage_exception.dart';

const storage = FlutterSecureStorage();

class LocalStorageService {
  Future<void> set(String key, String? data) async {
    try {
      await storage.write(key: key, value: 'data');
    } catch (error, st) {
      final errorMensage = "Error storing data: $data with key $key";
      log(errorMensage, error: error, stackTrace: st);
      throw LocalStorageException(errorMensage);
    }
  }

  Future<String?> get(String key) async {
    try {
      return await storage.read(key: key);
    } catch (error, st) {
      final errorMensage = "Erro reading key: $key";
      log(errorMensage, error: error, stackTrace: st);
      throw LocalStorageException(errorMensage);
    }
  }
}
