import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todolist_provider/features/todos/controllers/todo_controller.dart';
import 'package:todolist_provider/features/todos/screens/auth_gate.dart';
import 'package:todolist_provider/shared/services/local_storage/done_todos_local_storage_service.dart';
import 'package:todolist_provider/shared/services/local_storage/local_storage_service.dart';
import 'package:todolist_provider/shared/services/local_storage/todos_local_storage_service.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider (
      create: (_) => TodoController(
        DoneTodosLocalStorageService(
          LocalStorageService(),
          ),
        TodosLocalStorageService(
        LocalStorageService(),),
      ),
      child: MaterialApp(
        title: 'Flutter ToDo List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            foregroundColor: Color.fromARGB(255, 0, 0, 0),
            backgroundColor: Colors.white
          ),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 39, 126, 249),
              surface: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        home: const AuthGate(),
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
        supportedLocales: const [Locale('pt', 'BR')],
      ),
    );
  }
}
