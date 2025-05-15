import 'package:flutter/material.dart';

class NotifyPage extends StatelessWidget {
  const NotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'No Notifications',
          style: TextStyle(fontSize: 24),
        ),
      ),
    ));
  }
}