import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/patients_List_controller.dart';
import 'package:my_patients/view/patients_page/widgets/itemForm.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo.png', // Make sure this path is correct and added in pubspec.yaml
                height: 40,
              ),
              const SizedBox(width: 10),
              Text(
                "Mes patients",
                style: AppTextStyles.appBarText,
              ),
            ],
          ),
          backgroundColor: AppColors.appBarColor,
        ),
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: BoxConstraints(maxWidth: 700),
            child: Obx(
          () => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : controller.patients.isEmpty
              ? Center(
                  child: Text(
                    'Aucune patient trouvée',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  itemCount: controller.patients.length,
                  itemBuilder: (context, index) {
                    return ItemForm(
                      patient: controller.patients[index],
                      con_text: context,
                    );
                  },
                ),
    ),
          ),
        ),
      ),
    );
  }
}
