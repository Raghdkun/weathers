import 'package:weather_app/core/app_export.dart';

class MyServices extends GetxService {
  
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    // await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();

  
    return this;
  }
  
}



initialServices() async {
  await Get.putAsync(() => MyServices().init());
}