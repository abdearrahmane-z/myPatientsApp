import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.id});
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
      ),
      body: Center(
        child: Text(
          'Patient ID: ${id ?? 'Unknown'}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}