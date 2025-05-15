import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/view/loginPage/login_page.dart';
import 'package:my_patients/view/notifyPage/notify_Page.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "My Patients",
        style: AppTextStyles.appBarText,
      ),
  
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.black),
          onPressed: () {
            Get.to(() => NotifyPage());
          },
        ),
        IconButton(
          icon: const Icon(Icons.logout_outlined, color: Colors.black),
          onPressed: () {
            Get.offAll(() => LoginPage());
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}