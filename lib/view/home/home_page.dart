import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/patients_List_controller.dart';
import 'package:my_patients/view/add_patient/add_patient.dart';
import 'package:my_patients/view/home/widgets/custom_appBar.dart';
import 'package:my_patients/view/home/widgets/itemForm.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
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

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.withOpacity(0.8),
          foregroundColor: Colors.white,
          onPressed: () {
            Get.to(() => AddPatient());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
