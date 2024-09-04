import 'package:flutter/material.dart';
import 'package:todolist_provider/shared/widgets/inputs/text_input_widget.dart';
import 'package:todolist_provider/shared/widgets/texts/text_widget.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
    final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Criar uma nova tarefa', ccolor: Colors.black, cfontSize: 20,),
      ), 
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: const Column(
            children: [
              TextInputWidget(controller: controller, focusNode: focusNode, label: 'Título'),
            ],
          )),
        ),
      )
    );
  }
}