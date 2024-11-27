import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_provider/features/todos/controllers/todo_controller.dart';
import 'package:todolist_provider/shared/models/todos_model.dart';
import 'package:todolist_provider/shared/widgets/inputs/text_input_widget.dart';
import 'package:todolist_provider/shared/widgets/texts/text_widget.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
    final _formKey = GlobalKey<FormState>();
    final _titleTEC = TextEditingController();
    final _titleFN  = FocusNode();
    
    final _descTEC =  TextEditingController();
    final _descFN  = FocusNode();
    
    final _todoDateTEC = TextEditingController();
    final _todoDateFN  = FocusNode();
    
    late DateTime todoDate;

    @override
  void dispose() {
      _titleTEC.dispose();
      _titleFN.dispose();
      _descTEC.dispose();
      _descFN.dispose();
      _todoDateTEC.dispose();
      _todoDateFN.dispose();
    
        super.dispose();
  }
  Future<void> _addTodo(BuildContext context) async{
    if(_formKey.currentState!.validate()){
      final todosCtrl = Provider.of<TodoController>(context, listen:false);
      final String? error = await todosCtrl.addTodos(TodosModel(title: _titleTEC.text, description: _descTEC.text , cDate: todoDate));
      
    if(context.mounted){
      if(error != null){

      }else{ 
        Navigator.of(context).pop();
      }
    }
    }
  }
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
          child: Column(
            children: [
              TextInputWidget(controller: TextEditingController(), focusNode:FocusNode(), label: 'Título'),
            ],
          )),
        ),
      )
    );
  }
}