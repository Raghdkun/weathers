import 'package:app_settings/app_settings.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:weather_app/core/app_export.dart';

class CheckNetworkHandler {
  static Future<bool> networkListener() async {
    late SharedPreferences sharedPreferences;
    bool isConnected = false;
    sharedPreferences = await SharedPreferences.getInstance();
    final connectivity = Connectivity();
    final networkInfo = NetworkInfo(connectivity);
    networkInfo.onConnectivityChanged.listen((connectivityResult) async {
      if (connectivityResult == ConnectivityResult.none) {
        isConnected = false;
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          dismissOnTouchOutside: false,
          title: 'Internet Connection'.tr,
          onDismissCallback: (type) {},
          desc: "You can't use vortex weather without internet connection".tr,
          btnCancelOnPress: () {},
          btnOkText: "Enable",
          btnOkOnPress: () {
            AppSettings.openAppSettingsPanel(
                AppSettingsPanelType.internetConnectivity);
          },
        )..show();
      } else {
        isConnected = true;

        if (sharedPreferences.getString("lang") == "ar") {
          await AwesomeNotifications().setLocalization(languageCode: 'ar');
          //${sharedPreferences.getString("lang")}
        } else {
          await AwesomeNotifications().setLocalization(languageCode: 'en');
        }
      }
    });

    return isConnected;
  }
}
