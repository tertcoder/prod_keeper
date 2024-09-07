import 'package:flutter/material.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  const TextInput({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
