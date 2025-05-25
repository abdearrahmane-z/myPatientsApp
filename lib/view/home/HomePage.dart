import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_patients/controller/patients_List_controller.dart';
import 'package:my_patients/core/constants/colors.dart';
import 'package:my_patients/core/constants/text_styles.dart';
import 'package:my_patients/view/add_patient/add_patient.dart';
import 'package:my_patients/view/loginPage/login_page.dart';
import 'package:my_patients/view/notifyPage/notify_Page.dart';
import 'package:my_patients/view/patients_page/patients_page.dart';
import 'package:my_patients/view/widgets/my_button2.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    double screenHeigh = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo.png', // Make sure this path is correct and added in pubspec.yaml
                height: 40,
              ),
              const SizedBox(width: 10),
              Text("Mes patients", style: AppTextStyles.appBarText),
            ],
          ),
          backgroundColor: AppColors.appBarColor,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              color: Colors.white,
              onPressed: () => Get.offAll(() => LoginPage()),
            ),
          ],
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 700),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/blueLogo.png',
                      height: 100.spMin,
                    ),
                    SizedBox(height: screenHeigh*0.02,),
                    // Add bienvenue word
                    Text(
                      "Bienvenue",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appBarColor,
                        fontFamily: 'Italianno',
                      ),
                    ),
                    SizedBox(height: screenHeigh*0.05,),
                    MyButton2(
                      text: "List des patients",
                      onPressed: () {
                        Get.to(() => PatientsPage());
                      },
                    ),
                    SizedBox(height: screenHeigh * 0.02),
                    MyButton2(
                      text: "Ajouter un patient",
                      onPressed: () {
                        Get.to(() => AddPatient());
                      },
                    ),
                    SizedBox(height: screenHeigh * 0.02),
                    MyButton2(
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
        ),
      ),
    );
  }
}
