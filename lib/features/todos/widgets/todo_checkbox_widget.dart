import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_provider/features/todos/controllers/controller_todo.dart';
import 'package:todolist_provider/shared/models/todos_model_firebase.dart';

class TodoCheckboxWidget extends StatelessWidget {
  final TodosModelFirebase todo;
  const TodoCheckboxWidget(this.todo, {super.key});
  
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ControllerTodo>();
    return Checkbox(
      value: todo.isDone, 
      onChanged: (bool? isDone) { 
        todo.isDone = isDone!;
        provider.updateTodo(todo.id!, todo);
      },
    );
  }
}