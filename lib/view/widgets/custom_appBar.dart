import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/view/loginPage/login_page.dart';

import '../../core/constants/colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo.png', // Make sure this path is correct and added in pubspec.yaml
            height: 40,
          ),
          const SizedBox(width: 10),
          Text("Mes patients", style: AppTextStyles.appBarText),
        ],
      ),
      backgroundColor: AppColors.appBarColor,

      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          color: Colors.white,
          onPressed: () => Get.offAll(() => LoginPage()),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
