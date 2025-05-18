import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/notification_controller.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/model/notify_page_data.dart';

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

class NotifyWidget extends StatelessWidget {
  const NotifyWidget({super.key, required this.notification});

  final Notify notification;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        // Handle tap event
      },
      child: Card(
        margin: EdgeInsets.all(5.spMin),
        child: ListTile(
          leading: Icon(Icons.notifications, color: AppColors.secondaryColor),
          title: Text(
            notification.patientName,
            style: AppTextStyles.notificationTitle,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.notificationMessage,
                style: AppTextStyles.notificationSubtitle,
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                notification.date,
                style: AppTextStyles.notificationSubtitle,
              ),
              SizedBox(height: 4.h),
              Text(
                notification.time,
                style: AppTextStyles.notificationTime,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
