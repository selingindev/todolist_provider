import 'package:flutter/material.dart';
import 'package:todolist_provider/shared/models/todos_model.dart';
import 'package:intl/intl.dart';
import 'package:todolist_provider/shared/widgets/texts/text_widget.dart';

class TodoDateTimeWidget extends StatelessWidget {
  final TodosModel todo;

  const TodoDateTimeWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    // Função para formatar a data no formato dia/mês/ano
    String formatarData(DateTime date) {
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      return formatter.format(date);
    }

    // Retorna o widget Text com a data formatada
    return TextWidget(cfontSize: 12, formatarData(todo.date),
    );
  }
}
