import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/core/app_export.dart';

class InitialPermissionGiver {
  static Future<void> handler() async {
    MyServices myServices = Get.find();

    await [
      Permission.location,
      Permission.notification,
      Permission.ignoreBatteryOptimizations,
      // Permission.accessNotificationPolicy,
      // Permission.scheduleExactAlarm,
    ].request();

    var notificationPer = await Permission.notification.status;

    if (notificationPer.isGranted) {
      myServices.sharedPreferences.setBool("notifiaction_status", false);
    } else {
      myServices.sharedPreferences.setBool("notifiaction_status", false);
    }
  }
}
