import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/core/app_export.dart';

class PermissionHandle {
  static Future<bool> handleLocationPermission() async {
    MyServices myServices = Get.find();
    bool isLocation = false;

    await [
      Permission.location,
      Permission.notification,
      Permission.ignoreBatteryOptimizations,
      // Permission.accessNotificationPolicy,
      // Permission.scheduleExactAlarm,
    ].request();
    await Geolocator.getCurrentPosition();

    var locationPer = await Permission.location.status;
   

    if (locationPer.isDenied || locationPer.isRestricted) {
      AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.warning,
          animType: AnimType.scale,
          dismissOnTouchOutside: false,
          title: 'Location Denied',
          onDismissCallback: (type) {},
          desc: 'Please enable location for better performence',
          btnCancelOnPress: () {},
          btnOkText: "Reenable",
          btnOkOnPress: () {
            handleLocationPermission();
          })
        ..show();
    } else {
      isLocation = true;
      double lat = 0.0;
      double long = 0.0;

      Geolocator.getPositionStream().listen((Position position) {
        lat = position.latitude;
        long = position.longitude;
        myServices.sharedPreferences.remove("lat");
        myServices.sharedPreferences.remove("long");

        myServices.sharedPreferences
            .setString("lat", "${lat.toStringAsFixed(3)}");
        myServices.sharedPreferences
            .setString("long", "${long.toStringAsFixed(3)}");
        print("lat and long confirmed $lat - $long");
      });
    }

    // if (notificationPer.isDenied) {
    //   AwesomeDialog(
    //       context: Get.context!,
    //       dialogType: DialogType.warning,
    //       animType: AnimType.scale,
    //       dismissOnTouchOutside: false,
    //       title: 'Notifications Denied',
    //       onDismissCallback: (type) {},
    //       desc:
    //           'if notifications denied you will not be able to see the last weathers status',
    //       btnCancelOnPress: () {},
    //       btnOkText: "Reenable",
    //       btnOkOnPress: () {
    //         handleLocationPermission();
    //       })
    //     ..show();
    // }
    return isLocation;
  }

  static Future<void> handleNotificationsPermission() async {
    MyServices myServices = Get.find();
    await [Permission.notification].request();

     var notificationPer = await Permission.notification.status;

    if (notificationPer.isGranted) {
      myServices.sharedPreferences.setBool("notifiaction_status", false);
    } else {
      myServices.sharedPreferences.setBool("notifiaction_status", false);
    }

  }
}
