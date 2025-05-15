import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.data});
  final Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
      ),
      body: Center(
        child: Text(
          'Patient Name: ${data?['name'] ?? 'Unknown'}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}