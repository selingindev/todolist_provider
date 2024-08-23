import 'package:flutter/material.dart';
import 'package:todolist_provider/shared/models/todos_model.dart';

class TodoCheckboxWidget extends StatelessWidget {
  final TodosModel todo;
  const TodoCheckboxWidget(this.todo, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Checkbox(value: false, onChanged: (bool? isDone)=> print('art'));
  }
}