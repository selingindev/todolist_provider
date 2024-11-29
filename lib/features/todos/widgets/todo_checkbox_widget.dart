import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_provider/features/todos/controllers/controller_todo.dart';
import 'package:todolist_provider/shared/models/todos_model_firebase.dart';

class TodoCheckboxWidget extends StatefulWidget {
  final TodosModelFirebase todo;
  const TodoCheckboxWidget(this.todo, {super.key});

  @override
  State<TodoCheckboxWidget> createState() => _TodoCheckboxWidgetState();
}

class _TodoCheckboxWidgetState extends State<TodoCheckboxWidget> {
  late bool isDone;

  @override
  void initState() {
    super.initState();
    isDone = widget.todo.isDone; // Inicialize o estado local
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ControllerTodo>();

    return Checkbox(
      value: isDone,
      onChanged: (bool? newValue) async {
        setState(() {
          isDone = newValue!;
        });
        widget.todo.isDone = newValue!;
        try {
          print(widget.todo.id);
  await provider.updateTodo(widget.todo.id!, widget.todo);
}  catch (e) {
  // TODO
  print('Erro na safada: $e');
}
      },
    );
  }
}
