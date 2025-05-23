import 'package:get/get.dart';
import 'package:my_patients/controller/patients_List_controller.dart';
import 'package:my_patients/controller/user_controller.dart';
import 'package:my_patients/core/notification/notify_service.dart';
import 'package:my_patients/model/notify_data.dart';

class NotificationController extends GetxController {
  Map<String, dynamic> data = {};
  var notifications = <Notify>[].obs;
  var isLoading = false.obs;
  var isError = false.obs;
  UserContrller user = Get.find();

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  void loadNotifications() {
    isLoading.value = true;
    Notify.getNotification(user.userID).listen((result) {
      if (result['data'] != null && result['data'] is Map) {
        data = Map<String, dynamic>.from(result['data'] as Map);
        notifications.value =
            data.entries.map((entry) {
              entry.value['id'] = entry.key;
              DateTime date = DateTime.parse(entry.key);
              String formattedDate = '${date.day}-${date.month}-${date.year}';
              String formattedTime = '${date.hour}:${date.minute}';
              entry.value['date'] = formattedDate;
              entry.value['time'] = formattedTime;
              return Notify.fromJson(Map<String, dynamic>.from(entry.value));
            }).toList();
      }
    });
    isLoading.value = false;
  }
}
