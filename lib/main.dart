import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todolist_provider/features/todos/controllers/todo_controller.dart';
import 'package:todolist_provider/features/todos/screens/todos_screens.dart';
import 'package:todolist_provider/shared/services/local_storage/done_todos_local_storage_service.dart';
import 'package:todolist_provider/shared/services/local_storage/local_storage_service.dart';
import 'package:todolist_provider/shared/services/local_storage/todos_local_storage_service.dart';
import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
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
              seedColor: const Color.fromARGB(255, 89, 47, 161),
              surface: const Color.fromARGB(255, 29, 28, 28)),
          useMaterial3: true,
        ),
        home: const TodosScreens(title: 'Lista de Tarefas'),
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
        supportedLocales: const [Locale('pt', 'BR')],
      ),
    );
  }
}
