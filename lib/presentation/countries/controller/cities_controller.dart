import 'package:weather_app/core/app_export.dart';
import '../model/countriesmodel.dart';

class CitiesController extends GetxController {
  // List<CountriesModel> cities = Get.arguments['countriesmodel'] ;

  late List<CountriesModel> cities;

  late CountriesModel countriesModel;

  MyServices myServices = Get.find();

  getcityAndGoTomainScreen(city) {
    Get.offAllNamed(AppRoutes.homeview, arguments: {'result': city ?? "null" });
    myServices.sharedPreferences.setString("location", "false");
    myServices.sharedPreferences.setString("city", "true");
    
    myServices.sharedPreferences.setString("namecity", city);
  }

  @override
  void onInit() {
    countriesModel = Get.arguments['countriesmodel'];
    cities = Get.arguments['cities'];
    super.onInit();
  }
}
