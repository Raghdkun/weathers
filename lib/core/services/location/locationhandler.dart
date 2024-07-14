import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import '../../app_export.dart';

class LocationHandler {
  static Future<void> giveLocationPermission({
    final void Function()? btnCancelOnPress,
    final void Function()? btnOkOnPress,
    final String? title,
    final String? btnOkText,
    final String? desc,
  }) async {
    bool serviceEnabled;

    LocationPermission permission;
    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    double lat = 0.0;
    double long = 0.0;

    permission = await Geolocator.checkPermission();

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled(); // def true
    if (!serviceEnabled) {
      permission = await Geolocator.requestPermission();

      if (!serviceEnabled) {
        sharedPreferences.setString("city", "false");
        Fluttertoast.showToast(
          msg: "Location permission is denied",
          fontSize: 17,
        );

        if (sharedPreferences.getString("lat") == null) {
          Fluttertoast.showToast(
            msg: "Location permission is denied",
            fontSize: 17,
          );
        } else {
          Position position = await Geolocator.getCurrentPosition(
              forceAndroidLocationManager: true);
          lat = position.latitude;
          long = position.longitude;
          sharedPreferences.setString("city", "true");
          sharedPreferences.setString("lat", "${lat.toStringAsFixed(3)}");
          sharedPreferences.setString("long", "${long.toStringAsFixed(3)}");
        }
      }
      print(
          " ========= >>>>>>&&& the last lat is ${lat.toStringAsFixed(3)} and the long is ${long.toStringAsFixed(3)}");
    }

    if (serviceEnabled) {
      Position position = await Geolocator.getCurrentPosition();
      lat = position.latitude;
      long = position.longitude;
      sharedPreferences.setString("city", "true");
      sharedPreferences.setString("lat", "${lat.toStringAsFixed(3)}");
      sharedPreferences.setString("long", "${long.toStringAsFixed(3)}");
      print(
          " ========= >>>>>>&&& the lat is ${lat.toStringAsFixed(3)} and the long is ${long.toStringAsFixed(3)}");
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Position? position = await Geolocator.getLastKnownPosition(
            forceAndroidLocationManager: true);
        lat = position!.latitude;
        long = position.longitude;
        sharedPreferences.setString("city", "true");
        sharedPreferences.setString("lat", "${lat.toStringAsFixed(3)}");
        sharedPreferences.setString("long", "${long.toStringAsFixed(3)}");
        print(
            " ========= >>>>>>&&& the last lat is ${lat.toStringAsFixed(3)} and the long is ${long.toStringAsFixed(3)}");
      }
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition();
      lat = position.latitude;
      long = position.longitude;
      sharedPreferences.setString("city", "true");
      sharedPreferences.setString("lat", "${lat.toStringAsFixed(3)}");
      sharedPreferences.setString("long", "${long.toStringAsFixed(3)}");
      print(
          " ========= >>>>>>&&& the last lat is ${lat.toStringAsFixed(3)} and the long is ${long.toStringAsFixed(3)}");
    } else {
      if (permission == LocationPermission.deniedForever) {
        sharedPreferences.setString("city", "false");

        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.warning,
          animType: AnimType.scale,
          dismissOnTouchOutside: false,
          title: title ?? 'Enable Location',
          onDismissCallback: (type) {},
          desc: desc ?? 'Please enable location for better performence',
          btnCancelOnPress: btnCancelOnPress,
          btnOkText: btnOkText ?? "Enable location",
          btnOkOnPress: btnOkOnPress,
        )..show();
      }
    }
    return;
  }
}
