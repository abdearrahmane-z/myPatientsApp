import 'package:flutter/material.dart';
import 'package:my_patients/core/constants/colors.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextEditingController textController;
  final String? Function(String?)? validator; // Added validator parameter

  const MyTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    required this.textController,
    this.validator, // Initialize validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.inputColor,
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(),
        ),
      ),
      obscureText: obscureText,
      textAlign: TextAlign.center,
      validator: validator, // Add validator to TextFormField
    );
  }
}
