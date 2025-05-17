import 'package:flutter/material.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.id});
  final String? id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nom Patient', style: AppTextStyles.appBarText),
          backgroundColor: AppColors.appBarColor,
        ),
        body: Center(
          child: Text(
            'ID Patient: ${id ?? 'Inconnu'}',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}