import 'package:flutter/material.dart';

class AddTodoIconButtonWidget extends StatelessWidget {
     final void Function() goToAddTodoScreen;
  const AddTodoIconButtonWidget({ required this.goToAddTodoScreen, super.key});
  
  @override
  Widget build(BuildContext context) {
 
    return IconButton(
            onPressed: 
            goToAddTodoScreen,

            icon: const Icon(
              Icons.add,
              size: 34,
            ),
          );
  }
}