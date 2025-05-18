import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoriqueWidget extends StatelessWidget {
  const HistoriqueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Historique',
          style: TextStyle(
            fontSize: 20.spMin,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: ListView.builder(
            itemCount: 10, // Replace with your data length
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Historique Item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}