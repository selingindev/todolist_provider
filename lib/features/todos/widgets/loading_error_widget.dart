import 'package:flutter/material.dart';
import 'package:todolist_provider/features/todos/widgets/is_loading.widget.dart';
import 'package:todolist_provider/shared/widgets/texts/text_widget.dart';

class LoadingErrorWidget extends StatelessWidget {
 
  final bool isLoading;
  final String? error;
  final void Function() loadTodosAndDoneTodos;

  const LoadingErrorWidget({super.key, required this.isLoading, this.error, required this.loadTodosAndDoneTodos});
 
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading ? const IsLoadingWidgets() : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(error!, textAlign: TextAlign.center,),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: loadTodosAndDoneTodos,
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.red),
          ), child: const TextWidget('Tentar novamente'), ),
        ],
      )
    ) ;
  }
}