import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/patients_List_controller.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/view/add_patient/add_patient.dart';
import 'package:my_patients/view/loginPage/login_page.dart';
import 'package:my_patients/view/notifyPage/notify_Page.dart';
import 'package:my_patients/view/patients_page/patients_page.dart';
import 'package:my_patients/view/widgets/my_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    double screenHeigh = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My patients", style: AppTextStyles.appBarText),
          backgroundColor: AppColors.appBarColor,
          actions: [IconButton(icon: Icon(Icons.logout), color: Colors.white,onPressed: ()=>Get.offAll(()=>LoginPage()),)],
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg2.jpg', // Make sure this path is correct and added in pubspec.yaml
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 700),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyButton(
                        text: "List des patients",
                        onPressed: () {
                          Get.to(() => PatientsPage());
                        },
                      ),
                      SizedBox(height: screenHeigh * 0.02),
                      MyButton(
                        text: "Ajouter un patient",
                        onPressed: () {
                          Get.to(() => AddPatient());
                        },
                      ),
                      SizedBox(height: screenHeigh * 0.02),
                      MyButton(
                        text: "Notification",
                        onPressed: () {
                          Get.to(() => NotifyPage());
                        },
                      ),
                      SizedBox(height: screenHeigh * 0.02),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
