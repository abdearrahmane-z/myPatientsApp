import 'package:flutter/material.dart';
import 'package:my_patients/core/constants/colors.dart';

class MyButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton2({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 700),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ), // Adjust vertical padding
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: AppColors.appBarColor,
        ),
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
    ;
  }
}
