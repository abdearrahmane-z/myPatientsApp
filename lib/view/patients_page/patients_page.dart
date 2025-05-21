import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/patients_List_controller.dart';
import 'package:my_patients/view/patients_page/widgets/custom_appBar.dart';
import 'package:my_patients/view/patients_page/widgets/itemForm.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(),
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: BoxConstraints(maxWidth: 700),
            child: Obx(
              () =>
                  controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        itemCount: controller.patients.length,
                        itemBuilder: (context, index) {
                          return ItemForm(patient: controller.patients[index], con_text: context,);
                        },
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
