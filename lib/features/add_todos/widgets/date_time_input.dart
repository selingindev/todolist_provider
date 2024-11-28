import 'package:flutter/material.dart';
import 'package:todolist_provider/shared/widgets/inputs/text_input_widget.dart';

class DateTimeInput extends StatelessWidget {
  final TextEditingController controllerDate;
  final FocusNode dateFn;
  final void Function() addToDo;
  final void Function(DateTime date) setDate;
  const DateTimeInput({ super.key, required this.controllerDate, required this.dateFn, required this.addToDo, required this.setDate });

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      controller: controllerDate,
      focusNode: dateFn,
      label: 'Data',
      validator: (String? value) {
        if (value == null || value.isEmpty) return 'Preencha este Campo';
        return null;
      },
      onFieldSubmitted: (_) => addToDo(),
      textInputAction: TextInputAction.send,
      readOnly: true,
      onTap: ()async {
        final DateTime? date = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365 * 10),
          ),
        );
        String textDate = '';
    
        if (date != null){
          setDate(date);
          textDate = date.toIso8601String();
        }
        controllerDate.text = textDate;
        dateFn.unfocus();
      },
    );
  }
}
