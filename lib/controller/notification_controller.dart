import 'package:get/get.dart';
import 'package:my_patients/core/testData.dart';
import 'package:my_patients/model/notify_page_data.dart';


class NotificationController  extends GetxController {
  var notifications = <Notify>[];
  var isLoading = false.obs;
  var isError = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }
  void loadNotifications() {
    isLoading.value = true;
    notifications = Testdata().testNotification.entries.map((entry) {
      entry.value['id'] = entry.key; // Add the key as the id
      return Notify.fromJson(entry.value);
    }).toList();
    isLoading.value = false;
  }

}