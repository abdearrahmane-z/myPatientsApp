import 'package:flutter/material.dart';

void showGlobalSnackBar(BuildContext context, String message, Color color) {
  // Check if context is still mounted (Flutter 3.7+)
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    ),
  );
}