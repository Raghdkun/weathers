import 'package:flutter/material.dart';
import 'package:weather_app/presentation/countries/bindings/cities_bindings.dart';
import 'package:weather_app/presentation/countries/bindings/countries_binding.dart';
import 'package:weather_app/presentation/countries/view/citieswidget.dart';
import 'package:weather_app/presentation/initial_screen.dart/initial_lang_page.dart';
import 'package:weather_app/presentation/initial_screen.dart/initial_screen.dart_bindings.dart';
import 'package:weather_app/presentation/main_screen/view/home_view.dart';

import 'package:weather_app/presentation/main_screen/binding/main_screen_binding.dart';

import 'package:get/get.dart';
import 'package:weather_app/presentation/settings/pages/about.dart';
import 'package:weather_app/presentation/settings/pages/changelanguage.dart';
import 'package:weather_app/presentation/settings/pages/changemode.dart';
import 'package:weather_app/presentation/settings/pages/notification.dart';
import 'package:weather_app/presentation/settings/settings_bindings.dart';
import 'package:weather_app/presentation/settings/settings_page.dart';
import 'package:weather_app/presentation/splashscreen/binding/splashscreen_binding.dart';
import 'package:weather_app/presentation/splashscreen/view/splashscreen_view.dart';

import '../presentation/countries/view/selectcountry.dart';
import '../presentation/initial_screen.dart/initial_screen.dart_page.dart';
import '../presentation/initial_screen.dart/initial_screen_middleware.dart';

class AppRoutes {
  // static const String initialRoute = '/initialRoute';
  static const String initialRoute = '/initialpage';
  static const String initiallang = '/initiallang';

  static const String splashscreen = '/splashscreen';

  static const String mainScreen = '/mainscreen';
  static const String homescreen = '/homescreen';
  static const String homeview = '/homeview';
  static const String settings = '/settings';
  static const String selectcountry = '/selectcountry';
  static const String changemode = '/changeemode';
  static const String changelang = '/changelang';
  static const String notifications = '/notifications';

  static const String about = '/about';

  static const String countries = '/countries';
  static const String cities = '/cites';

  static List<GetPage> pages = [
    GetPage(name: initiallang, page: () => InitialLangPage(), bindings: [
      // InitialScreenDartBindings(),
    ], middlewares: [
      // IntialScreenMiddleWare()
    ]),
    GetPage(name: initialRoute, page: () => InitialScreenPage(), bindings: [
      InitialScreenDartBindings(),
    ], middlewares: [
      IntialScreenMiddleWare()
    ]),
    GetPage(
      name: splashscreen,
      page: () => SplashScreen(),
      bindings: [
        SplashScreenBinding(),
      ],
    ),
    GetPage(
      name: homeview,
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeOutCubic,
      transitionDuration: Duration(milliseconds: 1000),
      page: () => HomeView(),
      bindings: [
        MainScreenBinding(),
      ],
    ),
    GetPage(
      name: settings,
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeOutCubic,
      transitionDuration: Duration(milliseconds: 1000),
      page: () => SettingsPage(),
      bindings: [SettingsBindings()],
    ),
    GetPage(
      name: selectcountry,
      transition: Transition.native,
      curve: Curves.easeOut,
      transitionDuration: Duration(milliseconds: 1000),
      page: () => SelectCountry(),
      bindings: [CountriesBinding()],
    ),
    GetPage(
      name: changemode,
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeOutCubic,
      transitionDuration: Duration(milliseconds: 1000),
      page: () => ChangeMode(),
      bindings: [
        // SettingsBindings()
      ],
    ),
    GetPage(
      name: notifications,
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeOutCubic,
      transitionDuration: Duration(milliseconds: 1000),
      page: () => NotificationSettings(),
      bindings: [
        // SettingsBindings()
      ],
    ),
    GetPage(
      name: changelang,
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeOutCubic,
      transitionDuration: Duration(milliseconds: 1000),
      page: () => ChangeLanguage(),
      bindings: [
        // SettingsBindings()
      ],
    ),
    GetPage(
      name: about,
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeOutCubic,
      transitionDuration: Duration(milliseconds: 1000),
      page: () => About(),
      bindings: [
        // SettingsBindings()
      ],
    ),
    GetPage(
      name: cities,
      page: () => CitesWidget(),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeOutCubic,
      transitionDuration: Duration(milliseconds: 1000),
      bindings: [
        CitiesBinding(),
      ],
    ),
  ];
}
