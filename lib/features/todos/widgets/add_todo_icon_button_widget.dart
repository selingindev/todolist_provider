import 'package:flutter/material.dart';

class AddTodoIconButtonWidget extends StatelessWidget {
  final void Function() goToAddTodoScreen;
  const AddTodoIconButtonWidget({ required this.goToAddTodoScreen, super.key});
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
            onPressed: 
            goToAddTodoScreen,
    tooltip: 'Adicionar Tarefa',
            icon: const Icon(
              Icons.add,
              color: Colors.red,
              size: 48,
            
            ),
          );
  }
}