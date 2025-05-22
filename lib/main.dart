import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_patients/core/notification/notify_service.dart';
import 'package:my_patients/view/home/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_patients/view/loginPage/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print("Firebase initialization error: $e");
  }
  NotifyService().initNotify();
  NotifyService().initNotiication();

  FirebaseMessaging.instance.subscribeToTopic("allUsers");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mes Patients',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: LoginPage(),
        );
      },
    );
  }
}
