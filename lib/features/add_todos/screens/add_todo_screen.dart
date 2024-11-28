import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_provider/features/add_todos/widgets/date_time_input.dart';
import 'package:todolist_provider/features/add_todos/widgets/description_input_text.dart';
import 'package:todolist_provider/features/add_todos/widgets/title_input_text.dart';
import 'package:todolist_provider/features/todos/controllers/controller_todo.dart';
import 'package:todolist_provider/shared/models/todos_model_firebase.dart';
import 'package:todolist_provider/shared/widgets/texts/text_widget.dart';

class AddTodoScreen extends StatefulWidget {
  
  const AddTodoScreen({super.key,});

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
    final auth = FirebaseAuth.instance;
    

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

  Future<void> _addTodo() async{
    if(_formKey.currentState!.validate()){
      final todosCtrl = Provider.of<ControllerTodo>(context, listen:false);
      final user = auth.currentUser;
      final name = user!.displayName ?? user.email;
      final bool error = await todosCtrl.addTodo(
        TodosModelFirebase(
          description: _descTEC.text, 
          title: _titleTEC.text,
          date: todoDate, 
          isDone: false, 
          userName: name!,
        ), 
      );
      if (context.mounted) {
        if(error){
          Navigator.of(context).pop();
        }else{
          print("Deu meu pode olhar no console ai zé");
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'Criar uma nova tarefa',
          ccolor: Colors.black,
          cfontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TitleInputText(
                  titleTEC: _titleTEC,
                  titleF: _titleFN,
                  descriptionFN: _descFN,
                ),
                const SizedBox(
                  height: 16,
                ),
                DescriptionInputText(
                  descFN: _descFN,
                  descriptionTEC: _descTEC,
                  dateFN: _todoDateFN,
                ),
                const SizedBox(
                  height: 16,
                ),
                DateTimeInput(
                  controllerDate: _todoDateTEC,
                  dateFn: _todoDateFN,
                  addToDo: _addTodo,
                  setDate: (DateTime date) {
                    todoDate = date;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Text("Adicionar Tarefa"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}