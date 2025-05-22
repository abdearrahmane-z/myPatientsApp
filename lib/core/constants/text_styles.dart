import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patients/core/constants/colors.dart';

class AppTextStyles {
  
  static TextStyle appBarText = TextStyle(
        fontFamily: 'Italianno',
        fontSize: 35.spMin,
        color: Colors.white,
        fontWeight: FontWeight.w300
      );

  static TextStyle notificationTime = TextStyle(
        fontFamily: 'Ancizar',
        fontSize: 12.spMin,
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.w300
      );
  static TextStyle username = TextStyle(
        fontSize: 25.spMin,
        color: Colors.black,
        fontWeight: FontWeight.w700
      );
    static TextStyle detailText = TextStyle(
        fontFamily: 'Ancizar',
        fontSize: 20.spMin,
        color: AppColors.secondaryColor,
      );
  static TextStyle paragraph = TextStyle(
        fontFamily: 'Ancizar',
        fontSize: 15.spMin,
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.w300
      );
  static TextStyle detailTitle = TextStyle(
        fontFamily: 'Ancizar',
        fontSize: 20.spMin,
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.w300
      );
  static TextStyle detailSubtitle = TextStyle(
        fontFamily: 'Ancizar',
        fontSize: 15.spMin,
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.w300
      );

      



}