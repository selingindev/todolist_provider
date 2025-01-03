import 'package:flutter/material.dart';
import 'package:todolist_provider/shared/widgets/texts/text_widget.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  const TextInputWidget(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.label,
      this.readOnly = false,
      this.autoFocus = false,
      this.textCapitalization = TextCapitalization.none,
      this.validator,
      this.onFieldSubmitted,
      this.maxLines,
      this.minLines,
      this.textInputAction = TextInputAction.next,
      this.onTap});
  final FocusNode focusNode;
  final String label;
  final bool autoFocus;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final bool readOnly;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autoFocus,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        label: TextWidget(label),
        border: const OutlineInputBorder(),
      ),
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      minLines: minLines,
      maxLines: maxLines,
      onTap: onTap,
      readOnly: readOnly,
      
    );
  }
}
