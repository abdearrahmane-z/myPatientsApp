import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/view/loginPage/login_page.dart';
import 'package:my_patients/view/notifyPage/notify_Page.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.withOpacity(0.8),
      title: Text(
        "My Patients",
        style: AppTextStyles.appBarText,
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}