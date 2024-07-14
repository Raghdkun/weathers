import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/presentation/countries/controller/cities_controller.dart';

class CitiesBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CitiesController()); 
  }

}