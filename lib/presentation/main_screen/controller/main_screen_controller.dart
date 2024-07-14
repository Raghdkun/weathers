import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:intl/intl.dart';
// import 'package:location/location.dart';
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/core/utils/handlingdatacontroller.dart';
import 'package:weather_app/data/remote/currentdatalocation.dart';
import 'package:weather_app/presentation/main_screen/model/weathermodel.dart';
import '../../../data/remote/currentdata.dart';

// import 'package:weather_app/presentation/mobile_dash_screen/models/weathermodel.dart';

class MainScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late SharedPreferences sharedPreferences;
  Locations location = Locations();
  Current current = Current();
  Forecast forecast = Forecast();
  Forecastday forecastday = Forecastday();
  Astro astro = Astro();
  PageController pageController = PageController();
  ScrollController scrollController = ScrollController();
  ScrollController outerScrollController = ScrollController();
  DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();
  double opacity = 0.0;
  int comIndex = 0;
  late LoadDataState loadDataState;
  ColorScheme currentColorScheme = ColorScheme.dark();
  late AnimationController animationController;
  late Animation<double> animation;
  // late Animation<double> animation;
  final Map<Page, Animation<double>> animations = {};
  int currentPage = 0;
  // late TabController tabController;
  Day day = Day();
  Conditions conditions = Conditions();
  HoursModel hoursModel = HoursModel();
  CurrentData currentData = CurrentData(ApiConnect());
  CurrentDataLocation currentDataLocation = CurrentDataLocation(ApiConnect());
  double heights = 0.0;
  IndicatorController indicatorController = IndicatorController();
  double animationValue = 0.0;

  int rainChance = 0;

  String rowimgRes = '';
  List<Current> data = [];
  List newData = [];
  List hoursList = [];
  List<HoursModel> ForecastHoursList = [];
  List<Forecastday> forecastdayList = [];
  List<Day> dayLisa = [];
  ValueNotifier<double> valueNotifier = ValueNotifier(0);
  // MyServices myServices = Get.find();
  var city;
  var varHourlist;
  var conditionCode;
  var conditionText;
  var feelslike;
  int windDegree = 0;
  String windDir = "";
  int humidity = 0;
  String precip_mm = '';
  double animatedContanerHeight = 50;
  // String
  String? name;
  String condtionCode = "code";
  String tempc = "temp_c";
  String sunrise = '';
  bool isAnimationRunning = true;

  var lat;
  var long;

  changeContanerindex(wid1, wid2, wid3) {
    switch (comIndex) {
      case 1:
        return FadeInUp(
          key: Key("1"),
          child: wid2,
          duration: Durations.long3,
        );

      case 2:
        return FadeInUp(
          key: Key("2"),
          child: wid3,
          duration: Durations.long3,
        );

      default:
        return FadeInUp(
          key: Key("0"),
          child: wid1,
          duration: Durations.long3,
        );
    }
  }

  void toggleAnimation() {
    // isAnimationRunning = !isAnimationRunning;
    if (indicatorController.isDragging) {
      animationController.repeat();
      update();
    } else {
      animationController.stop();
      update();
    }
  }

  getAccentColor(int index) {
    switch (index) {
      case 1:
        return Color(0xFF003355);
      default:
        return Color(0xFF1C1B1F);
    }
  }

  getDayColor(isDay) {
    if (Get.isDarkMode) {
      switch (isDay) {
        case 0:
          // update();

          return Color(0xFF2b5876);
        case 1:
          // update();

          return Color(0xFF4e4376);

        default:
          // update();

          return Color(0xFF2b5876);
      }
    } else {
      switch (isDay) {
        case 0:
          // update();
          return Color(0xFF348AC7);
        case 1:
          // update();

          return Color(0xFF7474BF);

        default:
          // update();

          return Color(0xFF348AC7);
      }
    }
  }

  refreshPage() {
    loadDataState = LoadDataState.loading;

    newData.clear();
    ForecastHoursList.clear();
    forecastdayList.clear();
    dayLisa.clear();
    hoursList.clear();
    getNewData();
  }

  double convertHumidity(humidity) {
    double result = humidity / 100;
    return result;
  }

  calculateDynamicHeight(number, percentage) {
    number = number - (number * percentage);
  }

  windListFun(windkph, winddegree, winddir) {}

  getcondtion(iconstr) {
    String condtion = 'icon';

    int iconcode = int.parse(condtion);

    String iconstr = iconcode.toString();

    return iconstr;
  }

  changeAppColor(isDay) {
    return getDayColor(isDay);
  }

  void changePage(int newPage) {
    if (newPage != currentPage) {
      pageController.animateToPage(newPage,
          duration: animationController.duration!, curve: Curves.bounceIn);
    }
  }

  getDayname(String datetime) {
    // DateTime now = DateTime.now();

    Jiffy currentDate = Jiffy.now();
    String currentDayName = currentDate.format(pattern: 'EEEE');

    Jiffy date = Jiffy.parse(datetime);
    String dayName = date.format(pattern: 'EEEE');
    switch (sharedPreferences.getString("lang")) {
      case "ar":
        if (dayName == currentDayName) {
          return 'اليوم';
        } else {
          return dayname(dayName);
        }
      case "en":
        if (dayName == currentDayName) {
          return 'Today';
        } else {
          return dayName;
        }
    }
  }

  dayname(dayName) {
    if (sharedPreferences.getString("lang") != "en") {
      switch (dayName) {
        case "Monday":
          return "الإثنين";
        case "Tuesday":
          return "الثلاثاء";
        case "Wednesday":
          return "الاربعاء";
        case "Thursday":
          return "الخميس";
        case "Friday":
          return "الجمعة";
        case "Saturday":
          return "السبت";
        case "Sunday":
          return "الأحد";

        default:
          return dayName;
      }
    } else {
      return dayName;
    }
  }

  parseTemp(temp) {
    var thedouble = double.parse(temp);
    return thedouble.toInt().toString();
  }

  getCode(index) {
    //  int index = 0;
    var res = hoursList[index];

    print("imges res =====>>>>>>> $res['condition']");
    return res['condition'];
  }



  Future<String> getlangData() async {
    String lang = "en";
    sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString("lang") == "en") {
      lang = "en";
    } else {
      lang = "ar";
    }

    return lang;
  }

  getNewData() async {
    loadDataState = LoadDataState.loading;

    var response;
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('location') == "false") {
      response =
          await currentData.getData(sharedPreferences.getString('namecity'));
      // var boxdata = await Hive.openBox("data");
      //  await Hive.box("data");

      // boxdata.put("data", response);
      // Map mapData = boxdata.get("data");
      // print("this is box data ->> $mapData");

      loadDataState = handlingData(response);
      // String lat = "${sharedPreferences.getString("lat")}";
      // String long = "${sharedPreferences.getString("long")}";
      // response = await currentDataLocation.getData(lat, long);
    } else {
      String lat = "${sharedPreferences.getString("lat")}";
      String long = "${sharedPreferences.getString("long")}";
      loadDataState = handlingData(response);
      response = await currentDataLocation.getData(lat, long);
      // var boxdata = await Hive.openBox("data");

      // boxdata.put("data", response);
      // Map mapData = boxdata.get("data");
      // print("this is box data ->> $mapData");
    }
    var locationRes = response["location"];
    print(">>>>>>>>>>>>>>> ${locationRes['name']}");
    location.name = locationRes['name'];
    location.region = locationRes['region'];
    // end location
    print(">>>>>>>>>>>>>>> ${response["location"]}");
    var currentRes = response["current"];
    print(">>>>>>>>>>>>>>> ${currentRes['temp_c']}");
    current.tempC = currentRes['temp_c'];
    current.isDay = currentRes['is_day'];
    current.lastUpdated = currentRes['last_updated'];
    feelslike = currentRes['feelslike_c'];
    windDegree = currentRes['wind_degree'];
    current.windKph = currentRes['wind_kph'];
    windDir = currentRes['wind_dir'];
    humidity = currentRes['humidity'];

    //
    current.visKm = currentRes['wind_kph'];
    current.windDegree = currentRes['wind_degree'];
    current.windDir = currentRes['wind_dir'];
    current.uv = currentRes['uv'];
    current.pressureMb = currentRes['pressure_mb'];
    var conditionRes = currentRes['condition'];
    print(">>>>>>>>>>>>>>> *** ${conditionRes}");
    conditions.code = conditionRes['code'];
    conditions.icon = conditionRes['icon'];
    conditions.text = conditionRes['text'];
    // current.condition!.text = conditionRes['text'];

    conditionText = conditionRes['text'];
    // current.condition!.text = conditionRes['text'];

    print(">>>>>>>>>>>>>>> *cooode** ${conditions.text}");
    current.tempF = currentRes['temp_f'];
    current.isDay = currentRes['is_day'];
    var forecast = response['forecast'];
    List forecastData = forecast['forecastday'];
    // var day = forecastData[1]['day'];
    // forecastday.day!.totalprecipMm = day['totalprecip_mm'];

    var astrores = forecastData[0]['astro'];
    astro.sunrise = astrores['sunrise'];
    astro.sunset = astrores['sunset'];
    astro.moonrise = astrores['moonrise'];
    astro.moonset = astrores['moonset'];
    astro.moonPhase = astrores['moon_phase'];
    // var ForecastHours = forecastData[]

    List hours = forecastData[0]['hour'];
    hoursList.addAll(hours);
    varHourlist = hours;

    List forHoursList = forecastData[0]['hour'];

    ForecastHoursList.addAll(forHoursList.map((e) => HoursModel.fromJson(e)));

    rainChance = ForecastHoursList[1].chanceOfRain!;
    print("this is rain chance ${rainChance}");

    print("------->> hours ${hoursList}");
    print("hours list --->> ${hoursList[1]['condition']['code']}");
    conditionCode = '${hoursList[1]['condition']['code']}';
    print("8888888888 ---->> $rowimgRes");
    List forecastDayData = forecast['forecastday'];
    forecastdayList.addAll(forecastDayData.map((e) => Forecastday.fromJson(e)));
    update();
    print(dayFunction());
  }

  translateStatus(code) {
    //need more work to code

    switch (sharedPreferences.getString("lang")) {
      case "ar":
        switch (code) {
          case "Clear":
            return "صافي";
          case "Partly Cloudy":
            return "غائم جزئياً";
          case "Cloudy":
            return "غائم";
          case "Overcast":
            return "غائم";
          case "Mist":
            return "ضبابي";
          case "Patchy rain possible":
            return "احتمالية هطول أمطار متقطعة";
          case "Patchy rain nearby":
            return "احتمالية هطول أمطار قريبة";
          case "Patchy snow possible":
            return "احتمالية تساقط ثلوج خفيفة على فترات";
          case "Patchy snow nearby":
            return "احتمالية تساقط ثلوج خفيفة على قريبة";
          case "Patchy sleet possible":
            return "احتمالية تساقط برد خفيف على فترات";
          case "Patchy freezing drizzle possible":
            return "إمكانية حدوث بَرَد متجمد على فترات";
          case "Thundery outbreaks possible":
            return "احتمال حدوث تدفقات رعدية";
          case "Blowing snow":
            return "تعصف ثلوج";
          case "Blizzard":
            return "عاصفة ثلجية";
          case "Fog":
            return "ضباب";
          case "Freezing fog":
            return "ضباب جامد";
          case "Patchy light drizzle":
            return "رذاذ خفيف غير منتظم";
          case "Light drizzle":
            return "رذاذ خفيف";
          case "رذار متجمد":
            return;
          case "Heavy freezing drizzle":
            return "رذاذ متجمد كثيف";
          case "Patchy light rain":
            return "أمطار خفيفة متقطعة";
          case "Light rain":
            return "مطر خفيف";
          case "Moderate rain at times":
            return "أمطار متوسطة أحياناً";
          case "Moderate rain":
            return "أمطار معتدلة";
          case "Heavy rain at times":
            return "أمطار غزيرة في بعض الأحيان";
          case "Heavy rain":
            return "مطر غزير";
          case "Light freezing rain":
            return "مطر متجمد خفيف";
          case "Moderate or heavy freezing rain":
            return "أمطار متجمدة متوسطة أو غزيرة";
          case "Light sleet":
            return "صقيع معتدل";
          case "Moderate or heavy sleet":
            return "صقيع معتدل أو ثقيل";
          case "Patchy light snow":
            return "ثلوج خفيفة غير منتظمة";
          case "Light snow":
            return "ثلوج خفيفة";
          case "Patchy moderate snow":
            return "ثلوج معتدلة غير منتظمة";
          case "Moderate snow":
            return "ثلوج معتدلة";
          case "Patchy heavy snow":
            return "ثلوج كثيفة غير منتظمة";
          case "Heavy snow":
            return "ثلوج كثيفة";
          case "Ice pellets":
            return "حبيبات الثلج";
          case "Light rain shower":
            return "زخات مطر خفيفة";
          case "Torrential rain shower":
            return "زخات مطر غزيرة";
          case "Light sleet showers":
            return "زخات مطر خفيفة";
          case "Moderate or heavy sleet showers":
            return "زخات مطر معتدلة أو غزيرة";
          case "Light snow showers":
            return "زخات ثلجية خفيفة";
          case "Moderate or heavy snow showers":
            return "زخات ثلجية متوسطة أو كثيفة";
          case "Light showers of ice pellets":
            return "زخات خفيفة من حبيبات الجليد";
          case "Moderate or heavy showers of ice pellets":
            return "زخات متوسطة أو غزيرة من حبات الجليد";
          case "Patchy light rain with thunder":
            return "أمطار خفيفة متفرقة مع الرعد";
          case "Moderate or heavy rain with thunder":
            return "أمطار متوسطة أو غزيرة مع الرعد";
          case "Patchy light snow with thunder":
            return "ثلوج خفيفة غير منتظمة مع الرعد";
          case "Moderate or heavy snow with thunder":
            return "ثلوج متوسطة أو كثيفة مع الرعد";
          case "Sunny":
            return "مشمس";
        }
      case "en":
        return code;
    }
  }

  classifyUVIndex(uvi) {
    switch (sharedPreferences.getString("lang")) {
      case "en":
        if (uvi != null) {
          if (uvi < 3) {
            return 'Low';
          } else if (uvi < 6) {
            return 'Moderate';
          } else if (uvi < 8) {
            return 'High';
          } else {
            return 'Very High';
          }
        }
      case "ar":
        if (uvi != null) {
          if (uvi < 3) {
            return 'خفيف';
          } else if (uvi < 6) {
            return 'متوسط';
          } else if (uvi < 8) {
            return 'عالي';
          } else {
            return 'عالي جداً';
          }
        }
    }
  }

  convertDouble(double) {
    String res = double;
    return res.toString();
  }

  gotImage(code, String isDay) {
    String image = code;
    RegExp regex = RegExp(r"[1-9]\d{2}");
    RegExpMatch? match = regex.firstMatch(image);
    if (match != null) {
      print("---------------......>> ${match.group(0)}"); // Output: 113
    }

    switch (isDay) {
      case "0":
        return '${AssetsImages.nightDay}/${match!.group(0)}.svg';
      case "1":
        return '${AssetsImages.lightDay}/${match!.group(0)}.svg';
      default:
    }
  }

  getTranslateItMoonPhase(moonPhase) {
    MyServices myServices = Get.find();
    switch (myServices.sharedPreferences.getString("lang")) {
      case "ar":
        switch (moonPhase) {
          case "New Moon":
            return "جديد";
          case "Waxing Crescent":
            return "هلال";
          case "First Quarter":
            return "الربع الأول";
          case "Waxing Gibbous":
            return "مُحدب";
          case "Full Moon":
            return "متكامل";
          case "Waning Gibbous":
            return "أحدب متناقص";
          case "Last Quarter":
            return "الربع الأخير";
          case "Waning Crescent":
            return "هلال متضائل";
        }
      case "en":
        return moonPhase;
    }
  }

  gotforecastImage(
    String code,
  ) {
    String image = code;

    RegExp regex = RegExp(r"[1-9]\d{2}");
    RegExpMatch? match = regex.firstMatch(image);

    if (match != null) {
      print("---------------......>> ${match.group(0)}"); // Output: 113\
      return '${AssetsImages.lightDay}/${match.group(0)}.svg';
    }
  }

  String dayFunction() {
    String res = "";

    if (sharedPreferences.getString("lang") == "en") {
      if (current.isDay == 0.0) {
        res = "Good Evening ${Emojis.moon_new_moon_face}";
      } else {
        res = "Good Morning ${Emojis.sun_sun_with_face}";
      }
    }
    if (sharedPreferences.getString("ar") == "ar") {
      if (current.isDay == 0.0) {
        res = "${Emojis.moon_new_moon_face}مساء الخير";
      } else {
        res = "${Emojis.sun_sun_with_face}صباح الخير";
      }
    }
    return res;
  }

  gethours(timeepoch) {
    var dateTime = DateFormat('h a ').format(DateTime.parse(timeepoch));

    return dateTime.toString();
  }

  bool isTheTime202312220400(String time) {
    final formatter = DateFormat('yyyy-MM-dd HH:mm');
    final dateTime = formatter.parse(time);
    final now = DateTime.timestamp();

    if (formatter.format(dateTime) == formatter.format(now)) {
      return true;
    } else {
      return false;
    }
  }

  removeHours(hourstime, index) {
    final formatter = DateFormat('yyyy-MM-dd HH:mm');
    if (hoursList[index]['time'] <= formatter) {
      hoursList.removeWhere((element) => element = index);
      update();
    }
  }

  @override
  void onInit() {
    // tabController = TabController(
    //     length: 2,
    //     vsync: this,
    //     animationDuration: Duration(milliseconds: 1500));

    animationController = AnimationController(
      vsync: this,
      duration: Durations.extralong1,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    // animation = animationController.derive()
    Get.put(MyServices());

    getNewData();

    super.onInit();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    animationController.dispose();
    print("closed");
    super.onClose();
  }
}
