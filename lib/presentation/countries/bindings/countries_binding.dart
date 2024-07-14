import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/countries/controller/countries_controller.dart';

class CountriesBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CountriesController()); 
  }

}