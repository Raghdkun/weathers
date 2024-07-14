import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app/core/services/notificationbackground.dart';
import 'package:weather_app/core/services/services.dart';
import 'package:weather_app/presentation/initial_screen.dart/initial_permission_giver.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  late bool activeNotification;
  late int notificationsTimer;

  getthemeSign(widget) {
    if (myServices.sharedPreferences.getString("theme") == "light") {
      return widget;
    } else {
      return widget;
    }
  }

  submitMenu(value) {
    value = notificationsTimer;
    myServices.sharedPreferences
        .setInt("notificationTimer", notificationsTimer);
    // value = myServices.sharedPreferences.setInt("notificationTimer", value);
    Fluttertoast.showToast(
      msg: "Remove the app from the background and restart it to apply changes"
          .tr,
    );
    update(); 
  }

  notificationsSwitcher(avtiveNotification) async {
    // saved the bool val in the storage
    myServices.sharedPreferences
        .setBool("notifiaction_status", avtiveNotification);
    BackGroundNotiService.controlService(isStart: avtiveNotification);

    Fluttertoast.showToast(
      msg: "Remove the app from the background and restart it to apply changes"
          .tr,
    );

    update();
  }

  lanchurl(url) {
    return launchUrl(Uri.parse(url));
  }

  @override
  void onReady() {
    InitialPermissionGiver.handler();

    super.onReady();
  }

  @override
  void onInit() {
    activeNotification =
        myServices.sharedPreferences.getBool("notifiaction_status") ?? true;
    notificationsTimer =
        myServices.sharedPreferences.getInt("notificationTimer") ?? 30;
    super.onInit();
  }
}
