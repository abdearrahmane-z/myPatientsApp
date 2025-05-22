import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded( // Make the button expand in width
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20), // Adjust vertical padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.red,
            ),
            child: Text(text, style: TextStyle(color: Colors.white),),
          ),
        ),
      ],
    );
  }
}