import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? hint;
  final bool isTextArea;
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.title,
      this.hint,
      this.isTextArea = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: isTextArea ? 5 : 1,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
        alignLabelWithHint: isTextArea,
        label: Text(title),
      ),
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        if (value?.isEmpty ?? false) return "O campo precisa ser preenchido!";
        return null;
      },
    );
  }
}
