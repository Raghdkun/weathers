import 'dart:convert';
import 'package:weather_app/core/app_export.dart';
import '../../presentation/countries/model/countriesmodel.dart';

class CountriesCache {
  static Future<void> setCachedCountries(List<CountriesModel> countries) async {
    final serializedData =
        jsonEncode(countries.map((country) => country.toJson()).toList());
    MyServices myServices = Get.find();
    myServices.sharedPreferences.setString('countries_cache', serializedData);
  }
}
