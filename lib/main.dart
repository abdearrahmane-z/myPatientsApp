import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_patients/view/home/home_page.dart';
import 'package:my_patients/view/loginPage/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Patients',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:  HomePage(),
        );
      
  }
}
