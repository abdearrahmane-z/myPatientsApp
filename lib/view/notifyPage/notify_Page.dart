import 'package:flutter/material.dart';
import 'package:my_patients/core/constants/text_styles.dart';

class NotifyPage extends StatelessWidget {
  const NotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Patients', style: AppTextStyles.appBarText),
          backgroundColor: Colors.blue.withOpacity(0.8),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children:
                  // controller.notification.isNotEmpty
                  //     ? [...controller.notification]
                  //     : 
                  [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            " No Notification Found",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Italianno',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
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
