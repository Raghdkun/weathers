enum LoadDataState {
  initialize,
  loading,
  loaded,
  error,
  timeout,
  unknownerror,
  offline,
  serverfailure,
  none
}

const String current = 'current.json';
const String forecast = 'forecast.json';
const String ApiKey = '5bf5e7daca064588ac400227231902';

class EndPoints {
  const EndPoints._();

  static const String currentData = 'http://api.weatherapi.com/v1/$current';
  static const String forecastData = 'http://api.weatherapi.com/v1/$forecast';

  static const String countries =
      'https://countriesnow.space/api/v0.1/countries';
}

class AssetsImages {
  // Image folder path
  static String imagePath = 'assets/images';
  static String lottie = 'assets/lottie';
  static String nightDay = '$imagePath/iconsnight';
  static String lightDay = '$imagePath/iconsday';
  static String backgroundImg = '$imagePath/background';
  static String lottieLoading = '$lottie/loading.json';
  static String lottieNoconnection = '$lottie/noconnection.json';
  static String lottieNodata = '$lottie/nodata.json';
  static String lottieTimeout = '$lottie/timeout.json';
  static String lottieUnknownerror = '$lottie/unknownerror.json';
  static String day = 'assets/images/day';
  static String icons = 'assets/images/icons';
  static String night = 'assets/images/night';
}

getDayOrNight(code, int isDay) {
  String imageRes = "";

  if (isDay == 1) {
    String day = "${AssetsImages.day}/$code.png";
    imageRes = day;
  } else {
    String night = "${AssetsImages.night}/$code.png";
    imageRes = night;
  }

  return imageRes;
}
