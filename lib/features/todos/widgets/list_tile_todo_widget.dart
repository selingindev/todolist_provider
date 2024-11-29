import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_provider/features/todos/controllers/controller_todo.dart';
import 'package:todolist_provider/features/todos/widgets/todo_checkbox_widget.dart';
import 'package:todolist_provider/shared/models/todos_model_firebase.dart';
import 'package:todolist_provider/shared/widgets/texts/text_widget.dart';
import 'todo_date_time_widget.dart';

class ListTileTodoWidget extends StatelessWidget {
  final TodosModelFirebase todo;

  const ListTileTodoWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ControllerTodo>();

    return ListTile(
      leading: TodoCheckboxWidget(todo),
      title: TextWidget(cfontSize: 18, todo.title),
      subtitle: TextWidget(cfontSize: 14, todo.description ?? ''),
      trailing: TodoDateTimeWidget(todo),
      textColor: Colors.black,
      minVerticalPadding: 16,
      onLongPress: () => _showDeleteConfirmationDialog(context, provider),
    );
  }

  // Exibe o alerta para confirmar a exclusão
  void _showDeleteConfirmationDialog(
      BuildContext context, ControllerTodo provider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Excluir tarefa'),
          content: const Text('Deseja realmente excluir esta tarefa?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                // Chama o método de exclusão e fecha o diálogo
                await provider.deleteTodo(todo.id!);
                Navigator.pop(context);
              },
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
  }
}
