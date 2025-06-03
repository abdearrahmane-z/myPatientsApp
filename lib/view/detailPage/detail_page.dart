import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/detail_page_controller.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/model/patients_data.dart';
import 'package:my_patients/view/loginPage/login_page.dart';

import 'widgets/historique.dart';
import 'widgets/real_time_value.dart';
import 'widgets/user_info.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, this.patient, this.isFromHome = true});
  final Patient? patient;
  final bool isFromHome;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    DetailPageController controller = Get.put(DetailPageController());
    controller.listenToPatient(id: patient!.id);
    final RxBool showAncienne = false.obs;
    final RxBool showHistorique = false.obs;
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
          actions: [
            isFromHome?
            Obx(
              () => IconButton(
                onPressed: () {
                  controller.onEditiPatinet();
                },
                icon: Icon(
                  controller.edit.value ? Icons.save : Icons.edit,
                  color: AppColors.secondaryColor,
                ),
              ),
            ):
            IconButton(
              onPressed: () {
                Get.offAll(LoginPage());
              },
              icon: Icon(
                Icons.logout,
                color: AppColors.secondaryColor,
              ),
            ),
          ],
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
                      controller.rlTension.value==[] ?
                      Container():Container(),
                      Text("${patient?.id}", style: AppTextStyles.detailTitle2),
                      SizedBox(height: screenHeight * 0.02),
                      UserInfoWidget(
                        screenHeight: screenHeight,
                        patient: patient,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      RealTimeValue(tension: controller.rlTension.value),
                      SizedBox(height: screenHeight * 0.02),

                      // Ancienne mesures tab
                      Obx(
                        () => HistoriqueWidget(
                          color: Colors.blue,
                          data: controller.historiqueTension,
                          title: "Ancienne mesures",
                          show: showAncienne.value,
                          onPresse: () {
                            showAncienne.value = !showAncienne.value;
                            print(showAncienne.value);
                          },
                        ),
                      ),

                      Obx(
                        () => HistoriqueWidget(
                          color: Colors.red,
                          data: controller.historiquePics,
                          title: "Historique de pics",
                          show: showHistorique.value,
                          onPresse: () {
                            showHistorique.value = !showHistorique.value;
                          },
                        ),
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
