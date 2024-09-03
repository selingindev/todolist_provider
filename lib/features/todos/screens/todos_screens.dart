import 'package:flutter/material.dart';
import 'package:todolist_provider/features/todos/widgets/list_tile_todo_widget.dart';


class TodosScreens extends StatefulWidget {
  final String title;

  const TodosScreens({super.key, required this.title});

  @override
  State<TodosScreens> createState() => _TodosScreensState();
}

class _TodosScreensState extends State<TodosScreens> {

  
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
        title: Text(widget.title),
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
