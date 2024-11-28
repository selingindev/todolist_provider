import 'package:flutter/material.dart';
import 'package:todolist_provider/shared/widgets/inputs/text_input_widget.dart';

class DescriptionInputText extends StatelessWidget {
  final TextEditingController descriptionTEC;
  final FocusNode descFN;
  final FocusNode dateFN;

  const DescriptionInputText({ super.key, required this.descFN, required this.descriptionTEC, required this.dateFN });

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      controller: descriptionTEC,
      focusNode: descFN,
      label: 'Descrição',
      autoFocus: true,
      textCapitalization: TextCapitalization.sentences,
      onFieldSubmitted: (_) => dateFN.requestFocus(),
      maxLines: 6,
      minLines: 4,
    );
  }
}