import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_provider/features/add_todos/screens/add_todo_screen.dart';
import 'package:todolist_provider/features/todos/controllers/controller_todo.dart';
import 'package:todolist_provider/features/todos/widgets/add_todo_icon_button_widget.dart';
import 'package:todolist_provider/features/todos/widgets/list_tile_todo_widget.dart';
import 'package:todolist_provider/features/todos/widgets/loading_error_widget.dart';
import 'package:todolist_provider/shared/widgets/texts/text_widget.dart';

class TodosScreens extends StatefulWidget {
  final String title;

  const TodosScreens({super.key, required this.title});

  @override
  State<TodosScreens> createState() => _TodosScreensState();
}

class _TodosScreensState extends State<TodosScreens> {
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadTodosAndDonesTodos();
    });
  }

  

  Future<void> loadTodosAndDonesTodos() async {
    isLoading = true;
    error = null;

    final todoCtrl = context.read<ControllerTodo>();
    final String? errorLoadingTodos = await todoCtrl.fetchTodos();

    

    if (errorLoadingTodos != null ) {
      setState(() {
        error = errorLoadingTodos;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void _goToAddTodoScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AddTodoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todosCrtl = context.watch<ControllerTodo>();
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
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      })
                    ],
                  ),
                ),
              );
            }, 
            icon: const Icon(Icons.person), 
            tooltip: 'Editar Perfil',
          ),
          const SizedBox(width: 12,)
        ],
        elevation: 4,
      ),
      floatingActionButton: AddTodoIconButtonWidget(goToAddTodoScreen: _goToAddTodoScreen),
  
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: isLoading || error != null
                  ? LoadingErrorWidget(
                      isLoading: isLoading,
                      error: error,
                      loadTodosAndDoneTodos: loadTodosAndDonesTodos)
                  : todosCrtl.todos.isEmpty
                      ? const Center(
                          child: TextWidget(
                            'Você não possui ou não adicionou nenhuma tarefa!',
                            
                            cfontSize: 18.0,
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: todosCrtl.todos.length,
                          itemBuilder: (_, int index) {
                            final todo = todosCrtl.todos[index];
          
                            return ListTileTodoWidget(todo);
                          },
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
