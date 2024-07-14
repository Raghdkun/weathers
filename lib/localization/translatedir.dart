import 'package:weather_app/core/app_export.dart';

translateText(enwidget, arwidget2) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == 'en') {
    return enwidget;
  } else {
    return arwidget2;
  }
}
