import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:my_patients/view/notifyPage/notify_Page.dart';

class NotifyService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  //initialize
  Future<void> initNotiication() async {
    if (_isInitialized) return;

    const AndroidInitializationSettings initSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initSettingsIOS = DarwinInitializationSettings(

    );

    const InitializationSettings initSetting = InitializationSettings(
      android:initSettingsAndroid,
      iOS: initSettingsIOS );
    }



  // //instence
  // final _firebaseNotify = FirebaseMessaging.instance;
  // // init notify
  // Future<void> initNotify() async {
  //   await _firebaseNotify.requestPermission();
  //   String? token = await _firebaseNotify.getToken();
  //   print(token);
  //   handleBackgroundNotify();
  // }

  // //handle notify
  // void handleMessage(RemoteMessage? message) {
  //   message.isNull ? print("") : Get.to(() => NotifyPage());
  // }

  // //handle background run
  // Future handleBackgroundNotify() async {
  //   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  //   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  // }
}
