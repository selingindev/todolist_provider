import 'package:flutter/material.dart';
import 'package:todolist_provider/features/todos/widgets/list_tile_todo_widget.dart';
import 'package:todolist_provider/shared/models/todos_model.dart';

import 'package:todolist_provider/features/todos/widgets/todo_checkbox_widget.dart';

class TodosScreens extends StatelessWidget {
  final String title;

  const TodosScreens({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 34,
            ),
          ),
        ],
        elevation: 4,
      ),
      body: const ListTileTodoWidget(),
    );
  }
}
