import 'package:flutter/material.dart';

class AddTodoIconButtonWidget extends StatelessWidget {
  const AddTodoIconButtonWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
            onPressed: () {
              
            },
            icon: const Icon(
              Icons.add,
              size: 34,
            ),
          );
  }
}