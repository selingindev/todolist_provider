import 'package:flutter/material.dart';
import 'package:todolist_provider/features/todos/widgets/todo_checkbox_widget.dart';
import 'package:todolist_provider/shared/models/todos_model_firebase.dart';
import 'package:todolist_provider/shared/widgets/texts/text_widget.dart';
import 'todo_date_time_widget.dart';


class ListTileTodoWidget extends StatelessWidget {
  final TodosModelFirebase todo;

  const ListTileTodoWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading: TodoCheckboxWidget(todo),
          title: TextWidget(cfontSize:18,todo.title),
          subtitle: TextWidget(cfontSize: 14, todo.description ?? ''), 
          trailing: TodoDateTimeWidget(todo),
          textColor: Colors.white,
          onLongPress: () => print("tapcheck"),
          minVerticalPadding: 16,

        );
  }
}

