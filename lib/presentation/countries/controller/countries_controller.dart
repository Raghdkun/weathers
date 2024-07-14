import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/app_export.dart';
import 'package:weather_app/core/services/permissionhandler.dart';
import 'package:weather_app/core/utils/handlingdatacontroller.dart';
import 'package:weather_app/data/cache/cachedcountries.dart';
import 'package:weather_app/data/remote/country/countrydata.dart';
import '../model/countriesmodel.dart';

class CountriesController extends GetxController {
  CountriesData countriesData = CountriesData(ApiConnectGet());
  late SharedPreferences sharedPreferences;
  double lat = 0.0;
  double long = 0.0;

  CountriesModel countriesModel = CountriesModel();

  late LoadDataState loadDataState;

  List<CountriesModel> data = [];
  List<CountriesModel> searchList = [];

  MyServices myServices = Get.find();

  late TextEditingController textController;

  findUserLocation() async {
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled(); // def true
    PermissionHandle.handleLocationPermission();

    if (serviceEnabled) {
      PermissionHandle.handleLocationPermission();

      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.info,
        animType: AnimType.scale,
        dismissOnTouchOutside: false,
        title: '',
        btnCancelText: "Cancel".tr,
        showCloseIcon: true,
        onDismissCallback: (type) {},
        desc:
            'Are you sure that you want to change your city based on your location?'
                .tr,
        btnCancelOnPress: () {},
        btnOkText: "Sure".tr,
        btnOkOnPress: () {
          myServices.sharedPreferences.setString("location", "true");
          myServices.sharedPreferences.setString("city", "false");
          Get.offAllNamed(AppRoutes.homeview);
          Fluttertoast.showToast(
            msg: "Location changed".tr,
          );
        },
      )..show();
    } else {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.warning,
        animType: AnimType.scale,
        dismissOnTouchOutside: false,
        title: 'Location Permission'.tr,
        showCloseIcon: true,
        onDismissCallback: (type) {},
        desc:
            'Please click on enable button and reclick on it to make this service run'
                .tr,
        btnCancelOnPress: () {},
        btnOkText: "Enable".tr,
        btnCancelText: "Cancel".tr,
        btnOkOnPress: () async {
          PermissionHandle.handleLocationPermission();
        },
      )..show();
    }
  }

  Future<List<CountriesModel>> getCountries() async {
    loadDataState = LoadDataState.loading;
    // final sharedPreferences = Get.find<MyServices>().sharedPreferences;
    // final cachedData = await sharedPreferences.getString('countries_cache');
    // loadDataState = handlingData(cachedData);
    // if (cachedData != null) {
    //   print("Cached data: $cachedData");

    //   // Attempt to parse cached data
    //   List serializedCountries = jsonDecode(cachedData);

    //   final List<CountriesModel> cachedCountries = serializedCountries
    //       .map((country) => CountriesModel.fromJson(country))
    //       .toList();

    //   if (cachedCountries.isNotEmpty) {
    //     print("Using cached countries data.");
    //     data.addAll(cachedCountries);
    //     update();
    //     cachedCountries.shuffle();
    //     return cachedCountries;
    //   }
    // }

    print("Fetching new countries data.");
    final response = await countriesData.getData();
    loadDataState = handlingData(response);
    List res = response['data'];

    CountriesCache.setCachedCountries(
        res.map((e) => CountriesModel.fromJson(e)).toList());
    data.addAll(res.map((e) => CountriesModel.fromJson(e)));
    data.shuffle();
    update();

    return data;
  }

  goToCitiesPage(countriesModel) {
    Get.toNamed(AppRoutes.cities,
        arguments: {'countriesmodel': countriesModel, 'cities': data});
  }

  List<CountriesModel> searchedCards(
      String searchTerm, List<CountriesModel> cards) {
    return cards
        .where((card) =>
            card.country!.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
  }

  searchAndUpdate(String searchTerm) {
    List<CountriesModel> searchResults = searchedCards(searchTerm, data);
    searchList.clear();
    searchList.addAll(searchResults);
    // searchList = 1;
    update();
    return searchResults;
  }

  positionStream() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Geolocator.getPositionStream().listen((Position position) {
      lat = position.latitude;
      long = position.longitude;
      sharedPreferences.remove("lat");
      sharedPreferences.remove("long");

      sharedPreferences.setString("lat", "${lat.toStringAsFixed(3)}");
      sharedPreferences.setString("long", "${long.toStringAsFixed(3)}");
      update();
    });
  }

  @override
  void onInit() {
    getCountries();
    textController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
