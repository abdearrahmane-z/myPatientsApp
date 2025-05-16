import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:my_patients/controller/patients_List_controller.dart';
import 'package:my_patients/view/home/widgets/custom_appBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(

            child: Center(
              child: Column(
                children: controller.myPatients.isNotEmpty
                    ? [...controller.myPatients]
                    : [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            " No Patient Found",
                            style: TextStyle(fontSize: 50.spMin, fontWeight: FontWeight.bold, fontFamily: 'Italianno'),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                        // LoginForm(), // Uncomment this line to include the login form
                      ],
              ),
            ),
          ),
        
        floatingActionButton: FloatingActionButton(
          
          backgroundColor: Colors.blue.withOpacity(0.8),
          foregroundColor: Colors.white,
          onPressed: () {
            // Add your action here
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}