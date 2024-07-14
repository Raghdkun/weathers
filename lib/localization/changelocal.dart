import 'package:weather_app/core/app_export.dart';

class Changelocal extends GetxController {
  MyServices myServices = Get.find();
  Locale? language;

  changeLocal(String langcode) async {
    Locale locale = Locale(langcode);
    await myServices.sharedPreferences.setString("lang", langcode);
    //  await Jiffy.setLocale(langcode);


    Get.updateLocale(locale);
  }

  // other methods

  // getLocation() async {
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData locationData;
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //     locationData = await location.getLocation();
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  // }
  // }

  @override
  void onInit() async {
    // getLocation();

    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    //  await Jiffy.setLocale('ar');
      // await AwesomeNotifications().setLocalization(languageCode: 'ar');
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    //  await Jiffy.setLocale('en_us');

      // await AwesomeNotifications().setLocalization(languageCode: 'en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
