import 'package:weather_app/core/app_export.dart';

class CurrentData {
  ApiConnect apiConnect;
  // MyServices myServices = Get.find();
  late SharedPreferences sharedPreferences;

  CurrentData(this.apiConnect);
//String q
  getData(city) async {
    sharedPreferences = await SharedPreferences.getInstance();

    var response = await apiConnect.postData(EndPoints.forecastData, {
      "key": ApiKey,
      "q": city,
      "days": "10",
      "aqi": "no",
      "lang": "en"
      //  myServices.sharedPreferences.getString("lang"),
    });
    return response.fold((l) => l, (r) => r);
  }
}
