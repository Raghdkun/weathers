import 'package:weather_app/core/app_export.dart';




class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // PrefUtils().init(); 
    Get.put(ApiConnect());
    Get.put(MyServices()) ;  
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    // Get.put(MainScreenController());

    
   

  }
}
