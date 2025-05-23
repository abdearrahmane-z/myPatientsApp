import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/detail_page_controller.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/model/patients_data.dart';

import 'widgets/historique.dart';
import 'widgets/real_time_value.dart';
import 'widgets/user_info.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, this.patient});
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    DetailPageController controller = Get.put(DetailPageController());
    controller.listentToPatient(patient!.id);

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
              Text("Mon patient", style: AppTextStyles.appBarText),
            ],
          ),
          backgroundColor: AppColors.appBarColor,
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                constraints: BoxConstraints(maxWidth: 700),
                width: double.infinity,
                child: Obx(() {
                  return Column(
                    children: [
                      UserInfoWidget(
                        screenHeight: screenHeight,
                        patient: patient,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      RealTimeValue(tension: controller.rlTension.value),
                      SizedBox(height: screenHeight * 0.02),
                      HistoriqueWidget(
                        data: controller.historique.cast<String, dynamic>(),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
