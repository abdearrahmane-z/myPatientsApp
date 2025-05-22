import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/notification_controller.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';

import 'widgets/notify_item.dart';

class NotifyPage extends StatelessWidget {
  const NotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController notificationController = Get.put(
      NotificationController(),
  );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: AppColors.secondaryColor,
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo.png', // Make sure this path is correct and added in pubspec.yaml
                height: 40,
              ),
              const SizedBox(width: 10),
              Text(
                "Mes Notifications",
                style: AppTextStyles.appBarText,
              ),
            ],
          ),
          backgroundColor: AppColors.appBarColor,
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: Obx(
      () => notificationController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : notificationController.isError.value
              ? Center(
                  child: Text(
                    'Error loading notifications',
                  ),
                )
              : notificationController.notifications.isEmpty
                  ? Center(
                      child: Text(
                        'Aucune notification trouvée',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: notificationController.notifications.length,
                      itemBuilder: (context, index) {
                        return NotifyWidget(
                          notification: notificationController.notifications[index],
                        );
                      },
                    ),
    ),
          ),
        ),
      )
    );
  }
}

