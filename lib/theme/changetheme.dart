import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/theme/themedata.dart';

class Changetheme extends GetxController {
  MyServices myServices = Get.find();

  ThemeData? appTheme;

  // MainScreenController mainScreenController = Get.put(MainScreenController());

  changeTheme(String themename) {
    // myServices.sharedPreferences.remove("theme");
    myServices.sharedPreferences.setString("theme", themename);
    appTheme = themename == 'dark' ? themeDatadark : themeDatalight;
    update();

    Get.changeTheme(appTheme!);
     Fluttertoast.showToast(msg: "Theme changed",); 

    update();
  }

  @override
  void onInit() {
    String? sharedPrefTheme = myServices.sharedPreferences.getString("theme");

    if (sharedPrefTheme == "dark") {
      appTheme = themeDatadark;
      Get.changeTheme(themeDatadark);

      update();
    } else if (sharedPrefTheme == "light") {
      appTheme == themeDatalight;
      Get.changeTheme(themeDatalight);

      update();
    } else {
      appTheme = themeDatadark;
      Get.changeTheme(themeDatadark);

      update();
    }
    super.onInit();
  }
}
