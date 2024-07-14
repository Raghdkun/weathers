import 'package:weather_app/core/app_export.dart';


class CurrentDataLocation {
  ApiConnect apiConnect;
  // MyServices myServices = Get.find();
  late SharedPreferences sharedPreferences;


  CurrentDataLocation(this.apiConnect);
//String q
  getData(String lat, String long) async {
    sharedPreferences = await SharedPreferences.getInstance();

    var response = await apiConnect.postData(EndPoints.forecastData, {
      
      "key": ApiKey,
      "q": "${lat},${long}",
      "days": "7",
      "aqi": "no",
      "lang":"en"
      //  myServices.sharedPreferences.getString("lang"),
    });
    return response.fold((l) => l, (r) => r);
  }
}
