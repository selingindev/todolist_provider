import 'package:flutter/material.dart';
import 'package:todolist_provider/features/todos/widgets/todo_checkbox_widget.dart';
import 'package:todolist_provider/shared/models/todos_model.dart';
import 'package:todolist_provider/shared/models/widgets/texts/text_widget.dart';
import 'todo_date_time_widget.dart';

final List<TodosModel> todos = [
  TodosModel(title: 'Sou uma tarefa complicada', description: 'voce consegue'),
  TodosModel(title: 'ok', description: 'ok'),
  TodosModel(title: 'Sou uma tarefa complicada', description: 'voce cnsegue'),
  TodosModel(title: 'ok', description: 'ok'),
  TodosModel(title: 'ok', description: 'ok'),
  TodosModel(title: 'ok', description: 'ok'),
  TodosModel(title: 'Sou uma tarefa complicada', description: 'voce cnsegue'),
];

class ListTileTodoWidget extends StatelessWidget {
  const ListTileTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (_, int index) {
        final todo = todos[index];
        return ListTile(
          leading: TodoCheckboxWidget(todo),
          title: TextWidget(cfontSize:20,todo.title),
          subtitle: TextWidget(cfontSize: 16, todo.description ?? ''), 
          trailing: TodoDateTimeWidget(todo),
          textColor: Colors.white,
          onLongPress: () => {
            print("artu")
          },
        );
      },
    );
  }
}
