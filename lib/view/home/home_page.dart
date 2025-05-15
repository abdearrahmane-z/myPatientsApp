import 'package:flutter/material.dart';
import 'package:my_patients/controller/home_controller.dart';
import 'package:my_patients/view/home/widgets/itemForm.dart';
import 'package:my_patients/view/home/widgets/custom_appBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    HomeController controller = HomeController();
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
                            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, fontFamily: 'Italianno'),
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