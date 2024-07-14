import 'package:weather_app/core/app_export.dart';

class IntialScreenMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    // if (myServices.sharedPreferences.getString("step") == "2") {
    //   return const RouteSettings(name: AppRoute.homepage);
    // }
    // if (myServices.sharedPreferences.getString("step") == "1") {
    //   return const RouteSettings(name: AppRoute.login);
    // }

    return null;
  }
}