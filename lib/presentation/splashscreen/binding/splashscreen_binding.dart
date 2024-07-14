import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/splashscreen/controller/splashscreen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}
