import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';

class RealTimeValue extends StatelessWidget {
  const RealTimeValue({super.key, required this.tension});
  final double tension;// Example tension value

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
        Text('Tension en temps réel',
                style: TextStyle(fontSize: 20.spMin, fontWeight: FontWeight.bold),
            ),
        SizedBox(height: screenHeight * 0.01),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.appBarColor.withOpacity(0.0),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.appBarColor.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 1), // changes position of shadow
              ),
              
            ],
          ),
          child:
              Text(
                '$tension mmHg',
                style: AppTextStyles.detailText,
              ),
            
        ),
      ],
    );
  }
}