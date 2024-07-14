import 'package:weather_app/core/app_export.dart';

class SplashScreenController extends GetxController {
  double lat = 0.0;
  double long = 0.0;

  // MyServices myServices = Get.find();
  late SharedPreferences sharedPreferences;

  splashScreenNav() async {
    sharedPreferences = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 4), () async {
      // 2s over, navigate to a new page

      if (sharedPreferences.getString("onBoarding") == "true") {
        if (sharedPreferences.getString("location") == "true" ||
            sharedPreferences.getString("city") == "true") {
          Get.offAllNamed(AppRoutes.homeview);
        }
        if (sharedPreferences.getString("city") == null) {
          Get.offAllNamed(AppRoutes.selectcountry);
        }
      } else {
        Get.offAllNamed(AppRoutes.initiallang);
      }
      // else {
      //   Position position = await Geolocator.getCurrentPosition();
      //   lat = position.latitude;
      //   long = position.longitude;
      //   sharedPreferences.setString("lat", "${lat.toStringAsFixed(3)}");
      //   sharedPreferences.setString("long", "${long.toStringAsFixed(3)}");
      //   print(
      //       " ========= >>>>>>&&& the last lat is ${lat.toStringAsFixed(3)} and the long is ${long.toStringAsFixed(3)}");

      //   Get.offAllNamed(AppRoutes.homeview);
      // }
    });
  }

  @override
  void onInit() {
    // sharedPreferences.setString("location", "false");
    splashScreenNav();

    super.onInit();
  }
}
