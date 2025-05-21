import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/patients_List_controller.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/model/notify_data.dart';
import 'package:my_patients/model/patients_data.dart';
import 'package:my_patients/view/detailPage/detail_page.dart';

class NotifyWidget extends StatelessWidget {
  const NotifyWidget({super.key, required this.notification});

  final Notify notification;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();

    return InkWell(
      onTap: () {
        Map<String, dynamic> dictPatient = Map<String, dynamic>.from(
          homeController.data[notification.id] as Map,
        );
        Patient patient = Patient.fromJson(dictPatient);
        print(patient.id);

        Get.to(
          () => DetailPage(
              patient: patient,
            )
        );
      },
      child: Card(
        margin: EdgeInsets.all(5.spMin),
        child: ListTile(
          leading: Icon(Icons.notifications, color: AppColors.secondaryColor),
          title: Text(
            notification.patientName,
            style: AppTextStyles.detailTitle,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.notificationMessage,
                style: AppTextStyles.detailSubtitle,
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(notification.date, style: AppTextStyles.detailSubtitle),
              SizedBox(height: 4.h),
              Text(notification.time, style: AppTextStyles.notificationTime),
            ],
          ),
        ),
      ),
    );
  }
}
