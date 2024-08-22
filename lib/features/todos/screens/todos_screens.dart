import 'package:flutter/material.dart';
import 'package:todolist_provider/shared/models/todos_model.dart';

import '../widgets/todo_checkbox_widget.dart';

final List<TodosModel> todos = [
  TodosModel(title: 'Sou uma tarefa complicada', description: 'voce consegue'),
  TodosModel(title: 'ok', description: 'ok')
];

class TodosScreens extends StatelessWidget {
  final String title;

  const TodosScreens({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 34,
            ),
          ),
        ],
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (_, int index) {
          final todo = todos[index];

          return ListTile(
             leading: TodoCheckboxWidget(todo),
            title:  Text(todo.title ?? ''),
            subtitle: Text(todo.description ??  ''), // Substitua pelo subtítulo desejado
            textColor: Colors.white,
          );
        },
      ),
    );
  }
}
