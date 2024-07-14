import 'package:weather_app/core/app_export.dart';

class InitialScreenController extends GetxController {
  PageController pageController = PageController();
  MyServices myServices = Get.find();

  goToHomePage() async {
    myServices.sharedPreferences.setString("onBoarding", "true");
    Get.offAllNamed(AppRoutes.selectcountry);
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
