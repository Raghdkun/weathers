import 'dart:async';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/core/services/notificationservices.dart';
import 'package:weather_app/presentation/main_screen/controller/main_screen_controller.dart';
import 'package:auto_start_flutter/auto_start_flutter.dart';

class BackGroundNotiService {
  static Future<void> initAutoStart() async {
    // check auto-start availability.
    bool? availability = await isAutoStartAvailable;
    if (availability != null) {
      // var test = await (availability as FutureOr<bool>);
      print(availability);
      // if available then navigate to auto-start setting page.
      if (!availability) {
        await getAutoStartPermission();
      }
    }
  }

  static void controlService({required final bool isStart}) async {
    await initializeService(isStart: isStart);
    print("background services stops");
  }

  static Future<void> initializeService({final bool? isStart}) async {
    final service = FlutterBackgroundService();
    print(" background is $isStart");
    await service.configure(
      androidConfiguration: AndroidConfiguration(
        // this will be executed when app is in foreground or background in separated isolate
        onStart: onStart,
        notificationChannelId: 'my_foreground',
        initialNotificationTitle: 'my service',
        initialNotificationContent: 'the service is started',
        foregroundServiceNotificationId: 888,

        // auto start service

        autoStart: isStart ?? true,

        isForegroundMode: false,
      ),
      iosConfiguration: IosConfiguration(
        onBackground: iosBackgroundStart,
      ),
    );
  }

  static Future<bool> iosBackgroundStart(ServiceInstance service) async {
    Get.put(MainScreenController());
    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    Timer.periodic(
        Duration(minutes: sharedPreferences.getInt("notificationTimer") ?? 30),
        (timer) async {
      // def is 3 hours
      MainScreenController controller = Get.find();

      MainScreenController().getNewData();
      var event = controller.dayFunction();

      var city =
          controller.location.region ?? sharedPreferences.getString("city");
      var status = controller.conditionText;
      var temp = controller.current.tempC;
      var day = controller.current.isDay.toString();
      var conditionCode = controller.conditionCode;
      var feelslike = controller.feelslike;
      // var icon = controller.gotImage(conditionCode, day) ;
      // var code = controller.current.condition!.code ;
      // String data = controller.current.tempC;

      NotificationServices.showNotification(
        artitle: "$city ${Emojis.smile_star_struck}",
        arbody:
            "$event  \n درجة الحرارة اليوم ${temp}º ${Emojis.icon_dizzy} , اضغط هنا لتفاصيل اكثر ${Emojis.emotion_blue_heart}${Emojis.emotion_blue_heart}",
        title: "$city City ${Emojis.smile_star_struck}",
        actionType: ActionType.Default,
        body:
            "$event \ntoday is $status , the temperature is ${temp}º${Emojis.icon_dizzy} and it feels like $feelslikeº , click here for more info, Have a good day~ ${Emojis.emotion_blue_heart}${Emojis.emotion_blue_heart}",
        payload: {
          'navigate': 'true',
          "event": event.toString(),
          "status": status.toString(),
          "temp": temp.toString(),
          "city": city!,
          "condtioncode": conditionCode,
          "day": day.toString(),
          "feelslike": feelslike.toString(),
        },
        category: NotificationCategory.Status,
        // icon: icon,
        actionButton: [],
        notificationLayout: NotificationLayout.BigText,
        scheduled: false,
      );
    });
    return true;
  }

  static onStart(ServiceInstance service) async {
    Get.put(MainScreenController());
    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    //   var boxdata = await Hive.openBox("data");
    // Map mapData = boxdata.get("data");

    if (sharedPreferences.getBool("notifiaction_status") == true) {
       Timer.periodic(
        Duration(minutes: sharedPreferences.getInt("notificationTimer") ?? 30),
        (timer) async {
      // def is 3 hours
      MainScreenController controller = Get.find();

      MainScreenController().getNewData();
      var event = controller.dayFunction();

      var city =
          controller.location.region ?? sharedPreferences.getString("city");
      var status = controller.conditionText;
      var temp = controller.current.tempC;
      var day = controller.current.isDay.toString();
      var conditionCode = controller.conditionCode;
      var feelslike = controller.feelslike;
      // var icon = controller.gotImage(conditionCode, day) ;
      // var code = controller.current.condition!.code ;
      // String data = controller.current.tempC;

      NotificationServices.showNotification(
        artitle: "$city ${Emojis.smile_star_struck}",
        arbody:
            "$event  \n درجة الحرارة اليوم ${temp}º ${Emojis.icon_dizzy} , اضغط هنا لتفاصيل اكثر ${Emojis.emotion_blue_heart}${Emojis.emotion_blue_heart}",
        title: "$city ${Emojis.smile_star_struck}",
        actionType: ActionType.Default,
        body:
            "$event \ntoday is $status , the temperature is ${temp}º${Emojis.icon_dizzy} and it feels like $feelslikeº , click here for more info, Have a good day~ ${Emojis.emotion_blue_heart}${Emojis.emotion_blue_heart}",
        payload: {
          'navigate': 'true',
          "event": event.toString(),
          "status": status.toString(),
          "temp": temp.toString(),
          "city": city!,
          "condtioncode": conditionCode,
          "day": day.toString(),
          "feelslike": feelslike.toString(),
        },
        category: NotificationCategory.Status,
        // icon: icon,
        // bigPicture: controller.gotImage(conditionCode, day.toString()),
        actionButton: [],
        // bigPicture: "${AssetsImages.tornado}",
        // icon: "${AssetsImages.tornado}",

        notificationLayout: NotificationLayout.BigText,
        scheduled: false,
      );
    });
    } else {
      print("no notifications"); 
    }
  }
}
