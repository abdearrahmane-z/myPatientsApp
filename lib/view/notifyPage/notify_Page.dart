import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/notification_controller.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/model/notify_page_data.dart';

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
          title: Text('Notifications', style: AppTextStyles.appBarText),
          backgroundColor: AppColors.appBarColor.withOpacity(0.8),
        ),
        backgroundColor: AppColors.backgroundColor,
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
                            // style: AppTextStyles.errorText,
                          ),
                        )
                      : ListView.builder(
                          itemCount: notificationController.notifications.length,
                          itemBuilder: (context, index) {
                            return NotifyWidget(
                              notification:
                                  notificationController.notifications[index],
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

