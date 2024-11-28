import 'package:flutter/material.dart';
import 'package:todolist_provider/shared/widgets/inputs/text_input_widget.dart';

class TitleInputText extends StatelessWidget {
  final TextEditingController titleTEC;
  final FocusNode titleF;
  final FocusNode descriptionFN;

  const TitleInputText({ super.key, required this.titleTEC, required this.titleF, required this.descriptionFN });

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      controller: titleTEC,
      focusNode: titleF,
      label: 'Título',
      autoFocus: true,
      textCapitalization: TextCapitalization.words,
      onFieldSubmitted: (_) => descriptionFN.requestFocus(),
      validator: (String? value) {
        if( value == null || value.isEmpty)return 'Preencha este Campo';
        return null;
      },
    );
  }
}