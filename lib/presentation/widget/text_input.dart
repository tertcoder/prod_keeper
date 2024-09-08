import 'package:flutter/material.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const TextInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please complete $hintText';
        }
        return null;
      },
      cursorColor: ColorPallette.textColor,
      decoration: InputDecoration(
        fillColor: ColorPallette.textColor.withOpacity(0.1),
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
