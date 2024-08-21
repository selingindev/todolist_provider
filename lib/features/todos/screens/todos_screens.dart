import 'package:flutter/material.dart';

class TodosScreens extends StatelessWidget {
  final String title;

  const TodosScreens({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Container(),
    );
  }
}
