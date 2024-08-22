import 'package:flutter/material.dart';

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
            width: 1)),
        title: Text(title),
        actions: [
          IconButton(onPressed: () {}, 
          icon: const Icon(Icons.add,
          size: 34)
          )],
        elevation: 4,
      ),
      body: Container(),
    );
  }
}
