import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todolist_provider/features/todos/screens/todos_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ToDo List',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 89, 47, 161),
            surface: const Color.fromARGB(255, 29, 28, 28)),
        useMaterial3: true,
      ),
      home: const TodosScreens(title: 'Lista de Tarefas - Arthur Selingin'),
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}
