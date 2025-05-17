import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_patients/controller/notification_controller.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';

class NotifyPage extends StatelessWidget {
  const NotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController notificationController = NotificationController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications', style: AppTextStyles.appBarText),
          backgroundColor: AppColors.appBarColor.withOpacity(0.8),
        ),
        backgroundColor: AppColors.backgroundColor,
        body: ListView.builder(
          itemCount: notificationController.notification.length,
          itemBuilder: (context, index) {
            String patientID = notificationController.notification.keys.elementAt(index);
            Map<String, String> details = notificationController.notification[patientID]!;
            return GestureDetector(
              onTap: () => notificationController.onNotificationTap(patientID),
              child: Card(
                margin: EdgeInsets.all(8.w),
                child: ListTile(
                      leading: Icon(Icons.notifications, color: AppColors.secondaryColor),
                      title: Text(details["patient"] ?? '', style: AppTextStyles.notificationTitle),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              Text('${details["title"] ?? ''}', style: AppTextStyles.notificationSubtitle),
              
                        ],
                      ),
                      trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${details["date"] ?? ''}', style: AppTextStyles.notificationSubtitle),
                  SizedBox(height: 4.h),
                  Text('${details["time"] ?? ''}', style: AppTextStyles.notificationTime),
                ],
              ),
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
